#/etc/nixos/modules/services.nix
{ config, ... }:

{


  nix.settings.experimental-features = [ "nix-command" "flakes" ];  # Enables both common features

  # ZFS maintenance
  services.zfs.autoScrub.enable = true;

  # Enable SSH (optional)
   services.openssh.enable = true;

  # Enable CUPS for printing (optional)
   services.printing.enable = true;
}

