{ self, inputs, ... }: {
  # This is your configuration.nix, a place where you configure your system
  # You can place it in a separate file.
  flake.nixosModules.desktopConfiguration = { config, pkgs, ... }: {
    imports = [
      # Include the results of the hardware scan.
      self.nixosModules.desktopHardware
      self.nixosModules.rat
      self.nixosModules.boot
      self.nixosModules.nvidia
      self.nixosModules.kde
      self.nixosModules.solaar
      self.nixosModules.steam
      self.nixosModules.optimizations
      self.nixosModules.fish
      self.nixosModules.ly
      self.nixosModules.lact
    ];

    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    home-manager.users.rat = self.homeModules.desktop;

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users."rat" = {
      packages = with pkgs; [
        #Fix this
        micro
        tree
        fastfetch
      ];
    };

    networking.hostName = "nixos"; # Define your hostname.

    # Use latest kernel.
    boot.kernelPackages = pkgs.linuxPackages_latest;

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # Enable networking
    networking.networkmanager.enable = true;

    # Set your time zone.
    time.timeZone = "America/Chicago";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };

    # Configure keymap in X11
    services.xserver.xkb = {
      layout = "us";
      variant = "";
    };

    # Enable CUPS to print documents.
    #services.printing.enable = true;

    # Enable sound with pipewire.
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    #Do not change this
    system.stateVersion = "26.05";
  };

}
