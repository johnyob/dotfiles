{
  system,
  inputs,
  outputs,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;

    # fzf-tab handles completions
    enableCompletion = false;

    initExtra = ''
      source ~/.p10k.zsh

      # Add brew to path
      PATH=/opt/homebrew/bin:$PATH

      # Add path for gnu-sed
      PATH=/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH

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

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "fzf"
        "fzf-tab"
      ];
      theme = "zsh-powerlevel10k/powerlevel10k";

      custom = let
        plugins = with pkgs; [
          {
            name = "fzf-tab";
            dir = "${pkgs.zsh-fzf-tab}/share/fzf-tab";
          }
        ];

        themes = [ pkgs.zsh-powerlevel10k ];
      in "${outputs.packages.${system}.oh-my-zsh-custom {inherit plugins themes;}}";
    };
  };

  home.file.".p10k.zsh" = {
    source = ./.p10k.zsh;
    executable = true;
  };
}
