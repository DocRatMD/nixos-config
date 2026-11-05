{ self, inputs, ... }: {

  flake.nixosModules.ly = { ... }: {
    services.displayManager.ly = {
      enable = true;
      settings = {
        allow_empty_password = false;
        animation = "colormix"; # none doom matrix colormix gameoflife dur_file
        animation_timeout_sec = 0; # Stops animation after X seconds
        auth_fails = 3; # Plays special animation after X fails. 0 to disable
        bg = "0x00000000"; # Background color id
        bigclock = "en"; # none = disabled. en = english
        bigclock_12hr = true; # Set bigclock to 12hr format
        bigclock_seconds = false; # Show seconds on bigclock
        colormix_col1 = "0x00DC2D4B"; # Color mix color 1 0xSSRRGGBB
        colormix_col2 = "0x002354B4"; # Color mix color 2 0xSSRRGGBB
        colormix_col3 = "0x2019132B"; # Color mix color 3 0xSSRRGGBB
        default_input = "password"; # info_line session login password
        numlock = true; # Enable or disable numlock by default
      };
    };
  };

}
