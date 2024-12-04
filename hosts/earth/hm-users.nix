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
      ../../home/fonts.nix
      ../../home/cli/git.nix
      ../../home/cli/direnv.nix
      ../../home/editors/vscode
      ../../home/cli/starship.nix
      ../../home/cli/fzf.nix
      ../../home/cli/zsh.nix
      ../../home/cli/iterm2.nix
      ../../home/cli/thefuck.nix
      ../../home/cli/bat.nix
      ../../home/cli/gh.nix
      ../../home/apps/karabiner.nix
    ];
  };
}
