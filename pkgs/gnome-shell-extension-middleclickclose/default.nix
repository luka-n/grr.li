{ stdenv, fetchFromGitHub, glib }:

stdenv.mkDerivation rec {
  pname = "gnome-shell-extension-middleclickclose";
  version = "git-2020-09-19";

  src = fetchFromGitHub {
    owner = "p91paul";
    repo = "middleclickclose";
    rev = "7e8b62239777627f10bd3a365b557a246abb20d0";
    sha256 = "11hwfm5baj42i66haajv6lzkgiwh85kk1lj8p0gh7r3kj9w9ggq5";
  };

  uuid = "middleclickclose@paolo.tranquilli.gmail.com";

  buildInputs = [
    glib
  ];

  buildPhase = ''
    glib-compile-schemas ${uuid}/schemas
  '';

  installPhase = ''
    mkdir -p $out/share/gnome-shell/extensions
    cp -r ${uuid} $out/share/gnome-shell/extensions
  '';
}
