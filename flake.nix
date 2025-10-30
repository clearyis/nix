{
  description = "Simple Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };
    omarchy-nix = {
      #url = "path:/home/dylan/.omarchy-nix";
      #url = "github:henrysipp/omarchy-nix";
      url = "github:clearyis/omarchy-nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, omarchy-nix, home-manager, nixos-hardware, ... } @ inputs: {

    nixosConfigurations.fw12 = nixpkgs.lib.nixosSystem {
      modules = [
	./common.nix
        ./hosts/fw12/configuration.nix
	nixos-hardware.nixosModules.framework-12-13th-gen-intel
      ];
    };

    nixosConfigurations.fwork = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; }; # this is the important part
      modules = [
	./common.nix
        ./hosts/fwork/configuration.nix
	nixos-hardware.nixosModules.framework-13-7040-amd
        omarchy-nix.nixosModules.default
        home-manager.nixosModules.home-manager
        {
          omarchy = {
            full_name = "Dylan";
            email_address = "dylan@cleary.org";
            theme = "generated_dark";
	    theme_overrides = {
	      wallpaper_path = ./modules/assets/wallpaper/skyline.jpg;
	    };
          };
	  home-manager = {
	    users.dylan = {
	    nixpkgs.config.allowUnfree = true;
	      imports = [
	        omarchy-nix.homeManagerModules.default
	        ./home/dylan/home.nix
		./home/dylan/hosts/fwork/packages.nix
	      ];
	    };
	  };  
        }
      ];
    };

  };
}
