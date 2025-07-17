{...}: {
  programs.nixvim = {
    plugins.gitsigns = {
      enable = true;
      settings = {
        current_line_blame = true;
        # TODO: Maybe use different icons for signs
        signs = {
          add = {
            text = "+";
          };
          change = {
            text = "~";
          };
          delete = {
            text = "_";
          };
          untracked = {
            text = "?";
          };
          topdelete = {
            text = "‾";
          };
          changedelete = {
            text = "-";
          };
        };
      };
    };
  };
}
