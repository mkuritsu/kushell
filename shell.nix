{ pkgs, quickshell }:
pkgs.mkShell {
  packages = [ quickshell ];
}
