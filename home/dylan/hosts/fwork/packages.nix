{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # USER packages for THIS machine only

    brave
    bitwarden-desktop
    chromium
    easyeffects
    firefox
    mullvad-browser
    mullvad-vpn
    signal-desktop
    spotify
    thunderbird
    tofi

  ];
}

