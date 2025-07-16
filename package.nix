{
  symlinkJoin,
  makeWrapper,
  quickshell,
}:
symlinkJoin {
  pname = "kushell";
  version = "0.1-${quickshell.version}";

  paths = [ quickshell ];

  nativeBuildInputs = [ makeWrapper ];

  postBuild = ''
    makeWrapper $out/bin/quickshell $out/bin/kushell --add-flags '-p ${./.}'
  '';
}
