{...}: {
  programs.git = {
    enable = true;
    userName = "johnyob";
    userEmail = "ajo41@cam.ac.uk";

    extraConfig = {
      init.defaultBranch = "main";

      url = {
        "ssh://git@github.com/" = {
          insteadOf = "https://github.com/";
        };

        "ssh://git@gitlab.com/" = {
          insteadOf = "https://gitlab.com/";
        };
      };
    };
  };

  programs.ssh.enable = true;
}
