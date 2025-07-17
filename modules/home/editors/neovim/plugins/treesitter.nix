{pkgs, ...}: {
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;

      settings = {
        indent.enable = true;
        highlight.enable = true;
      };

      folding = false;
      grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
    };
  };
}
