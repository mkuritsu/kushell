import Quickshell
import Quickshell.Wayland
import QtQuick
import "root:/config"

PanelWindow {
  WlrLayershell.exclusionMode: ExclusionMode.Ignore
  WlrLayershell.layer: WlrLayer.Background
  color: "transparent"
  anchors {
    top: true
    bottom: true
    left: true
    right: true
  }

  Image {
    id: wallpaper
    asynchronous: true
    anchors.fill: parent
    fillMode: Image.PreserveAspectCrop
    source: ShellConfig.wallpaperPath
  }
}
