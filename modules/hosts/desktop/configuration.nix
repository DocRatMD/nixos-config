{ self, inputs, ... }: {

  flake.nixosConfigurations.nixos-desktop = inputs.nixpkgs.lib.nixosSystem {
    modules = [ self.nixosModules.desktopConfiguration ];
  };

  flake.nixosModules.desktopConfiguration = { config, pkgs, ... }: {
    imports = [
      # Base
      self.nixosModules.desktopHardware
      self.nixosModules.homemanager
      self.nixosModules.rat
      self.nixosModules.limine
      # Hardware
      self.nixosModules.nvidia
      self.nixosModules.lact
      self.nixosModules.lact-desktop
      self.nixosModules.performance
      # Desktop
      self.nixosModules.ly
      self.nixosModules.kde
      self.nixosModules.niri
      self.nixosModules.noctalia
      # Shell and CLI
      self.nixosModules.fish
      self.nixosModules.cli-tools
      self.nixosModules.starship
      self.nixosModules.shell
      self.nixosModules.git
      self.nixosModules.ssh
      # Apps
      self.nixosModules.solaar
      self.nixosModules.steam
      self.nixosModules.helium
      self.nixosModules.amethyst
      self.nixosModules.prismlauncher
      self.nixosModules.zed
      self.nixosModules.discord
      self.nixosModules.mangohud
      self.nixosModules.firefox
    ];

    home-manager.users.rat = self.homeModules.desktop;
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    networking.hostName = "nixos-desktop"; # Define your hostname.

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
