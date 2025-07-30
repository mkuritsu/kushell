import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import qs.widgets as Widgets
import qs.config

PanelWindow {
  readonly property bool hasActiveWindow: ToplevelManager.activeToplevel?.activated ?? false

  id: root
  anchors {
    top: true
    left: true
    right: true
  }
  margins.top: root.hasActiveWindow ? 3 : 3
  implicitHeight: Settings.barHeight
  color: "transparent"

  Rectangle {
    id: barContainer
    anchors.fill: parent
    anchors.leftMargin: root.hasActiveWindow ? 20 : 20
    anchors.rightMargin: root.hasActiveWindow ? 20 : 20
    anchors.bottomMargin: 0
    radius: root.hasActiveWindow ? 10 : 10
    color: Settings.backgroundColor

    Behavior on anchors.leftMargin {
      PropertyAnimation {
        duration: 300
      }
    }

    Behavior on anchors.rightMargin {
      PropertyAnimation {
        duration: 300
      }
    }
    
    RowLayout {
      anchors.fill: parent
      spacing: 0

      Rectangle {
        Layout.fillHeight: true
        Layout.fillWidth: true
        bottomLeftRadius: barContainer.radius
        topLeftRadius: bottomLeftRadius
        clip: true
        color: "transparent"

        Widgets.Workspaces {
          anchors.verticalCenter: parent.verticalCenter
          screen: root.screen
          radius: parent.bottomLeftRadius
        }
      }

      Rectangle {
        Layout.fillHeight: true
        Layout.fillWidth: true
        clip: true
        color: "transparent"

        Widgets.Clock {
          anchors.centerIn: parent
        }
      }

      Rectangle {
        Layout.fillHeight: true
        Layout.fillWidth: true
        bottomRightRadius: barContainer.radius
        topRightRadius: bottomRightRadius
        clip: true
        color: "transparent"

        Row {
          anchors.fill: parent
          anchors.rightMargin: 10
          spacing: 30
          layoutDirection: Qt.RightToLeft

          Widgets.Audio {
            anchors.verticalCenter: parent.verticalCenter
          }

          Widgets.Battery {
            anchors.verticalCenter: parent.verticalCenter
          }
        }
      }
    }
  }
}

