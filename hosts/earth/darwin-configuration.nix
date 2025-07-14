{ self, pkgs, ... }: {
  system.primaryUser = "ajob410";

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

  # For some reason, cannot use tailscale anymore
  # services.tailscale.enable = true;
}
