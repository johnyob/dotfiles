_: {
  home.stateVersion = "24.05";

  # TODO: Home manager config options here

  programs.texlive = {
    enable = true;
    extraPackages = tpkgs: {
      inherit
        (tpkgs)
        scheme-full
        # collection-latex
        # collection-latexrecommended
        # collection-latexextra
        # collection-luatex
        # collection-fontsrecommended
        # collection-fontsextra
        # dvisvgm
        # bussproofs
        ;
    };
  };
}
