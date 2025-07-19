import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import qs.widgets as Widgets
import qs.config

PanelWindow {
  // TODO: add better check for this, probably need to check current Hyprland workspace in each monitor and if they have any active client in them
  // usage of quickshell hyprland ipc module will be needed for this i believe
  readonly property bool hasActiveWindow: ToplevelManager.activeToplevel?.activated ?? false

  id: root
  anchors {
    top: true
    left: true
    right: true
    bottom: true
  }
  implicitHeight: 25
  focusable: false
  color: "transparent"
  WlrLayershell.layer: WlrLayer.Top
  WlrLayershell.exclusionMode: ExclusionMode.Ignore
  mask: Region {
    item: barContainer
  }

  Rectangle {
    id: barContainer
    anchors.horizontalCenter: parent.horizontalCenter
    width: root.screen.width * 0.4
    height: !root.hasActiveWindow || (root.hasActiveWindow && mouseArea.containsMouse) ? 25 : 7
    bottomLeftRadius: 10
    bottomRightRadius: bottomLeftRadius
    color: Settings.backgroundColor

    Behavior on height {
      PropertyAnimation {
        duration: 200
        easing.type: Easing.InOutQuad
      }
    }

    MouseArea {
      id: mouseArea
      hoverEnabled: true
      anchors.fill: parent
    }

    RowLayout {
      visible: parent.height > 10
      anchors.fill: parent
      spacing: 0

      Rectangle {
        Layout.fillWidth: true
        Layout.fillHeight: true
        color: "transparent"
        bottomLeftRadius: barContainer.bottomLeftRadius

        Widgets.Workspaces {
          anchors.verticalCenter: parent.verticalCenter
          bottomRadius: parent.bottomLeftRadius
          screen: root.screen
        }
      }

      Rectangle {
        Layout.fillWidth: true
        Layout.fillHeight: true
        color: "transparent"

        Widgets.Clock {
          anchors.centerIn: parent
        }
      }

      Rectangle {
        Layout.fillWidth: true
        Layout.fillHeight: true
        color: "transparent"
        bottomRightRadius: barContainer.bottomRightRadius
      }
    }
  }
}
