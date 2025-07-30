import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import qs.config

import "root:/services"

Row {
  required property ShellScreen screen

  id: row

  Repeater {
    model: ScriptModel {
      values: Hyprland.workspaces.values.filter(w => w.monitor != null && w.monitor.name == screen.name)
    }

    Rectangle {
      required property int index
      required property HyprlandWorkspace modelData

      id: container
      width: text.width + 30
      height: text.height + 5
      anchors.verticalCenter: parent.verticalCenter
      radius: 20
      color: (modelData.focused ? Settings.accentColor : "transparent")

      Text {
        id: text
        anchors.centerIn: parent
        text: `${modelData.id}`
        color: modelData.focused ? Settings.textColor : Settings.accentColor
        font.pixelSize: Settings.fontSize
        font.family: Settings.fontFamily
        font.bold: true
      }

      MouseArea {
        anchors.fill: parent
        onPressed: {
          if (!modelData.focused) {
            modelData.activate()
          }
        }
      }
    }
  }
}
