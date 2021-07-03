self: super:
{
  gnomeExtensions = super.gnomeExtensions // {
    dash-to-dock = super.callPackage ./gnome-shell-extension-dash-to-dock { };
  };
}
