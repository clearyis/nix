{
  description = "Simple Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    omarchy-nix = {
      url = "path:/home/dylan/omarchy-nix-personal/omarchy-nix";
      #url = "github:henrysipp/omarchy-nix";
      #url = "github:clearyis/omarchy-nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    fw-fanctrl = {
      url = "github:TamtamHero/fw-fanctrl/packaging/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, omarchy-nix, home-manager, ... } @ inputs: {
    nixosConfigurations.fwork = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; }; # this is the important part
      modules = [
        ./configuration.nix
        omarchy-nix.nixosModules.default
        home-manager.nixosModules.home-manager
        {
          omarchy = {
            full_name = "Dylan";
            email_address = "dylan@cleary.org";
            theme = "tokyo-night";
          };
	  home-manager = {
	    users.dylan = {
	    nixpkgs.config.allowUnfree = true;
	      imports = [
	        omarchy-nix.homeManagerModules.default
	        ./home/dylan/home.nix		];
	    };
	  };  
        }
      ];
    };
  };
}
