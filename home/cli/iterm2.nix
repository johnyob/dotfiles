{pkgs, ...}: let
  shellInit = shell: ''
    source ${pkgs.iterm2}/Applications/iTerm2.app/Contents/Resources/iterm2_shell_integration.${shell}
  '';
in {
  home.packages = [pkgs.iterm2];

  programs.zsh.initContent = lib.mkBefore (shellInit "zsh");
}
