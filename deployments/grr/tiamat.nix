{ config, lib, ... }:
{
  imports = [
    <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
  ];

  # Deployment

  deployment.targetHost = "tiamat";

  # Hardware

  boot.initrd.availableKernelModules = [
    "ahci"
    "ehci_pci"
    "sd_mod"
    "uhci_hcd"
    "usb_storage"
  ];

  boot.initrd.kernelModules = [ "dm-snapshot" ];

  boot.initrd.luks.devices = {
    sda2_crypt = {
      device = "/dev/sda2";
      preLVM = true;
    };
  };

  boot.kernelModules = [ "kvm-intel" ];

  boot.loader.grub = {
    device = "/dev/sda";
    enable = true;
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/06e89bbb-3626-46bc-9cff-b0cc7bd780e3";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/0b81887e-b972-4bd2-8a10-40fc9a556c1c";
    fsType = "ext4";
  };

  nix.maxJobs = lib.mkDefault 2;

  nixpkgs.system = "i686-linux";

  swapDevices = [
    { device = "/dev/disk/by-uuid/61fc8b85-e091-452b-bb1f-8b66ea1e4bf4"; }
  ];
}
