#
# Specific system configuration settings for Earth (MacBook Pro (14-inch, 2021))
#
{pkgs, ...}: {
  users.users = import ./users.nix;
  home-manager.users = import ./hm-users.nix;

  networking = {
    computerName = "Alistair's MacBook Pro";
    hostName = "ajob410-mbp";
  };
}
