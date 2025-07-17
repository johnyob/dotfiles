{...}: {
  programs.nixvim = {
    plugins.toggleterm = {
      enable = true;
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>t";
        action = "<cmd>ToggleTerm<cr>";
        options.desc = "Toggle terminal window";
      }

      {
        mode = "n";
        key = "<leader>tv";
        action = "<cmd>ToggleTerm direction=vertical<cr>";
        options.desc = "Toggle vertical terminal window";
      }

      {
        mode = "n";
        key = "<leader>th";
        action = "<cmd>ToggleTerm direction=horizontal<cr>";
        options.desc = "Toggle horizontal terminal window";
      }

      {
        mode = "n";
        key = "<leader>tf";
        action = "<cmd>ToggleTerm direction=float<cr>";
        options.desc = "Toggle floating terminal window";
      }
    ];
  };
}
