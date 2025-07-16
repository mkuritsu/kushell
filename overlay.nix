inputs: final: prev: {
  quickshell = inputs.quickshell.packages.${final.system}.default.override {
    # Disable uneeded modules to have less things to compile
    withX11 = false;
    withPam = false;
    withI3 = false;
  };
}
