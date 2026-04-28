{ config, pkgs, ... }:

{
  # AMD/Mesa graphics stack
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      vulkan-loader
      vulkan-validation-layers
      vulkan-tools
    ];
    extraPackages32 = with pkgs.pkgsi686Linux; [ vulkan-loader ];
  };
  services.xserver.videoDrivers = [ "amdgpu" ];

}
