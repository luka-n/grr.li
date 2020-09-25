{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    htop
    vim
    wget
  ];

  nixpkgs.overlays = [
    (import ../pkgs)
  ];
}
