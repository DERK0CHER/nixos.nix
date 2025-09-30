#/etc/nixos/modules/hyprland.nix
{ config, pkgs, ... }:

{
  # Enable Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Display manager for Hyprland
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  # Essential services
  services.dbus.enable = true;
  security.polkit.enable = true;

  # REMOVED: GNOME conflicts with Hyprland
  # services.xserver.enable = true;  # Not needed for Hyprland-only
  # services.xserver.displayManager.gdm.enable = false;
  # services.xserver.desktopManager.gnome.enable = false;
}

