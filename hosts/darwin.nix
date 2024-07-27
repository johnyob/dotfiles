{
  inputs,
  self,
  nixpkgs,
  nix-darwin,
  home-manager,
}: let
  mkDarwin = system: hostModules: let
    pkgs = (import nixpkgs) {inherit system;};
  in
    nix-darwin.lib.darwinSystem
    {
      inherit system;
      specialArgs = {inherit inputs self system pkgs;};
      modules =
        [
          ./darwin-configuration.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {inherit inputs self system pkgs;};
          }
        ]
        ++ hostModules;
    };
in {
  earth = mkDarwin "aarch64-darwin" [./earth];
}
