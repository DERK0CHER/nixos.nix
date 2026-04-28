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

  # Override generated swap UUIDs from hardware-configuration.nix.
  # This avoids boot-time waits/failures on missing devices.
  swapDevices = lib.mkForce [ ];
  zramSwap.enable = true;
}

