{ config, pkgs, ... }:

{
  # Define a user account
  programs.fish.enable = true;
  users.users.xxx = {
    isNormalUser = true;
    description = "Full Name";
    extraGroups = [ "wheel" "networkmanager" "video" "audio" ];
    shell = pkgs.fish;  # or pkgs.zsh, pkgs.fish
    
    # Optional: Set initial password (change after first login)
    initialPassword = "xxx";
    
    # Or use a hashed password (recommended)
    # hashedPassword = "$6$rounds=...";  # Generate with: mkpasswd -m sha-512
  };
}

