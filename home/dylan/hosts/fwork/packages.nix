{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # USER packages for fwork

    alacritty
    brave
    bitwarden-desktop
    busybox
    chromium
    easyeffects
    firefox
    gcc
    gnumake
    mullvad-browser
    mullvad-vpn
    newsboat
    nextcloud-client
    nodejs
    prismlauncher
    signal-desktop
    spotify
    thunderbird
    tree-sitter
    tofi

  ];
}

