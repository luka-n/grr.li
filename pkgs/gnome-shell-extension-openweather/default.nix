{ stdenv, fetchFromGitLab, glib, gettext, pkgconfig, gnome3 }:

stdenv.mkDerivation rec {
  pname = "gnome-shell-extension-openweather";
  version = "git-2020-06-07";

  src = fetchFromGitLab {
    owner = "jenslody";
    repo = "gnome-shell-extension-openweather";
    rev = "834e037086a46f04801df321f3fab6c039bee10b";
    sha256 = "1i6rdb2blpg75ppl1ipi4wv9asjpngbjvcxafzn3r3vyd5fcdp4a";
  };

  buildInputs = [
    glib gettext pkgconfig gnome3.gnome-common
  ];

  preConfigure = "NOCONFIGURE=1 ./autogen.sh";
}
