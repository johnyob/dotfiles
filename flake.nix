{
  description = "nix system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    treefmt = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # This revision of Stylix is needed to avoid the following issue: 
    # https://github.com/nix-community/stylix/issues/1693. 
    stylix = {
      url = "github:danth/stylix/a14e525723c1c837b2ceacd8a37cba1f0b5e76c2";
      inputs.home-manager.follows = "home-manager";
    };

    haumea = {
      url = "github:nix-community/haumea/v0.2.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs:
    with inputs; let
      inherit (nixpkgs) lib;

      loadModulePaths = path:
        haumea.lib.load {
          src = path;
          loader = haumea.lib.loaders.path;
        };

      # Recursively collect all paths in a given directory
      # (typically module paths)
      allModulePathsIn = path:
        lib.attrsets.collect builtins.isPath (loadModulePaths path);

      sharedModules =
        allModulePathsIn ./modules/shared;

      homeModules = [nixvim.homeModules.nixvim
          stylix.homeModules.stylix 
       ]  ++ allModulePathsIn ./modules/home;

      darwinModules =
        [
          home-manager.darwinModules.home-manager
        ]
        ++ sharedModules
        ++ allModulePathsIn ./modules/darwin;

      mkDarwin = system: path: let
        modules = loadModulePaths path;

        userModules = modules.home or {};
        hostModules =
          lib.attrsets.collect builtins.isPath
          (builtins.removeAttrs modules ["home"]);

        hmUsers =
          lib.attrsets.mapAttrs
          (
            username: config: {...}: {
              imports = homeModules ++ [config];
              home.username = username;
            }
          )
          userModules;

        users =
          lib.attrsets.mapAttrs
          (
            username: _: {
              home = "/Users/${username}";
            }
          )
          userModules;
      in
        nix-darwin.lib.darwinSystem {
          specialArgs = {inherit inputs self system;};
          modules =
            darwinModules
            ++ hostModules
            ++ [
              {
                nixpkgs.hostPlatform = system;
                home-manager.extraSpecialArgs = {inherit inputs self system;};
                home-manager.users = hmUsers;
                users.users = users;
              }
            ];
        };
    in
      {
        darwinConfigurations = {
          earth = mkDarwin "aarch64-darwin" ./hosts/earth;
        };
      }
      // flake-utils.lib.eachDefaultSystem (system: let
        pkgs = nixpkgs.legacyPackages.${system};

        fmt = treefmt.lib.evalModule pkgs {
          projectRootFile = "flake.nix";
          programs.alejandra.enable = true;

          settings.global.excludes = ["result" ".direnv"];
        };
      in {
        formatter = fmt.config.build.wrapper;

        devShells = import ./shell.nix {inherit pkgs;};

        packages = import ./pkgs {inherit pkgs;};
      });
}
