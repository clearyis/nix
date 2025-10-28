{ config, pkgs, ... }:
{
  imports = [
    ./steam.nix
    ./fw-fanctrl.nix
  ];
}
