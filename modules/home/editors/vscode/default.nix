{pkgs, ...}: let
  marketplace = pkgs.callPackage ./_marketplace.nix {};
in {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    profiles.default = {
      extensions = with marketplace; [
        mkhl.direnv
        usernamehw.errorlens
        jgclark.vscode-todo-highlight
        # PKief.material-icon-theme
        # Equinusocio.vsc-material-theme

        # Language support
        # Nix
        jnoortheen.nix-ide

        # Python
        ms-python.python
        ms-python.black-formatter

        # Typst
        myriad-dreamin.tinymist
        # tomoki1207.pdf

        # Vim keybindings
        vscodevim.vim

        # Latex
        james-yu.latex-workshop
      ];

      userSettings = let
        fontFamily = "FiraCode Nerd Font Mono";
      in {
        # Editor Style
        workbench.colorTheme = "Material Theme Darker";
        materialTheme.accent = "Orange";
        workbench.iconTheme = "material-icon-theme";
        editor.fontFamily = fontFamily;
        editor.fontLigatures = false;

        terminal.integrated.fontFamily = fontFamily;
        terminal.integrated.enablePersistentSessions = false;

        # By default Vscode will source ~/.zshrc to read $PATH and cache it.
        # Instead we prefer the integrated terminal to always load the $PATH
        terminal.integrated.inheritEnv = false;

        # Editor
        terminal.integrated.scrollback = 200000;
        editor.tabSize = 2;
        git.autoFetch = true;

        # Extensions
        errorLens.enabled = true;

        typst.editor.formatOnSave = true;
        typst.formatterMode = "typstyle";
      };
    };
  };
}
