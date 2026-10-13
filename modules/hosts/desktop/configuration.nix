{ self, inputs, ... }: {
  # This is your configuration.nix, a place where you configure your system
  # You can place it in a separate file.
  flake.nixosModules.desktopConfiguration = { config, pkgs, ... }: {
    imports = [
      # Include the results of the hardware scan.
      self.nixosModules.desktopHardware
      self.nixosModules.nvidia
      self.nixosModules.lact
      self.nixosModules.lact-desktop
      self.nixosModules.performance
      self.nixosModules.limine
      self.nixosModules.rat
      self.nixosModules.ly
      self.nixosModules.kde
      self.nixosModules.niri
      self.nixosModules.noctalia
      self.nixosModules.fish
      self.nixosModules.solaar
      self.nixosModules.steam
      self.nixosModules.starship
      self.nixosModules.helium
      self.nixosModules.amethyst
      self.nixosModules.prismlauncher
      self.nixosModules.zed
      self.nixosModules.shell
      self.nixosModules.git
      self.nixosModules.ssh
      self.nixosModules.discord
      self.nixosModules.mangohud
      self.nixosModules.cli-tools
      self.nixosModules.firefox
    ];

    home-manager.users.rat = self.homeModules.desktop;
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    networking.hostName = "nixos"; # Define your hostname.

    # Use latest kernel.
    boot.kernelPackages = pkgs.linuxPackages_latest;

    boot.kernelParams = [
      "reboot=pci" #For NVIDIA GPU
    ];

    security.sudo.extraConfig = ''
      Defaults pwfeedback
    '';

    #Windows limine entry
    boot.loader.limine.extraEntries = ''
      /Windows
        protocol: efi
        path: uuid(45b33acb-62b0-4116-a869-cfe10a6325c6):/EFI/Microsoft/Boot/bootmgfw.efi
    '';

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
