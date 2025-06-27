import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray

Row {
    id: row
    spacing: 10

    Repeater {
        model: SystemTray.items

        MouseArea {
            required property var modelData

            id: trayItem
            height: row.height
            implicitWidth: height
            onClicked: menu.open()

            QsMenuAnchor {
                id: menu
                menu: modelData.menu
                anchor {
                    item: trayItem
                    rect.y: row.height
                }
            }

            IconImage {
                asynchronous: true
                anchors.fill: parent
                source: modelData.icon
            }
        }
    }
}