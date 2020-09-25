{ stdenv, fetchFromGitHub, glib, gettext, intltool }:

stdenv.mkDerivation rec {
  pname = "gnome-shell-extension-no-title-bar";
  version = "git-2020-05-14";

  src = fetchFromGitHub {
    owner = "poehlerj";
    repo = "no-title-bar";
    rev = "4115905e1d3df51072a2c6b173a471667181b31a";
    sha256 = "0hcbbfapk76lr8yajacx59cyzs2c1dnccf8fq3gv3zk1z8jfqb1h";
  };

  buildInputs = [
    glib gettext intltool
  ];

  makeFlags = [
    "INSTALLBASE=$(out)/share/gnome-shell/extensions"
  ];
}
