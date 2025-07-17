let
  visual = [
    {
      mode = "v";
      key = "K";
      action = ":m '>+1<CR>gv=gv";
      options.desc = "Move selected line down";
    }
    {
      mode = "v";
      key = "J";
      action = ":m '<-2<CR>gv=gv";
      options.desc = "Move selected line up";
    }
    {
      mode = "v";
      key = ">";
      action = ">gv";
      options.desc = "Indent selected lines";
    }
    {
      mode = "v";
      key = "<";
      action = "<gv";
      options.desc = "Unindent selected lines";
    }
    {
      mode = "v";
      key = "<TAB>";
      action = ">gv";
      options.desc = "Indent selected lines with tab";
    }
    {
      mode = "v";
      key = "<S-TAB>";
      action = "<gv";
      options.desc = "Unindent selected lines with tab";
    }
  ];

  normal = [
    {
      mode = "n";
      key = "<leader>s";
      action = ":w<CR>";
      options.desc = "Save file";
    }
    {
      mode = "n";
      key = "<C-s>";
      action = ":w<CR>";
      options.desc = "Save file with Ctrl+s";
    }
    {
      mode = "n";
      key = "H";
      action = "^";
      options.desc = "Jump to start of line (first character)";
    }
    {
      mode = "n";
      key = "L";
      action = "$";
      options.desc = "Jump to end of line";
    }
    # Windows
    {
      mode = "n";
      key = "<leader>ww";
      action = "<C-W>p";
      options = {
        silent = true;
        desc = "Other window";
      };
    }

    {
      mode = "n";
      key = "<leader>wd";
      action = "<C-W>c";
      options = {
        silent = true;
        desc = "Delete window";
      };
    }

    {
      mode = "n";
      key = "<leader>w-";
      action = "<C-W>s";
      options = {
        silent = true;
        desc = "Split window below";
      };
    }

    {
      mode = "n";
      key = "<leader>w|";
      action = "<C-W>v";
      options = {
        silent = true;
        desc = "Split window right";
      };
    }

    {
      mode = "n";
      key = "<C-h>";
      action = "<C-W>h";
      options = {
        silent = true;
        desc = "Move to window left";
      };
    }

    {
      mode = "n";
      key = "<C-l>";
      action = "<C-W>l";
      options = {
        silent = true;
        desc = "Move to window right";
      };
    }

    {
      mode = "n";
      key = "<C-k>";
      action = "<C-W>k";
      options = {
        silent = true;
        desc = "Move to window over";
      };
    }

    {
      mode = "n";
      key = "<C-j>";
      action = "<C-W>j";
      options = {
        silent = true;
        desc = "Move to window bellow";
      };
    }
  ];
in {
  programs.nixvim = {
    globals.mapleader = " ";

    keymaps = visual ++ normal;
  };
}
