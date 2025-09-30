{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    fish
    oh-my-fish  # Install OMF package if available in nixpkgs
  ];

  programs.fish = {
    enable = true;
    shellInit = ''
      # Source Oh My Fish init if present
      if test -f ${pkgs.oh-my-fish}/share/omf/init.fish
        source ${pkgs.oh-my-fish}/share/omf/init.fish
      end
    '';
  };
}

