{ config, pkgs, ... }:

{
  fonts = {
    enableDefaultFonts = true;

    # Enable fontconfig so apps like VSCode, Alacritty, etc. can see fonts
    fontconfig.enable = true;

    # List of monospaced fonts to install
    fonts = with pkgs; [
      cascadia-code
      (iosevka.override {
        set = "IosevkaCustom";
        privateBuildPlan = builtins.readFile ./iosevka/custom-build.toml;
      })
      fira-mono
      victor-mono
      source-code-pro
      jetbrains-mono
      iosevka
      pkgs.iosevka-comfy.comfy
    ];

  };

}
