#/etc/nixos/modules/packages.nix

{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    # Terminal & editor
    kitty
    fastfetch
    neovim
    zathura
    vscodium
    jetbrains.webstorm
    jetbrains.clion
    gummi
    gparted
    code-cursor
    chromium
    uxplay
    tor
    # Browser
    firefox
    wireplumber
    pulseaudio

    # System utilities
    git
    curl
    btop
    nautilus
    feh
    gimp
    dunst
    libnotify

    ttfautohint

    # Communication
    discord
    vesktop
    signal-desktop
    thunderbird

    #Amenity
    spotify
    spotify-player
    spotify-cli-linux
    # Hyprland essentials
    waybar
    wofi
    dunst
    hyprshot # screenshots
    hyprcursor
    slurp # region selection
    wl-clipboard
    dunst
    hyprpaper
    evolve-core

    #dev stuff
    gcc
    clang
    meson
    gnumake
    nodejs
    glib
    qt6Packages.qt6ct
    pnpm

    # Node formatters
    nodePackages.prettier
    nodePackages.eslint_d

    # Python formatters
    black
    python3Packages.isort

    # Other formatters
    stylua
    shfmt
    clang-tools # for clang-format
    nixfmt
    gsettings-desktop-schemas
    pkgs.python313Packages.pylatexenc
    #garmin
    steam
  ];

  # Fonts for Hyprland
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-color-emoji
    font-awesome
    nerd-fonts.jetbrains-mono
    iosevka-comfy.comfy
    iosevka-comfy.comfy-motion
    iosevka-comfy.comfy-fixed
    iosevka

  ];
  programs.thunar.enable = true;
  programs.waybar.enable = true;

  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnail support for images
}
