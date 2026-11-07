{ self, inputs, ... }: {

  flake.nixosModules.kitty = { ... }: {
    home-manager.sharedModules = [ self.homeModules.kitty ];
  };

  flake.homeModules.kitty = { pkgs, ... }: {
    programs.kitty = {
      enable = true;

      font = {
        name = "JetBrainsMono Nerd Font Mono";
        package = pkgs.nerd-fonts.jetbrains-mono;
        size = 12;
      };

      settings = {
        # Appearance
        window_padding_width = 10;

        # Scrollback
        scrollback_lines = 10000;

        # Behavior
        enable_audio_bell = false;
        confirm_os_window_close = 0;
        update_check_interval = 0;
      };
    };
  };

}
