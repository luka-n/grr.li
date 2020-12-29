{ config, lib, ... }:
{
  imports = [
    <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
  ];

  # Deployment

  deployment.targetHost = "hekate";

  # Hardware

  boot.initrd.availableKernelModules = [
    "ahci"
    "rtsx_pci_sdmmc"
    "sd_mod"
    "usb_storage"
    "usbhid"
    "xhci_pci"
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
    device = "/dev/disk/by-uuid/3b6cc219-0c45-4972-856e-13e1e77a4276";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/21c87d37-5aec-4774-bcf2-b75dff879385";
    fsType = "ext4";
  };

  nix.maxJobs = lib.mkDefault 4;

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";

  swapDevices = [
    { device = "/dev/disk/by-uuid/c037a366-9116-43fd-af28-21b3d64e6e88"; }
  ];
}
