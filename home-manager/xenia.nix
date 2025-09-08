{ inputs, lib, config, pkgs, ... }: {
  
  imports = [ 
    ./modules 
  ];
    
  home = {
    username = "xenia";
    homeDirectory = "/Users/xenia";

    packages = with pkgs; [
      discord tdesktop element-desktop
    ]; 
  };
  
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
