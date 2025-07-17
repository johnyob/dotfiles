{...}: {
  programs.nixvim = {
    plugins = {
      lsp-format = {
        enable = true;
        lspServersToEnable = "all";
      };

      lsp = {
        enable = true;
        inlayHints = true;

        keymaps = {
          silent = true;
          diagnostic = {
            "<leader>k" = "goto_prev";
            "<leader>j" = "goto_next";
          };

          lspBuf = {
            gd = "definition";
            gD = "references";
            gt = "type_definition";
            gi = "implementation";
            K = "hover";
            "<leader>r" = "rename";
          };
        };
      };
    };

    diagnostic.settings = {
      virtual_text = {
        spacing = 2;
        source = false;
      };
      underline = true;
      signs = true;
      severity_sort = true;
      float = {
        source = "always";
        focusable = false;
      };
    };
  };
}
