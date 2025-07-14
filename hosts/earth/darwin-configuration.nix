{
  self,
  pkgs,
  ...
}: {
  system.stateVersion = 4;
  system.configurationRevision = self.rev or self.dirtyRev or null;

  networking = {
    computerName = "Alistair's MacBook Pro";
    hostName = "ajob410-mbp";
  };

  environment.systemPackages = with pkgs; [
    tailscale
    slack
    rustup
  ];

  services.tailscale.enable = true;
}
