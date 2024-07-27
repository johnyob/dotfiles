{
  inputs,
  self,
  nixpkgs,
  nix-darwin,
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
        ]
        ++ hostModules;
    };
in {
  earth = mkDarwin "aarch64-darwin" [./earth];
}
