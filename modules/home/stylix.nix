{
  pkgs,
  config,
  ...
}: {
  stylix = {
    enable = true;
    autoEnable = false;
    image = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/zhichaoh/catppuccin-wallpapers/refs/heads/main/os/nix-black-4k.png";
      sha256 = "1d165878a0e67c0e7791bddf671b8d5af47c704f7ab4baea3d9857e3ecf89590";
    };
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

    opacity = {
      terminal = 1.0;
      popups = 0.8;
    };

    targets = {
      kitty.enable = true;
      fzf.enable = true;
      nixvim.enable = true;
    };

    fonts = {
      sizes.terminal = 12;
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
    };
  };
}
