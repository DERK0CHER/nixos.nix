#/etc/nixos/modules/packages.nix

{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Terminal & editor
    kitty
    neovim
    
    # Browser
    firefox
    
    # System utilities
    git
    curl
    btop
    
    # Communication
    discord  # lowercase is correct
    
    # Hyprland essentials
    waybar
    wofi
    dunst
    grim      # screenshots
    slurp     # region selection
    wl-clipboard

    #dev stuff
    gcc
    clang
    meson
    gnumake
    nodejs

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
}

