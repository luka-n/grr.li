{ stdenv, fetchFromGitHub, glib, gettext, meson, ninja, git, zip, unzip }:

stdenv.mkDerivation rec {
  pname = "gnome-shell-extension-tweaks-system-menu";
  version = "8";

  src = fetchFromGitHub {
    owner = "F-i-f";
    repo = "tweaks-system-menu";
    rev = "v${version}";
    sha256 = "1az87g3vjhq7jv5c2zirvm0lywixqvswqhycdgczcsqfyd5i88cl";
  };

  buildInputs = [
    glib gettext meson ninja git zip unzip
  ];

  buildPhase = ''
    ninja extension.zip
  '';

  uuid = "tweaks-system-menu@extensions.gnome-shell.fifi.org";

  installPhase = ''
    mkdir -p $out/share/gnome-shell/extensions/${uuid}
    unzip -d $out/share/gnome-shell/extensions/${uuid} extension.zip
  '';
}
