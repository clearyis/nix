{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    
    btop
    curl
    dig
    fd
    git
    htop
    ipcalc
    less
    lf
    neovim
    p7zip
    ripgrep
    tmux
    traceroute
    tree
    unzip
    vim
    wget
    xz
    zip
    zstd

  ];

  boot.loader.systemd-boot.configurationLimit = 5;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 90d";
  };

}
