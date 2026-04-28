#/etc/nixos/modules/boot.nix

{ config, lib, ... }:

{
  # ZFS boot support
  boot.supportedFilesystems = [ "zfs" ];
  boot.initrd.supportedFilesystems = [ "zfs" ];

  # Required for ZFS imports at boot
  networking.hostId = "d1c53402";

  # EFI bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Override generated swap UUIDs from hardware-configuration.nix
  # and pin to the verified disk by-id path.
  swapDevices = lib.mkForce [
    {
      device = "/dev/disk/by-id/ata-SAMSUNG_SSD_830_Series_S0WJNYABC08589-part3";
    }
  ];
  zramSwap.enable = true;
}

