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

  hardware = {
    #Opengl
    opengl.enable = true;

    nvidia.modesetting.enable = true;
  }


}

