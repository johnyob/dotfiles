#
# Common nix-darwin configuration.
#
{
  pkgs,
  self,
  ...
}: {
  system.stateVersion = 4;
  system.configurationRevision = self.rev or self.dirtyRev or null;

  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    git
  ];

  services.nix-daemon.enable = true;
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
