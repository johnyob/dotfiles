{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true; 
    syntaxHighlighting.enable = true;

    initExtra = ''
      # Add brew to path
      PATH=/opt/homebrew/bin:$PATH

      # Add path for gnu-sed
      PATH=/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH

      # Initialize starship shell
      eval "$(starship init zsh)"

      # opam configuration
      [[ ! -r /Users/ajob410/.opam/opam-init/init.zsh ]] || source /Users/ajob410/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
    '';

    shellAliases = {
      # Git aliases
      g = "git";
      gl = "git lol";
      gs = "git status";
      ga = "git add";

      gc = "git commit";
      gca = "git commit --amend";
      gcr = "git commit --amend --no-edit";

      gco = "git checkout";
      gcof = "git cof";

      gf = "git fetch";
      gfa = "git fetch --all";
      gfo = "git fetch origin";

      gp = "git push";
      gpf = "git push -f";
      gpb = "git publish";

      gpick = "git cherry-pick";

      reload = "exec $SHELL -l";
    };
  };
}
