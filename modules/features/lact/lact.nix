{ self, inputs, ... }: {

  flake.nixosModules.lact = { ... }: {
    services.lact.enable = true;

    #THIS CONFIG IS FOR RTX 5090 ONLY!!!
    environment.etc."lact/config.yaml".source = ./config.yaml;
    systemd.services.lactd.restartTriggers = [ ./config.yaml ];
  };

}
