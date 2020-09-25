{ stdenv, fetchFromGitHub, }:

stdenv.mkDerivation rec {
  pname = "gnome-shell-extension-refresh-wifi";
  version = "11";

  src = fetchFromGitHub {
    owner = "kgshank";
    repo = "gse-refresh-wifi";
    rev = "${version}";
    sha256 = "1z5w186nkbbapfx574g3by4mcwjslz0hgk0yqamrkadr8anqi9qq";
  };

  uuid = "refresh-wifi@kgshank.net";

  installPhase = ''
    mkdir -p $out/share/gnome-shell/extensions
    cp -r ${uuid} $out/share/gnome-shell/extensions
  '';
}
