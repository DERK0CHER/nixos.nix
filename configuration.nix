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
    ./modules/fonts.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "25.05";
}
