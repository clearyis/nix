{ pkgs, ... }:

{

  nix.settings.experimental-features = [ "nix-command" "flakes" "cgroups" "pipe-operators" ];

    environment.systemPackages = with pkgs; [
            
      btop
      curl
      dig
      fd
      git
      gnumake
      helix
      htop
      ipcalc
      less
      lf
      neovim
      nh
      nushell
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
