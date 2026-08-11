arg:
let
  repo = "https://github.com/NixOS/nixpkgs";
  rev = "d482ef84049d9b7276b83a06e4e4d76983830097";
  nixpkgs = import (builtins.fetchTarball {
    url = "${repo}/archive/${rev}.tar.gz";
    sha256 = "0azzfznifj3kvgjl7638kxkr0dr2rjh8r2p5rphc97sz84677vn1";
  }) arg;
in
# Unstable channel no longer supports Intel architecture for macOS. We can use the 26.05 channel
# to keep testing on that platform for a little longer.
# TODO: remove this when 26.05 is EOL (end of 2026)
if builtins.currentSystem == "x86_64-darwin" then (import ./pkgs-26.05.nix arg) else nixpkgs
