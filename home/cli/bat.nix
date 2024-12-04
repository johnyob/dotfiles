{pkgs,...}:
{
  # A cat(1) clone with wings
  programs.bat = {
    enable = true;
    config = {
      # No line numbers or git indicators
      style = "header";
      theme = "Coldark-Dark";
    };
  };

  # Bash scripts that integrate with bat with various command line tools
  home.packages = with pkgs; [
    bat-extras.batman # <- Read system manual pages (man) using bat as the manual page formatter.
    bat-extras.batgrep # <- Quickly search through and highlight files using ripgrep.
    bat-extras.batdiff # <- Diff a file against the current git index, or display the diff between two files.
    bat-extras.batwatch # <- Watch for changes in files or command output, and print them with bat.
    bat-extras.prettybat # <- Pretty-print source code and highlight it with bat.
  ]; 
}