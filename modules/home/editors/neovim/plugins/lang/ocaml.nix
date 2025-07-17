{...}: {
  programs.nixvim = {
    plugins = {
      lsp.servers = {
        ocamllsp = {
          enable = true;

          # Allow direnv to override the package
          packageFallback = true;
        };
      };
    };
  };
}
