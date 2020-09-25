{ stdenv, fetchFromGitHub, glib, gettext, zip, unzip }:

stdenv.mkDerivation rec {
  pname = "gnome-shell-extension-windowoverlay-icons";
  version = "35";

  src = fetchFromGitHub {
    owner = "sustmi";
    repo = "gnome-shell-extension-windowoverlay-icons";
    rev = "v${version}";
    sha256 = "0gl4yzy1hs5n79k3nclhgfy4h44hpxjab0vy435smzwa4p7f06x8";
  };

  nativeBuildInputs = [
    glib gettext zip unzip
  ];

  buildPhase = ''
    make zip
  '';

  uuid = "windowoverlay-icons@sustmidown.centrum.cz";

  installPhase = ''
    mkdir -p $out/share/gnome-shell/extensions/${uuid}
    unzip -d $out/share/gnome-shell/extensions/${uuid} windowoverlay-icons.zip
  '';
}
