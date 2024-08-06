{pkgs, ...}: let
  nerd-fonts = ["FiraCode"];
in {
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    (nerdfonts.override {fonts = nerd-fonts;})
    fira-code
  ];
}
