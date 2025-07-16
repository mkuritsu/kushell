import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import "root:/config"

import "root:/services"

RowLayout {
  required property ShellScreen screen
  required property real bottomRadius

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
      color: (modelData.focused ? ShellConfig.accentColor : "transparent")
      bottomLeftRadius: index == 0 ? row.bottomRadius : 0

      Text {
        anchors.centerIn: parent
        text: `${modelData.id}`
        color: modelData.focused ? ShellConfig.textColor : ShellConfig.accentColor
        font.pixelSize: ShellConfig.fontSize
        font.family: ShellConfig.fontFamily
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
