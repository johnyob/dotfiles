{
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    ripgrep
    texpresso
  ];

  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    enableMan = false;

    globals = {
      mapleader = " ";
    };

    opts = {
      number = true; # Show line numbers
      relativenumber = true; # Show relative line numbers

      shiftwidth = 2; # Tab width should be 2
    };

    plugins = {
      telescope.enable = true;
      texpresso.enable = true;
    };

    autoCmd = [
      {
        event = "VimEnter";
        command = "set nofoldenable";
        desc = "Unfold All";
      }
      {
        event = "BufWrite";
        command = "%s/\\s\\+$//e";
        desc = "Remove Whitespaces";
      }
    ];

    keymaps = [
      # telescope
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

  # home.file.".config/nvim/init.lua".source = ./config/init.vim;
}
