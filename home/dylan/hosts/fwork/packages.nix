{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # USER packages for THIS machine only

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
    nodejs
    prismlauncher
    signal-desktop
    spotify
    thunderbird
    tree-sitter
    tofi

  ];
}

