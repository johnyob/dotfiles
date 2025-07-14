# Shared system configuration for all kinds of systems
{
  config,
  lib,
  pkgs,
  ...
}: {
  nixpkgs.config = {
    allowUnfree = true;
  };

  # Enable zsh as system-wide shell
  programs.zsh.enable = true;
  environment.shells = with pkgs; [
    zsh
  ];

  # Set the default editor (by default vim)
  environment.variables.EDITOR = "vim";

  # System fonts
  fonts = {
    packages = with pkgs; [
      nerd-fonts.fira-code
      fira-code
    ];
  };

  # Nix configuration with garbage collection and flakes
  nix = {
    package = pkgs.nix;
    gc = {
      automatic = true;
      interval.Day = 30;
      options = "--delete-older-than 30d";
    };
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
}
