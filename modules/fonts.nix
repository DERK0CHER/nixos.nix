{ config, pkgs, ... }:

{
  fonts = {
    enableDefaultFonts = true;

    # Enable fontconfig so apps like VSCode, Alacritty, etc. can see fonts
    fontconfig.enable = true;

    # List of monospaced fonts to install
    fonts = with pkgs; [
      cascadia-code
      fira-mono
      victor-mono
      source-code-pro
      jetbrains-mono
    ];
  };
}









