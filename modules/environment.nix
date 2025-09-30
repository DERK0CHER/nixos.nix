{ config, lib, pkgs, ... }:

{
  # Networking
  networking.useDHCP = lib.mkDefault true;
  
  # Timezone
  time.timeZone = "Europe/Berlin";
  
  # Locale
  i18n.defaultLocale = "en_US.UTF-8";

  # Environment variables for Wayland
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    XDG_SESSION_TYPE = "wayland";
    WLR_NO_HARDWARE_CURSORS = "1";  # If cursor issues
  };

  # XDG portal for screen sharing
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}

