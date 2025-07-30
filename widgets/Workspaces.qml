import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import qs.config

import "root:/services"

RowLayout {
  required property ShellScreen screen
  required property real radius

  id: row
  height: parent.height

  Repeater {
    model: ScriptModel {
      values: Hyprland.workspaces.values.filter(w => w.monitor != null && w.monitor.name == screen.name)
    }

    Rectangle {
      required property int index
      required property HyprlandWorkspace modelData

      id: container
      Layout.fillHeight: true
      width: 30
      color: (modelData.focused ? Settings.accentColor : "transparent")
      bottomLeftRadius: index == 0 ? row.radius : 0
      topLeftRadius: bottomLeftRadius

      Text {
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
