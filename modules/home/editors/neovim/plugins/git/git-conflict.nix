{...}: {
  programs.nixvim = {
    plugins.git-conflict = {
      enable = true;
      settings.default-mappings = true;
    };
  };
}
