self: super:
{
  gnomeExtensions = super.gnomeExtensions // {
    alt-tab-raise-first-window = super.callPackage ./gnome-shell-extension-alt-tab-raise-first-window { };
    middleclickclose = super.callPackage ./gnome-shell-extension-middleclickclose { };
    nasa-apod = super.callPackage ./gnome-shell-extension-nasa-apod { };
    no-title-bar = super.callPackage ./gnome-shell-extension-no-title-bar { };
    openweather = super.callPackage ./gnome-shell-extension-openweather { };
    refresh-wifi = super.callPackage ./gnome-shell-extension-refresh-wifi { };
    tweaks-system-menu = super.callPackage ./gnome-shell-extension-tweaks-system-menu { };
    windowoverlay-icons = super.callPackage ./gnome-shell-extension-windowoverlay-icons { };
  };
}
