{ self, inputs, ... }: {
  flake.nixosModules.niri = { pkgs, ... }: {
    imports = [
      inputs.niri.nixosModules.niri
    ];

    # Keep Plasma as the default while testing Niri
    services.displayManager.defaultSession = "plasma";

    programs.niri = {
      enable = true;
      package = pkgs.niri;
    };

    environment.systemPackages = [
      pkgs.xwayland-satellite
    ];

  };

  flake.homeModules.niri = { ... }: {
    programs.niri.settings = {
      spawn-at-startup = [
        { command = [ "noctalia" ]; }
      ];

      outputs = {
        "DP-2" = {
          mode = {
            width = 2560;
            height = 1440;
            refresh = 179.877;
          };

          variable-refresh-rate = "on-demand";
        };

        "DP-3" = {
          mode = {
            width = 2560;
            height = 1440;
            refresh = 179.877;
          };

          variable-refresh-rate = "on-demand";
          focus-at-startup = true;
        };
      };

      window-rules = [
        # {
        #   geometry-corner-radius = {
        #     top-left = 12.0;
        #     top-right = 12.0;
        #     bottom-left = 12.0;
        #     bottom-right = 12.0;
        #   };
        # }
        {
          matches = [
            { app-id = "^firefox$"; }
          ];

          default-column-width = {
            proportion = 0.5;
          };
        }
        {
          matches = [
            {
              app-id = "^steam$";
              title = "^notificationtoasts_";
            }
          ];

          open-focused = false;

          default-floating-position = {
            relative-to = "bottom-right";
            x = 10;
            y = 10;
          };
        }
      ];

      input = {
        mouse = {
          accel-profile = "flat";
          accel-speed = 0.0;
        };
        mod-key = "Alt";
      };

      layout.gaps = 12;

      binds = {
        # Show keybindings
        "Mod+Shift+Slash".action.show-hotkey-overlay = [ ];
        # Toggle Niri overview
        "Mod+O".action.toggle-overview = [ ];
        # Noctalia app launcher
        "Mod+D".action.spawn = [
          "noctalia"
          "msg"
          "panel-toggle"
          "launcher"
        ];
        # Navigate columns with the mouse wheel
        "Mod+WheelScrollUp" = {
          action.focus-column-left = [ ];
          cooldown-ms = 100;
        };

        "Mod+WheelScrollDown" = {
          action.focus-column-right = [ ];
          cooldown-ms = 100;
        };
        "Mod+V".action.toggle-window-floating = [ ];
        # Column sizing
        "Mod+R".action.switch-preset-column-width = [ ];
        "Mod+C".action.center-column = [ ];
        # Move columns between workspaces
        "Mod+Shift+Up".action.move-column-to-workspace-up = [ ];
        "Mod+Shift+Down".action.move-column-to-workspace-down = [ ];
        # Navigate workspaces
        "Mod+Up".action.focus-workspace-up = [ ];
        "Mod+Down".action.focus-workspace-down = [ ];
        # Move columns horizontally
        "Mod+Shift+Left".action.move-column-left = [ ];
        "Mod+Shift+Right".action.move-column-right = [ ];
        #Applications
        "Mod+Return".action.spawn = "konsole";
        "Mod+E".action.spawn = "dolphin";

        # Window management
        "Mod+Q".action.close-window = [ ];
        "Mod+F".action.maximize-column = [ ];
        "Mod+Left".action.focus-column-left = [ ];
        "Mod+Right".action.focus-column-right = [ ];

        # Exit Niri with confirmation
        "Mod+Shift+E".action.quit = [ ];
      };
    };
  };
}
