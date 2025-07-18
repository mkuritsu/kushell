import Quickshell
import Quickshell.Wayland
import Quickshell.Widgets
import QtQuick
import "root:/config"

Scope {
  required property ShellScreen screen
  property real margin: 7
  property real borderExtraMargin: 0

  id: root

  PanelWindow {
    WlrLayershell.exclusionMode: ExclusionMode.Ignore
    WlrLayershell.layer: WlrLayer.Background
    color: ShellConfig.backgroundColor
    screen: root.screen
    anchors {
      top: true
      bottom: true
      left: true
      right: true
    }

    ClippingRectangle {
      anchors.fill: parent
      anchors.margins: root.margin
      radius: 10
      
      Image {
        asynchronous: true
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
        source: ShellConfig.wallpaperPath
      }
    }
  }

  PanelWindow {
    anchors.left: true
    anchors.right: true
    anchors.bottom: true
    color: "transparent"
    implicitHeight: root.margin + root.borderExtraMargin
    screen: root.screen
  }

  PanelWindow {
    anchors.left: true
    anchors.right: true
    anchors.top: true
    color: "transparent"
    implicitHeight: root.margin + root.borderExtraMargin
    screen: root.screen
  }

  PanelWindow {
    anchors.top: true
    anchors.bottom: true
    anchors.left: true
    color: "transparent"
    implicitHeight: root.margin + root.borderExtraMargin
    implicitWidth: implicitHeight
    screen: root.screen
  }

  PanelWindow {
    anchors.top: true
    anchors.bottom: true
    anchors.right: true
    color: "transparent"
    implicitHeight: root.margin + root.borderExtraMargin
    implicitWidth: implicitHeight
    screen: root.screen
  }
}
