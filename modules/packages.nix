#/etc/nixos/modules/packages.nix

{ config, pkgs, ... }:

{
  
  environment.systemPackages = with pkgs; [
    # Terminal & editor
    kitty
    neovim
    vscodium
    gummi
    
    


    # Browser
    firefox
    
    # System utilities
    git
    curl
    btop
    nautilus
    feh
    gimp
    blueman
    
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
    hyprshot      # screenshots
    hyprcursor
    slurp     # region selection
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
    qt6ct
    
    gsettings-desktop-schemas

    #garmin
    steam
  ];

  # Fonts for Hyprland
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-emoji
    font-awesome
    nerd-fonts.jetbrains-mono
  ];
programs.thunar.enable = true;
programs.waybar.enable = true;

services.gvfs.enable = true; # Mount, trash, and other functionalities
services.tumbler.enable = true; # Thumbnail support for images
}

