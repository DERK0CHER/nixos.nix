#/etc/nixos/modules/hyprland.nix
{ config, pkgs, ... }:

{
  # Session stack: GNOME + Hyprland + Niri
  services.xserver.enable = true;
  services.desktopManager.gnome.enable = true;

  # Use GDM for Wayland sessions
  services.displayManager.gdm.enable = true;
  services.displayManager.defaultSession = "gnome";

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  programs.niri.enable = true;

  # Essential desktop services
  services.dbus.enable = true;
  security.polkit.enable = true;
}
