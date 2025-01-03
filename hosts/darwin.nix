{
  inputs,
  outputs,
  self,
  nixpkgs,
  nix-darwin,
  home-manager,
}: let
  mkDarwin = system: hostModules: let
    pkgs = (import nixpkgs) {
      inherit system;
      config.allowUnfree = true;
    };
  in
    nix-darwin.lib.darwinSystem
    {
      inherit system;
      specialArgs = {inherit inputs outputs self system pkgs;};
      modules =
        [
          ./darwin-configuration.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {inherit inputs outputs self system pkgs;};
            home-manager.backupFileExtension = "backup";
          }
        ]
        ++ hostModules;
    };
in {
  earth = mkDarwin "aarch64-darwin" [./earth];
}
