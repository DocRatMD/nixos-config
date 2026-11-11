{ self, inputs, ... }: {

  flake.nixosModules.kitty = { ... }: {
    home-manager.sharedModules = [ self.homeModules.kitty ];
  };

  flake.homeModules.kitty = { pkgs, ... }: {
    programs.kitty = {
      enable = true;

      font = {
        name = "JetBrainsMono Nerd Font";
        package = pkgs.nerd-fonts.jetbrains-mono;
        size = 12;
      };

      settings = {

        background = "#17171b";
        foreground = "#cad3f5";
        background_opacity = 0.70;
        window_padding_width = 5;
        background_blur = 1;

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
