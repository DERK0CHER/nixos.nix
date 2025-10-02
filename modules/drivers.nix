{ config, pkgs, ... }:

{
  # Graphics drivers
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
 hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      vulkan-loader
      vulkan-validation-layers
      vulkan-tools  # For vulkaninfo testing
    ];
    extraPackages32 = with pkgs.pkgsi686Linux; [ vulkan-loader ];  # If needed for 32-bit
  };
  # NVIDIA Configuration
  services.xserver.videoDrivers = [ "nvidia" ];
  
  hardware.nvidia = {
    # Modesetting is required for Wayland
    modesetting.enable = true;
    
    # Power management (optional, can cause issues)
    powerManagement.enable = false;
    
    # REQUIRED: Choose open or proprietary kernel modules
    # - true: Open-source (RTX 20/30/40 series, GTX 16xx and newer)
    # - false: Proprietary (GTX 10xx series and older)
    open = true;  # Change to false if you have older GPU
    
    # Enable nvidia-settings menu
    nvidiaSettings = true;
    
    # Driver version (optional, defaults to latest stable)
    # package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # Audio with PipeWire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Bluetooth (optional)
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };
}

