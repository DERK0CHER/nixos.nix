{
  config,
  lib,
  pkgs,
  ...
}:

{
  # --- Core Bluetooth ---
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    package = pkgs.bluez;
    settings = {
      General = {
        Experimental = true;
        FastConnectable = true;
        JustWorksRepairing = "always";
      };
      Policy = {
        AutoEnable = true;
      };
    };
  };
  services.blueman.enable = true;

  # --- Firmware (Realtek USB BT 5.0) ---
  hardware.enableAllFirmware = true;
  hardware.firmware = with pkgs; [
    rtl8761b-firmware
  ];

  # --- Stabilität für Realtek btusb ---
  boot.extraModprobeConfig = ''
    options btusb enable_autosuspend=0
    options btusb disable_scofix=1
  '';

  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="usb", ATTR{bDeviceClass}=="e0", ATTR{power/control}="on"
    ACTION=="add", SUBSYSTEM=="bluetooth", TEST=="power/control", ATTR{power/control}="on"
  '';

  # --- Time/Locale ---
  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";

  # --- Wayland env ---
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    XDG_SESSION_TYPE = "wayland";
    WLR_NO_HARDWARE_CURSORS = "1";
  };
  programs.xwayland.enable = true;
  programs.dconf.enable = true;

  # --- Portals ---
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  environment.systemPackages = with pkgs; [ waybar ];

  # --- Audio via PipeWire ---
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
    jack.enable = true;
  };
}
