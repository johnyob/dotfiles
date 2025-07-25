{...}: {
  programs.nixvim = {
    plugins = {
      lsp.servers = {
        nixd = {
          enable = true;
          packageFallback = true;
          settings = {
            nixpkgs.expr = "import <nixpkgs> {}";
            formatting.command = ["alejandra"];
          };
        };
      };
    };
  };
}
