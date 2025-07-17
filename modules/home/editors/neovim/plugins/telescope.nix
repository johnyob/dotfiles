{...}: {
  programs.nixvim = {
    plugins.telescope = {
      enable = true;
      extensions = {
        file-browser.enable = true;
        fzf-native.enable = true;
      };

      # Put prompt at the top of the window
      settings = {
        layout_config.horizontal.prompt_position = "top";
        sorting_strategy = "ascending";
      };
    };

    keymaps = [
      {
        action = "<cmd>Telescope command_history<CR>";
        key = "<leader>f:";
      }
      {
        action = "<cmd>Telescope find_files<CR>";
        key = "<leader>ff";
      }
      {
        action = "<cmd>Telescope live_grep<CR>";
        key = "<leader>fg";
      }
      {
        action = "<cmd>Telescope buffers<CR>";
        key = "<leader>fb";
      }
      {
        action = "<cmd>Telescope help_tags<CR>";
        key = "<leader>fh";
      }
    ];
  };
}
