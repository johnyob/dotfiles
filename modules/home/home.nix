{
  config,
  lib,
  pkgs,
  ...
}:
# General settings for all types of systems/users of home manager
let
  inherit (config.home) username;
in {
  programs.home-manager.enable = true;
  home = {
    # Configure fetch for shell
    shellAliases.fetch = "${lib.getExe pkgs.fastfetch} -c examples/17.jsonc --kitty-direct $HOME/.logo.png --logo-width 30 --logo-height 16 --logo-padding-top 0 --logo-padding-left 3";
    file.".logo.png".source = ./logo.png;

    homeDirectory =
      if pkgs.stdenv.isDarwin
      then "/Users/${username}"
      else "/home/${username}";
  };
}
