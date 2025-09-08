{
  description = "Xenia's Nix Config Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix4nvchad.url = "github:nix-community/nix4nvchad";
    nix4nvchad.inputs.nixpkgs.follows = "nixpkgs";

  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, ... }:
  let
    system = "aarch64-darwin";
    extraSpecialArgs = { inherit system inputs; };
  in
  {
    darwinConfigurations."Xenias-MacBook-Air" = nix-darwin.lib.darwinSystem {
      	system = "aarch64-darwin";
	modules = [
	  ./configuration.nix
	  home-manager.darwinModules.home-manager {
             home-manager = {         
                   inherit extraSpecialArgs;
                   useGlobalPkgs = true;
		   useUserPackages = true;
		   users.xenia.imports = [ ./home-manager/xenia.nix ];
	     };
          }
	];
    };
  };
}
