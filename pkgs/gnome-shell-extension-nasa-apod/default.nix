{ stdenv, fetchFromGitHub, glib, gettext, intltool }:

stdenv.mkDerivation rec {
  pname = "gnome-shell-extension-nasa-apod";
  version = "21";

  src = fetchFromGitHub {
    owner = "Elinvention";
    repo = "gnome-shell-extension-nasa-apod";
    rev = "${version}";
    sha256 = "0pp6znlc0d4h7qfs428pz3hbfhkpwi9mvhfxckzisdw59rd8l29s";
  };

  buildInputs = [
    glib gettext intltool
  ];

  makeFlags = [
    "INSTALL_PATH=$(out)/share/gnome-shell/extensions"
  ];
}
