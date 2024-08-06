#
# Specific system configuration settings for Earth (MacBook Pro (14-inch, 2021))
#
{pkgs, ...}: {
  users.users = import ./users.nix {inherit pkgs;};
  home-manager.users = import ./hm-users.nix;

  networking = {
    computerName = "Alistair's MacBook Pro";
    hostName = "ajob410-mbp";
  };

  environment = {
    variables = {
      EDITOR = "code";
      VISUAL = "code";
    };
  };

  homebrew = {
    enable = true;
    onActivation = {
      upgrade = true;
      cleanup = "zap";
    };
    casks = ["iterm2" "raycast" "arc" ];
  };
}
