{ self, inputs, lib, ... }:
let
  wallpaper = "${inputs.assets}/wallpapers/static/minecraft-snow-moon.png";
in
{

  flake.nixosModules.kde = { ... }: {
    home-manager.sharedModules = [ self.homeModules.kde ];
    services.desktopManager.plasma6.enable = true;
  };

  flake.homeModules.kde = { pkgs, ... }: {
    imports = [
      inputs.plasma-manager.homeModules.plasma-manager
    ];

    home.packages = with pkgs; [
      papirus-icon-theme
    ];

    home.pointerCursor = {
      enable = true;
      package = pkgs.apple-cursor;
      name = "macOS";
      size = 24;

      gtk.enable = true;
      x11.enable = true;
    };

    programs.plasma = {
      enable = true;
      overrideConfig = true;

      #Set dolphin view mode to details
      dataFile."dolphin/view_properties/global/.directory"."Dolphin"."ViewMode" = 1;

      #Allow per folder view types
      configFile."dolphinrc"."General"."GlobalViewProps" = false;

      #Set animation speed to instant
      configFile."kdeglobals"."KDE"."AnimationDurationFactor" = 0.0;

      #Disable hot corners
      configFile.kwinrc."Effect-overview".BorderActivate = 9;

      #Disable plasma browser extension reminder
      configFile."kdeglobals"."PlasmaBrowserIntegration".shownCount = 100;

      workspace = {
        lookAndFeel = "org.kde.breezedark.desktop";
        iconTheme = "Papirus-Dark";
        #customWallpaperPluginType = "luisbocanegra.smart.video.wallpaper.reborn";
        wallpaper = wallpaper;
        cursor = {
          theme = "macOS";
          size = 24;
        };
      };

      kscreenlocker = {
        autoLock = lib.mkDefault false;
        appearance = {
          wallpaper = wallpaper;
        };
      };

      powerdevil = {
        AC = {
          autoSuspend.action = "nothing";
          dimDisplay.enable = lib.mkDefault false;
          powerProfile = lib.mkDefault "performance";
          turnOffDisplay = {
            idleTimeout = lib.mkDefault "never";
          };
        };
      };

      session = {
        sessionRestore = {
          restoreOpenApplicationsOnLogin = "startWithEmptySession";
        };
      };

      input = {
        keyboard.numlockOnStartup = "on";

        mice = [
          {
            name = "Logitech PRO X 2";
            vendorId = "046d";
            productId = "40a9";
            accelerationProfile = "none";
            acceleration = 0.0;
          }
          {
            name = "Logitech PRO X 2";
            vendorId = "046d";
            productId = "c09b";
            accelerationProfile = "none";
            acceleration = 0.0;
          }
        ];
      };

      shortcuts = {
        "kwin"."Window Close" = "Alt+Q";
        "kwin"."Window Maximize" = "Alt+F";
        "services/org.kde.konsole.desktop"."_launch" = "Alt+Return";
      };

      krunner.shortcuts.launch = "Alt+D";

      kwin = {
        effects = {
          shakeCursor.enable = false;
        };
        edgeBarrier = 0;
        cornerBarrier = false;
      };

      panels = [
        {
          #General panel settings
          hiding = "none";
          floating = false;
          opacity = "adaptive";
          lengthMode = "fill";
          height = 40;
          location = "bottom";
          screen = "all";

          widgets = [
            {
              kickoff = {
                sortAlphabetically = true;
                icon = "${inputs.assets}/icons/nix-snowflake-white.svg";
              };
            }
            {
              iconTasks = {
                launchers = [
                  "applications:firefox.desktop"
                  "applications:org.kde.dolphin.desktop"
                  "applications:org.kde.konsole.desktop"
                ];
                appearance = {
                  indicateAudioStreams = false;
                };
              };
            }
            {
              systemTray = {
                items = {
                  shown = [
                    "org.kde.plasma.networkmanagement"
                    "org.kde.plasma.volume"
                  ];
                  hidden = [
                    "org.kde.plasma.bluetooth"
                    "org.kde.plasma.clipboard"
                    "org.kde.plasma.brightness"
                    "org.kde.plasma.battery"
                    "org.kde.plasma.weather"
                    "org.kde.plasma.devicenotifier"
                    "org.kde.plasma.notifications"
                    "org.kde.plasma.mediacontroller"
                  ];
                };
              };
            }
            {
              digitalClock = {
                calendar.firstDayOfWeek = "sunday";
                time.format = "12h";
              };
            }
          ];
        }
      ];
    };
  };

}
