import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import "root:/config"
import "root:/widgets"
import "root:/services"

Scope {
  readonly property bool hasActiveWindow: ToplevelManager.activeToplevel?.activated ?? false
  required property ShellScreen screen

  id: root

  // bar background
  PanelWindow {
    screen: root.screen
    implicitHeight: 25
    color: "transparent"
    anchors {
      top: true
      left: true
      right: true
    }

    Rectangle {
      id: background
      anchors.centerIn: parent
      color: ShellConfig.backgroundColor
      height: parent.height
      width: parent.width * (root.hasActiveWindow ? 1 : 0.45)
      bottomLeftRadius: root.hasActiveWindow ? 0 : 10
      bottomRightRadius: root.hasActiveWindow ? 0 : 10

      Behavior on width {
        PropertyAnimation {
          duration: 200
          easing.type: Easing.InOutQuad;
        }
      }
    }
  }

  // actual bar in top layer
  PanelWindow {
    screen: root.screen
    color: "transparent"
    focusable: false
    WlrLayershell.layer: WlrLayer.Top
    WlrLayershell.exclusionMode: ExclusionMode.Ignore
    anchors {
      top: true
      left: true
      right: true
    }

    Rectangle {
      id: bar
      anchors.horizontalCenter: parent.horizontalCenter
      color: ShellConfig.backgroundColor
      height: 25
      width: parent.width * 0.45
      bottomLeftRadius: root.hasActiveWindow ? 0 : 10
      bottomRightRadius: root.hasActiveWindow ? 0 : 10

      Behavior on height {
        PropertyAnimation {
          duration: 200
          easing.type: Easing.InOutQuad
        }
      }

      MouseArea {
        anchors.fill: parent
        onClicked: {
          if (bar.height == 25) {
            bar.height = 100
          } else {
            bar.height = 25
          }
        }
      }

      ColumnLayout {
        anchors.fill: parent
        spacing: 0

        RowLayout {
          Layout.fillWidth: true
          implicitHeight: 25
          spacing: 0

          Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: "transparent"
            bottomLeftRadius: background.bottomLeftRadius

            WorkspacesWidget {
              anchors.verticalCenter: parent.verticalCenter
              screen: modelData
              bottomRadius: background.bottomRightRadius
            }
          }

          Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: "transparent"

            ClockWidget {
              anchors.centerIn: parent
            }
          }

          Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: "transparent"
            bottomRightRadius: background.bottomRightRadius

            Row {
              anchors.right: parent.right
              anchors.verticalCenter: parent.verticalCenter
              height: parent.height
              spacing: 15

              BatteryWidget {
                anchors.verticalCenter: parent.verticalCenter
              }

              AudioWidget {
                anchors.verticalCenter: parent.verticalCenter
              }
            }
          }
        }
      }
    }
  }
}
