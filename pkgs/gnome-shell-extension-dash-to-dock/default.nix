{ stdenv, fetchFromGitHub, glib, gettext, sassc }:

stdenv.mkDerivation rec {
  pname = "gnome-shell-extension-dash-to-dock";
  version = "git-2021-07-04";

  src = fetchFromGitHub {
    owner = "micheleg";
    repo = "dash-to-dock";
    rev = "e42e0d73da6a00121dfd467e61bd5b95bdba71a4";
    sha256 = "1mlqlrpslwmv30cp96515pa916ibj07h4pfnsq4mzbim7m9kwg4d";
  };

  nativeBuildInputs = [
    glib gettext sassc
  ];

  makeFlags = [
    "INSTALLBASE=${placeholder "out"}/share/gnome-shell/extensions"
  ];

  uuid = "dash-to-dock@micxgx.gmail.com";
}
