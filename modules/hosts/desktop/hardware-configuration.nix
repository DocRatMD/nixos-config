{ self, inputs, ... }: {
  flake.nixosModules.desktop-hardware = { config, lib, pkgs, modulesPath, ... }:

    {
      imports =
        [
          (modulesPath + "/installer/scan/not-detected.nix")
        ];

      boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
      boot.initrd.kernelModules = [ ];
      boot.kernelModules = [ "kvm-amd" ];
      boot.extraModulePackages = [ ];

      fileSystems."/" =
        {
          device = "/dev/disk/by-uuid/db57238b-3558-4914-9eab-087a578318d9";
          fsType = "btrfs";
        };

      fileSystems."/home" =
        {
          device = "/dev/disk/by-uuid/db57238b-3558-4914-9eab-087a578318d9";
          fsType = "btrfs";
          options = [ "subvol=home" ];
        };

      fileSystems."/nix" =
        {
          device = "/dev/disk/by-uuid/db57238b-3558-4914-9eab-087a578318d9";
          fsType = "btrfs";
          options = [ "subvol=nix" ];
        };

      fileSystems."/boot" =
        {
          device = "/dev/disk/by-uuid/A924-627B";
          fsType = "vfat";
          options = [ "fmask=0077" "dmask=0077" ];
        };

      swapDevices = [ ];

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    };

}
