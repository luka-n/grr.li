{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    file
    htop
    ncdu
    vim
    wget
  ];

  nixpkgs.overlays = [
    (import ../pkgs)
  ];
}
