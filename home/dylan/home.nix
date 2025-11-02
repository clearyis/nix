{ config, pkgs, lib, ... }:

{
  home.username = "dylan";
  home.homeDirectory = "/home/dylan";
  home.stateVersion = "25.05";

  imports = [
    ./modules/default.nix
  ];

  programs.home-manager.enable = true;

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [
        "ComicCodeLigaturesNerdFont-Regular"
      ];
    };
  };

  omarchy.primary_font = lib.mkForce "ComicCodeLigatures Nerd Font";

  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/.nix-profile/bin"
  ];

  home.packages = with pkgs; [
  ];

  
}
