{ config, pkgs, ... }:

{
  home.username = "dylan";
  home.homeDirectory = "/home/dylan";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    grml-zsh-config
  ];

  imports = [
    ./modules/default.nix
  ];
  
}
