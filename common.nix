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
    nh
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

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.configurationLimit = 5;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 90d";
  };

}
