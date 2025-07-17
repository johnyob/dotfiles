{...}: {
  programs.nixvim = {
    plugins.illuminate = {
      enable = true;
      underCursor = true; # Highlight under the cursor
      providers = ["treesitter" "regex"];
      filetypesDenylist = [
        # TODO: Add filetypes to denylist
      ];
    };
  };
}
