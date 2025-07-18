import Quickshell
import Quickshell.Wayland
import QtQuick
import "root:/config"

PanelWindow {
  WlrLayershell.exclusionMode: ExclusionMode.Ignore
  WlrLayershell.layer: WlrLayer.Background
  color: ShellConfig.backgroundColor
  anchors {
    top: true
    bottom: true
    left: true
    right: true
  }

  Image {
    asynchronous: true
    anchors.fill: parent
    width: parent.width
    height: parent.height
    fillMode: Image.PreserveAspectCrop
    source: ShellConfig.wallpaperPath
  }
}
