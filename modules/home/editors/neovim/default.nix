{
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    ripgrep
    texpresso
  ];

  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    enableMan = false;

    plugins = {
      texpresso.enable = true;
    };

    autoCmd = [
      {
        event = "VimEnter";
        command = "set nofoldenable";
        desc = "Unfold All";
      }
      {
        event = "BufWrite";
        command = "%s/\\s\\+$//e";
        desc = "Remove Whitespaces";
      }
    ];
  };
}
