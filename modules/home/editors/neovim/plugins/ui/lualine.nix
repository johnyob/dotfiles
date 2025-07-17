{...}: {
  programs.nixvim = {
    plugins.lualine = {
      enable = true;

      settings = {
        options = {
          globalstatus = true; # Use global statusline
        };
        # +-------------------------------------------------+
        # | A | B | C                             X | Y | Z |
        # +-------------------------------------------------+

        sections = {
          lualine_a = ["mode"];
          lualine_b = ["branch"];
          lualine_c = ["filename" "diff"];

          lualine_x = [""];
          lualine_y = ["location" "progress"];
          lualine_z = [
            {
              __unkeyed = "diagnostic";
              symbols = {
                error = " ";
                warn = " ";
                info = " ";
                hint = "󰝶 ";
              };
            }
          ];
        };
      };
    };
  };
}
