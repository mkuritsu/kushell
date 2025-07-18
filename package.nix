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
    makeWrapper $out/bin/quickshell $out/bin/kushell --unset QT_STYLE_OVERRIDE --add-flags '-p ${./.}'
  '';
}
