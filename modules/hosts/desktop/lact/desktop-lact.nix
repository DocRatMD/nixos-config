{ self, inputs, ... }: {

  flake.nixosModules.desktop-lact = { ... }: {
    #THIS CONFIG IS FOR RTX 5090 ONLY!!!
    environment.etc."lact/config.yaml".source = ./config.yaml;
    systemd.services.lactd.restartTriggers = [ ./config.yaml ];
  };

}
