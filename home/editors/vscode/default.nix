{pkgs, ...}: let
  marketplace = pkgs.callPackage ./marketplace.nix {};
in {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    extensions = with marketplace; [
      mkhl.direnv
      usernamehw.errorlens
      jgclark.vscode-todo-highlight
      PKief.material-icon-theme
      Equinusocio.vsc-material-theme

      # Language support
      jnoortheen.nix-ide
    ];
    userSettings = let
      fontFamily = "Fira Code Nerd Font";
    in {
      # Style
      workbench.colorTheme = "Material Theme Darker";
      workbench.iconTheme = "material-icon-theme";
      editor.fontFamily = fontFamily;
      editor.fontLigatures = true;
      terminal.integrated.fontFamily = fontFamily;

      # Editor
      terminal.integrated.scrollback = 200000;
      editor.tabSize = 2;
      git.autoFetch = true;

      # Extensions
      errorLens.enabled = true;
    };
  };
}
