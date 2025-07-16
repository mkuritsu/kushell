import Quickshell
import QtQuick
import QtQuick.Layouts
import "root:/config"
import "root:/widgets"
import "root:/services"

PanelWindow {
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
    width: parent.width * (ActiveWindow.activeWindow ? 1 : 0.45)
    bottomLeftRadius: ActiveWindow.activeWindow ? 0 : 10
    bottomRightRadius: ActiveWindow.activeWindow ? 0 : 10

    Behavior on width {
      PropertyAnimation {
        duration: 200
        easing.type: Easing.InOutQuad;
      }
    }
  }

  Rectangle {
    id: bar
    anchors.centerIn: parent
    color: ShellConfig.backgroundColor
    height: parent.height
    width: parent.width * 0.45
    bottomLeftRadius: ActiveWindow.activeWindow ? 0 : 10
    bottomRightRadius: ActiveWindow.activeWindow ? 0 : 10

    RowLayout {
      anchors.fill: parent
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
