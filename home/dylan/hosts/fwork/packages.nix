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
    gamescope
    gcc
    keepassxc
    libreoffice-fresh
    mullvad-browser
    newsboat
    nextcloud-client
    nodejs
    ollama
    prismlauncher
    signal-desktop
    spotify
    thunderbird
    tree-sitter

  ];
}

