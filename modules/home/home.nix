{
  config,
  pkgs,
  ...
}:
# General settings for all types of systems/users of home manager
let
  inherit (config.home) username;
in {
  programs.home-manager.enable = true;
  home = {
    homeDirectory =
      if pkgs.stdenv.isDarwin
      then "/Users/${username}"
      else "/home/${username}";
  };
}
