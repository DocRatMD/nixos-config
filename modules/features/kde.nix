{ self, inputs, lib, ... }:
let
  wallpaper = ../../assets/wallpapers/static/minecraft-snow.png;
in
{

  # System half: the Plasma session and login screen
  flake.nixosModules.kde = {
    services.desktopManager.plasma6.enable = true;

    services.displayManager.sddm = {
      enable = lib.mkDefault true; #Overwritten by ly.nix
      wayland.enable = true;
    };
  };

  # Home-manager half: plasma-manager and your Plasma settings
  flake.homeModules.kde = {
    imports = [
      inputs.plasma-manager.homeModules.plasma-manager
    ];

    programs.plasma = {
      enable = true;

      workspace = {
        lookAndFeel = "org.kde.breezedark.desktop";
        #customWallpaperPluginType = "luisbocanegra.smart.video.wallpaper.reborn";
        wallpaper = wallpaper;
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
        "kwin"."Window Close" = "Meta+Q";
      };

      kwin = {
        effects = {
          shakeCursor.enable = false;
        };
        edgeBarrier = 0;
        cornerBarrier = false;
      };

      panels = [
        {
          location = "bottom";
          screen = "all";
          widgets = [
            {
              kickoff = {
                sortAlphabetically = true;
                icon = "nix-snowflake-white";
              };
            }
            {
              iconTasks = {
                launchers = [
                  "applications:helium.desktop"
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
          hiding = "none";
          floating = false;
          opacity = "adaptive";
          lengthMode = "fill";
          height = 38;
        }
      ];
    };
  };

}
