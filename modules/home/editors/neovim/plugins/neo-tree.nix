{...}: {
  programs.nixvim = {
    plugins.neo-tree = {
      enable = true;
      sources = [
        "filesystem"
        "buffers"
        "git_status"
      ];

      filesystem = {
        bindToCwd = false;
        followCurrentFile.enabled = true;
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>Neotree toggle<CR>";
        options.desc = "Toggle Neo-tree";
      }
    ];
  };
}
