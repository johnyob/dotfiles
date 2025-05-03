{...}: let
  swap = from: to: {
    type = "basic";
    from = {
      key_code = from;
      modifiers = {optional = ["any"];};
    };
    to = [{key_code = to;}];
    conditions = [];
  };
in {
  home.file.karabiner = {
    target = ".config/karabiner/assets/complex_modifications/nix.json";
    text = builtins.toJSON {
      title = "Nix Managed (Do not modify manually)";
      rules = [
        {
          description = "Modifications managed by Nix";
          manipulators = [
            (swap "caps_lock" "escape")
            (swap "escape" "caps_lock")
          ];
        }
      ];
    };
  };
}
