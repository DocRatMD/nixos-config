{ self, inputs, ... }: {
  flake.homeModules.firefox = { config, ... }: {
    programs.firefox = {
      enable = true;

      policies = {
        ExtensionSettings = {
          "uBlock0@raymondhill.net" = {
            installation_mode = "normal_installed";
            install_url =
              "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
            default_area = "menupanel";
          };

          "78272b6fa58f4a1abaac99321d503a20@proton.me" = {
            installation_mode = "normal_installed";
            install_url =
              "https://addons.mozilla.org/firefox/downloads/latest/proton-pass/latest.xpi";
            default_area = "navbar";
          };

          #See user script at the bottom of this file
          "{aecec67f-0d10-4fa7-b7c7-609a2db280cf}" = {
            installation_mode = "normal_installed";
            install_url =
              "https://addons.mozilla.org/firefox/downloads/latest/violentmonkey/latest.xpi";
            default_area = "menupanel";
          };

          "sponsorBlocker@ajay.app" = {
            installation_mode = "normal_installed";
            install_url =
              "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
            default_area = "menupanel";
          };
        };

        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        HttpsOnlyMode = "enabled";
        DontCheckDefaultBrowser = true;
        OfferToSaveLogins = false;
        AutofillCreditCardEnabled = false;
        AutofillAddressEnabled = false;
        IPProtectionAvailable = false;

        FirefoxHome = {
          Search = false;
          TopSites = false;
          SponsoredTopSites = false;
          Highlights = false;
          Stories = false;
          SponsoredStories = false;
          Weather = false;
          Widgets.Enabled = false;
        };

        FirefoxSuggest = {
          WebSuggestions = false;
        };

        Permissions = {
          Notifications = {
            BlockNewRequests = true;
          };
        };

        AIControls = {
          Default = {
            Value = "blocked";
            Locked = true;
          };
        };
      };

      profiles.default = {
        id = 0;
        isDefault = true;

        search = {
          force = true;
          default = "brave";
          privateDefault = "brave";

          engines.brave = {
            name = "Brave Search";

            urls = [{
              template = "https://search.brave.com/search";
              params = [{
                name = "q";
                value = "{searchTerms}";
              }];
            }];

            definedAliases = [ "@brave" ];
          };
        };

        settings = {
          "sidebar.verticalTabs" = true;

          "ui.key.menuAccessKeyFocuses" = false;

          "media.hardware-video-decoding.force-enabled" = true;

          "media.videocontrols.picture-in-picture.enabled" = false;
          "media.videocontrols.picture-in-picture.video-toggle.enabled" = false;

          # Use Firefox's own theme instead of Linux system colors
          "browser.theme.native-theme" = false;

          # Restore previous session
          "browser.startup.page" = 3;

          # Hide sidebar tools
          "sidebar.main.tools" = "";

          # Strict Enhanced Tracking Protection
          "browser.contentblocking.category" = "strict";
          "privacy.globalprivacycontrol.enabled" = true;

          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        };

        userChrome = ''
          /* Compact, centered address bar */
          #urlbar-container {
            max-width: 700px !important;
            margin-inline: auto !important;
          }

          #fxa-toolbar-menu-button {
            display: none !important;
          }

          /* Hide the top toolbar New Tab button only */
          #new-tab-button {
            display: none !important;
          }

          /* Hide List All Tabs button */
          #alltabs-button {
            display: none !important;
          }

          /* Replace Firefox's New Tab favicon */
          .tab-icon-image[src="chrome://branding/content/icon32.png"] {
            content: url("file://${../../assets/icons/firefox-nightly.svg}") !important;
          }

          /* About Firefox logo */
          #leftBox {
            background-image: url("file://${../../assets/icons/firefox-nightly.svg}") !important;
            background-repeat: no-repeat !important;
            background-size: 192px auto !important;
          }
        '';

        userContent = ''
          @-moz-document url("about:home"), url("about:newtab") {
            .logo-and-wordmark .logo {
              background-image: url("file://${../../assets/icons/firefox-nightly.svg}") !important;
              background-size: contain !important;
              background-repeat: no-repeat !important;
              background-position: center !important;
            }
          }
        '';
      };
    };

    xdg.mimeApps = {
      enable = true;

      defaultApplications = {
        "text/html" = "firefox.desktop";
        "application/xhtml+xml" = "firefox.desktop";

        "x-scheme-handler/http" = "firefox.desktop";
        "x-scheme-handler/https" = "firefox.desktop";
      };
    };

    # Allow Home Manager to replace externally modified MIME associations.
    xdg.configFile."mimeapps.list".force = true;

    xdg.desktopEntries.firefox = {
      name = "Firefox";
      genericName = "Web Browser";

      #REVISIT DISABLING THE RDD SANDBOX AS DRIVERS UPDATE
      exec = "env LIBVA_DRIVER_NAME=nvidia MOZ_DISABLE_RDD_SANDBOX=1 firefox --name firefox %U";
      #exec = "firefox --name firefox %U";
      icon = ../../assets/icons/firefox-nightly.svg;

      terminal = false;

      categories = [
        "Network"
        "WebBrowser"
      ];

      settings = {
        StartupWMClass = "firefox";
      };

      actions = {
        "new-private-window" = {
          name = "New Private Window";
          exec = "env LIBVA_DRIVER_NAME=nvidia MOZ_DISABLE_RDD_SANDBOX=1 firefox --private-window %U";
          #exec = "firefox --private-window %U";
        };

        "new-window" = {
          name = "New Window";
          exec = "env LIBVA_DRIVER_NAME=nvidia MOZ_DISABLE_RDD_SANDBOX=1 firefox --new-window %U";
          #exec = "firefox --new-window %U";
        };

        "profile-manager" = {
          name = "Profile Manager";
          exec = "env LIBVA_DRIVER_NAME=nvidia MOZ_DISABLE_RDD_SANDBOX=1 firefox --ProfileManager";
          #exec = "firefox --ProfileManager";
        };
      };
    };
  };
}



# // ==UserScript==
# // @name         YouTube Fullscreen Scroll Lock
# // @namespace    local.youtube
# // @version      1.1
# // @description  Prevent scrolling while YouTube is fullscreen
# // @match        https://www.youtube.com/*
# // @run-at       document-start
# // @grant        none
# // ==/UserScript==
#
# (() => {
#   "use strict";
#
#   document.addEventListener(
#     "wheel",
#     (event) => {
#       if (document.fullscreenElement) {
#         event.preventDefault();
#         event.stopImmediatePropagation();
#       }
#     },
#     { capture: true, passive: false }
#   );
# })();
