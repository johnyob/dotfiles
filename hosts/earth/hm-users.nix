{
  ajob410 = {
    pkgs,
    lib,
    input,
    ...
  }: {
    home.stateVersion = "24.05";
    programs.home-manager.enable = true;

    imports = [
      ../../home/cli/git.nix
      ../../home/cli/direnv.nix
    ];
  };
}
