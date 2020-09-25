{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "gnome-shell-extension-alt-tab-raise-first-window";
  version = "git-2019-04-10";

  src = fetchFromGitHub {
    owner = "pop-os";
    repo = "gnome-shell-extension-alt-tab-raise-first-window";
    rev = "0c3e1aa2a8b6486e6bd3100f8dfde17354ba7eb5";
    sha256 = "159r2wwc380v34fmvxdvy0f1166l4bhrc4nhcdjn397sls8c16sa";
  };

  makeFlags = [
    "INSTALLBASE=$(out)/share/gnome-shell/extensions"
  ];
}
