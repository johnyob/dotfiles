{
  programs.nixvim = {
    clipboard = {
      # Use system clipboard
      register = "unnamedplus";
    };

    opts = {
      # Show line numbers
      number = true;

      # Show relative line numbers
      relativenumber = true;

      # Tab width should be 2
      tabstop = 2;
      softtabstop = 2;
      showtabline = 0;

      # Use spaces instead of tabs
      expandtab = true;

      # Enable smart identation
      smartindent = true;
      shiftwidth = 2;

      # Enable mouse support in all modes
      mouse = "a";

      # Disable swap file creation
      swapfile = false;

      # Open new splits to the right
      splitright = true;

      # Hide mode indicator (lualine will show it)
      showmode = false;
    };
  };
}
