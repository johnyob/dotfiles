{lib, ...}: {
  programs.nixvim = {
    plugins = {
      bufferline = {
        enable = true;

        settings = {
          options = {
            mode = "buffers";

            close_icon = " ";
            buffer_close_icon = "󰱝 ";
            modified_icon = "󰔯 ";
          };
        };
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<TAB>";
        action = ":BufferLineCycleNext<CR>";
        options = {
          desc = "Cycle to next buffer";
        };
      }

      {
        mode = "n";
        key = "<S-TAB>";
        action = ":BufferLineCyclePrev<CR>";
        options.desc = "Cycle to previous buffer";
      }

      {
        mode = "n";
        key = "<S-l>";
        action = ":BufferLineCycleNext<CR>";
        options.desc = "Cycle to next buffer";
      }

      {
        mode = "n";
        key = "<S-h>";
        action = ":BufferLineCyclePrev<CR>";
        options.desc = "Cycle to previous buffer";
      }

      {
        mode = "n";
        key = "<leader>bd";
        action = "<cmd>bdelete<cr>";
        options.desc = "Delete buffer";
      }

      {
        mode = "n";
        key = "<leader>bl";
        action = "<cmd>BufferLineCloseLeft<cr>";
        options.desc = "Delete buffers to the left";
      }

      {
        mode = "n";
        key = "<leader>bo";
        action = "<cmd>BufferLineCloseOthers<cr>";
        options.desc = "Delete other buffers";
      }
    ];
  };
}
