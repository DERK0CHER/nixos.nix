# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:


{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "lala"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = false;
  services.desktopManager.plasma6.enable = false;

  # Configure keymap in X11
  
  services.xserver = {
    enable = true;
    layout = "us";
    xkbOptions = "caps:escape,escape:caps_lock";
};

environment.variables = {
  XKB_DEFAULT_LAYOUT = "us";
  XKB_DEFAULT_OPTIONS = "caps:escape,escape:caps_lock";
};



  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
   services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.xa = {
    isNormalUser = true;
    description = "xa";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
    #  thunderbird
    ];
  };

  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "xa";

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;




xdg.portal.enable = true;
xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
environment.variables.QT_QTA_PLATFORMTHEME = "qt5ct";


  # Enable Docker
#  services.docker.enable = true;

#sound with pipewire

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  programs.hyprland.enable = true;
  programs.fish.enable = true;



  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
	wget
	git
	metasploit
	vscode
	git
	gummi
	tmux
	htop
	neovim
    pkgs.spotify
    pkgs.fish
    pkgs.dunst
    pkgs.lsd 
    pkgs.hyprland 
    pkgs.mangohud
    pkgs.fastfetch
    pkgs.libsForQt5.qt5ct 
    pkgs.qt6ct
    pkgs.rofi
    pkgs.waybar
    pkgs.wlogout
    pkgs.dolphin
    pkgs.libinput-gestures
    fishPlugins.done
	pkgs.libgccjit
	pkgs.pkg-configUpstream
    buildPackages.gcc
     pkgs.gnumake
     pkgs.binutils
	rustup      # Paru is written in Rust
 	glib

  fishPlugins.fzf-fish
  fishPlugins.forgit
  fishPlugins.hydro
  fzf
  fishPlugins.grc
  	grc
	rofi
	keyd
	xclip wl-clipboard
	screenkey	
    	zed-editor
    pkgs.kitty
    pkgs.waybar
    pkgs.dunst #notification deamon
    libnotify
    swww
	pkgs.kitty
	signal-desktop
	obs-studio
	neovim
	pkgs.lxappearance
	pkgs.paru
	pkgs.pacman
	pkgs.spotify
	pkgs.docker
];

fonts.fonts = with pkgs; [
  jetbrains-mono
  noto-fonts
  # Add any additional fonts
];

  


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
   programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

 systemd.services.keyd = {
  enable = true;
  description = "Keyd Daemon";
  wantedBy = [ "multi-user.target" ];
  serviceConfig = {
    ExecStart = "/run/current-system/sw/bin/keyd";
    Restart = "always";
  };
};
 
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };


  # Optional, hint Electron apps to use Wayland:
   environment.sessionVariables.NIXOS_OZONE_WL = "1";







  # Enable the OpenSSH daemon.
      services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
