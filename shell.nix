{
  pkgs,
  quickshell,
  kdePackages,
}:
pkgs.mkShell {
  packages = [
    quickshell
    kdePackages.qttools
  ];
}
