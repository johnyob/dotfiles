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

      eval "$(direnv hook zsh)"
    '';
  };
}
