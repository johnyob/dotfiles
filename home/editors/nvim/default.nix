{
  config,
  lib,
  system,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    ripgrep
  ];

  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    enableMan = false;

    opts = {
      number = true; # Show line numbers
      relativenumber = true; # Show relative line numbers

      shiftwidth = 2; # Tab width should be 2
    };

    plugins = {
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
      {
        key = "<Tab>";
        mode = ["i" "s"];
        action = ''
           function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expandable() then
              luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif check_backspace() then
              fallback()
            else
              fallback()
            end
          end
        '';
      }
    ];
  };

  home-manager.users."ajob410" = {
    home.file.".config/nvim/init.lua".source = ./config/init.vim;
  };
}
