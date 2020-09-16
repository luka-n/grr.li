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
    device = "/dev/disk/by-uuid/506a3736-1530-4e32-b4a6-4c8f6a520f96";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/ef5df394-7c4b-435b-a7c6-e1754bd06b78";
    fsType = "ext4";
  };

  nix.maxJobs = lib.mkDefault 4;

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";

  swapDevices = [
    { device = "/dev/disk/by-uuid/44150c6c-9c69-48b7-aa9c-0fcd31af9930"; }
  ];
}
