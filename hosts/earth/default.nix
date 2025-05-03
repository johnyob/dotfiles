#
# Specific system configuration settings for Earth (MacBook Pro (14-inch, 2021))
#
{pkgs, ...}: {
  imports = [../../home/editors/nvim];

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
    casks = ["raycast" "arc" "microsoft-outlook"];
  };

  environment.systemPackages = with pkgs; [
    tailscale
    slack
    rustup
  ];

  services.tailscale.enable = true;
  # services.karabiner-elements.enable = true;
}
