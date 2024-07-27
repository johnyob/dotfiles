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
  };
  outputs = inputs:
    with inputs;
      {
        darwinConfigurations = (
          import ./hosts/darwin.nix {
            inherit inputs self nixpkgs nix-darwin;
          }
        );
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
      });
}
