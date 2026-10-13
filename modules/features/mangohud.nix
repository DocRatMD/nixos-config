{ self, inputs, ... }: {

  flake.nixosModules.mangohud = {
    home-manager.sharedModules = [ self.homeModules.mangohud ];
  };

  flake.homeModules.mangohud = { ... }: {
    programs.mangohud = {
      enable = true;
      settings = {
        fps_limit = 177;
        position = "top-left";
        fps_only = true;
        background_alpha = 0.0;
        text_color = "FFFFFF";
      };
    };
  };

}
