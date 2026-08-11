arg:
let
  repo = "https://github.com/NixOS/nixpkgs";
  rev = "4014d8bb312b04b49ec74adff5f9b32982bd0580";
  nixpkgs = import (builtins.fetchTarball {
    url = "${repo}/archive/${rev}.tar.gz";
    sha256 = "0h2idwfmv684img0kjy3da9cm37378bbp0g1vpqd570rl665af1r";
  }) arg;
in
# Unstable channel no longer supports Intel architecture for macOS. We can use the 26.05 channel
# to keep testing on that platform for a little longer.
# TODO: remove this file when 26.05 is EOL (end of 2026)
nixpkgs
