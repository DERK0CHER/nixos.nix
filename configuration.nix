#MAIN CONFIG /etc/nixos/configuration.nix

{ config, pkgs, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/boot.nix
    ./modules/drivers.nix
    ./modules/packages.nix
    ./modules/environment.nix
    ./modules/hyprland.nix
    ./modules/services.nix
    ./modules/users.nix
    ./modules/shell.nix
  ];
  
  nixpkgs.config.allowUnfree = true;
  
  # Keep at the release you installed
  system.stateVersion = "25.05";
}

