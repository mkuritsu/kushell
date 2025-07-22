inputs: final: prev: {
  quickshell = inputs.quickshell.packages.${final.system}.default.override {
    withX11 = false;
    withI3 = false;
  };
}
