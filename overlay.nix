inputs: final: prev: {
  quickshell = inputs.quickshell.packages.${final.system}.default;
}
