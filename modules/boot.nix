#/etc/nixos/modules/boot.nix

{ config, lib, ... }:

{
  # ZFS boot support
  boot.supportedFilesystems = [ "zfs" ];
  boot.initrd.supportedFilesystems = [ "zfs" ];

  # Required for ZFS imports at boot
  networking.hostId = "3d6394da";

  # EFI bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Encrypted swap with random key each boot
  swapDevices = [
    {
      device = "/dev/disk/by-partuuid/9374bfc1-bcad-4a88-b0d2-71b0589cce1a";
      randomEncryption.enable = true;
    }
  ];
}

