{
  network = {
    description = "grr";
  };

  hekate = import ./grr/hekate.nix;
  tiamat = import ./grr/tiamat.nix;
}
