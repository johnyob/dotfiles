{...}: {
  homebrew = {
    enable = true;

    onActivation = {
      upgrade = true;
      autoUpdate = true;
      cleanup = "zap";
    };

    casks = ["raycast" "arc" "microsoft-outlook"];
  };
}
