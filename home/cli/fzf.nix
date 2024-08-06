{pkgs, ...}: {
  programs.fzf = {
    enable = true;
    # fzf-tab plugin handles the integration
    enableZshIntegration = false;
  };
}
