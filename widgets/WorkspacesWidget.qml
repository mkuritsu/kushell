import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland

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
            color: (this.focused ? "#CBA6F7" : "transparent")
            
            Text {
                anchors.centerIn: parent
                text: `${modelData.id}`
                color: container.focused ? "white" : "#CBA6F7"
                font.pixelSize: 14
                font.family: "jetbrains mono"
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
