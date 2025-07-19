import Quickshell
import Quickshell.Wayland
import Quickshell.Widgets
import QtQuick
import qs.config

PanelWindow {
  WlrLayershell.exclusionMode: ExclusionMode.Ignore
  WlrLayershell.layer: WlrLayer.Background
  color: Settings.backgroundColor
  screen: root.screen
  anchors {
    top: true
    bottom: true
    left: true
    right: true
  }

  Image {
    asynchronous: true
    anchors.fill: parent
    fillMode: Image.PreserveAspectCrop
    source: Settings.wallpaperPath
  }
}
