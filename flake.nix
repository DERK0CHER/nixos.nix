
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";  # Or your preferred channel
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";  # Or "github:the-argus/spicetify-nix" for another variant
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, spicetify-nix, ... }@inputs: {
    nixosConfigurations.yourHostname = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";  # Adjust for your arch
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.yourUsername = { pkgs, ... }: {
              imports = [ spicetify-nix.homeManagerModules.default ];
              programs.spicetify = {
                enable = true;
                # Optional: Add themes/extensions to test stability
                theme = "catppuccin";
                enabledExtensions = [ "shuffle" "adblock" ];
              };
            };
          };
        }
      ];
    };
  };
}
