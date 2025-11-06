{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # USER packages for fwork

    alacritty
    brave
    bitwarden-desktop
    busybox
    cachix
    chromium
    easyeffects
    firefox
    gcc
    gnumake
    libreoffice
    mullvad-browser
    mullvad-vpn
    newsboat
    nextcloud-client
    nodejs
    ollama
    prismlauncher
    signal-desktop
    spotify
    thunderbird
    tree-sitter
    tofi

  ];
}

