import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import "root:/config"

RowLayout {
    required property var screen
    
    id: row
    height: parent.height

    Repeater {
        model: Hyprland.workspaces

        Rectangle {
            required property int index
            required property var modelData

            property bool focused: modelData.focused

            id: container
            visible: modelData.monitor == null ? false : modelData.monitor.name == screen.name
            width: 30
            height: row.height
            color: (this.focused ? ShellConfig.accentColor : "transparent")
            
            Text {
                anchors.centerIn: parent
                text: `${modelData.id}`
                color: container.focused ? ShellConfig.textColor : ShellConfig.accentColor
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
