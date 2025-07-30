import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import qs.widgets as Widgets
import qs.config

PanelWindow {
  id: root
  anchors {
    top: true
    left: true
    right: true
  }
  implicitHeight: Settings.barHeight
  color: "transparent"

  Rectangle {
    id: barContainer
    color: Settings.backgroundColor
    anchors.fill: parent

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
          anchors.leftMargin: 10
          anchors.fill: parent
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

