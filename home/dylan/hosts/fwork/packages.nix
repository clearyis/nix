{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # USER packages for THIS machine only

    alacritty
    brave
    bitwarden-desktop
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
    gnutar
    thunderbird
    tree-sitter
    tofi

  ];
}

