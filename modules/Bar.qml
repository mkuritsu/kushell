import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import "root:/config"
import "root:/widgets"
import "root:/services"

Scope {
  required property ShellScreen screen
  // TODO: add better check for this, probably need to check current Hyprland workspace in each monitor and if they have any active client in them
  // usage of quickshell hyprland ipc module will be needed for this i believe
  readonly property bool hasActiveWindow: (ToplevelManager.activeToplevel?.activated && ToplevelManager.activeToplevel?.screens.includes(screen)) ?? false

  id: root
  
  PanelWindow {
    id: window
    anchors.top: true
    implicitHeight: !root.hasActiveWindow || (root.hasActiveWindow && mouseArea.containsMouse) ? 25 : 7
    implicitWidth: screen.width * 0.45
    color: "transparent"
    screen: root.screen
    WlrLayershell.layer: WlrLayer.Top
    WlrLayershell.exclusionMode: ExclusionMode.Ignore

    MouseArea {
      id: mouseArea
      anchors.fill: parent
      hoverEnabled: true
    }

    Rectangle {
      id: barContainer
      visible: window.implicitHeight > 7
      anchors.fill: parent
      bottomLeftRadius: 15
      bottomRightRadius: bottomLeftRadius
      color: ShellConfig.backgroundColor

      RowLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
          Layout.fillWidth: true
          Layout.fillHeight: true
          bottomLeftRadius: barContainer.bottomLeftRadius
          color: "transparent"
          clip: true

          WorkspacesWidget {
            anchors.verticalCenter: parent.verticalCenter
            bottomRadius: parent.bottomLeftRadius
            screen: window.screen
          }
        }

        Rectangle {
          Layout.fillWidth: true
          Layout.fillHeight: true
          color: "transparent"
          clip: true

          ClockWidget {
            anchors.centerIn: parent
          }
        }

        Rectangle {
          Layout.fillWidth: true
          Layout.fillHeight: true
          bottomRightRadius: barContainer.bottomRightRadius
          color: "transparent"
          clip: true

          Row {
            anchors.right: parent.right
            anchors.rightMargin: 10
            height: parent.height

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
