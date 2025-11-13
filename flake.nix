{
  description = "Simple Flake";

  inputs = {
    
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };

    #omarchy-nix = {
    #  url = "path:/home/dylan/.suis";
    #  #url = "github:clearyis/suis";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #  inputs.home-manager.follows = "home-manager";
    #};

    nix-colors.url = "github:misterio77/nix-colors";

    hyprland.url = "github:hyprwm/Hyprland";

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

     dgop = {
      url = "github:AvengeMedia/dgop";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dms-cli = {
      url = "github:AvengeMedia/danklinux";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.dgop.follows = "dgop";
      inputs.dms-cli.follows = "dms-cli";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { 
    self,
    nixpkgs, 
    hyprland,
    hyprland-plugins,
    nix-colors,
    dgop,
    dms-cli,
    dankMaterialShell,
    #omarchy-nix, 
    home-manager, 
    nixos-hardware, 
    ... } @ inputs: 
  {


    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-tree;

      nixosModules = {
        default =
          {
            config,
            lib,
            pkgs,
            ...
          }:
          {
            imports = [
              (import ./modules/nixos/default.nix inputs)
            ];

            options.omarchy = (import ./config.nix lib).omarchyOptions;
            config = {
              nixpkgs.config.allowUnfree = true;
            };
          };
      };

      homeManagerModules = {
        default =
          {
            config,
            lib,
            pkgs,
            osConfig ? { },
            ...
          }:
          {
            imports = [
              nix-colors.homeManagerModules.default
              (import ./modules/home-manager/default.nix inputs)
            ];
            options.omarchy = (import ./config.nix lib).omarchyOptions;
            config = lib.mkIf (osConfig ? omarchy) {
              omarchy = osConfig.omarchy;
            };
          };
      };

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
        ./modules/nixos/default.nix
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
	              ./modules/home-manager/default.nix
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
