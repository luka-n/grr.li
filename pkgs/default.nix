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

  monoid = super.monoid.overrideAttrs (oldAttrs: {
    src = super.fetchFromGitHub {
      owner = "jtojnar";
      repo = "monoid";
      rev = "f84f2ed61301ee84dadd16351314394f22ebed2f";
      sha256 = "0p41kqp1zhsxk10v2vhgaphg6v9v10j0v6rnpjh37gfrj98rqwpl";
    };

    nativeBuildInputs = [
      (super.pkgs.python3.withPackages (pp: with pp; [
        fontforge
      ]))
    ];
  });
}
