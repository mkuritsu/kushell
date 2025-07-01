import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import "root:/widgets"

LazyLoader {
    id: root
    active: false

    PanelWindow {
        id: window
        exclusionMode: ExclusionMode.Ignore
		WlrLayershell.layer: WlrLayer.Overlay
        WlrLayershell.keyboardFocus: WlrKeyboardFocus.Exclusive
        color: "#c2000000"
        anchors {
            top: true
            bottom: true
            left: true
            right: true
        }

        Keys.onPressed: event => {
            if (event.key == Qt.Key_Escape) {
                root.active = false;
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: root.active = false
        }

        Rectangle {
            anchors.centerIn: parent
            width: parent.width * 0.7
            height: parent.height * 0.7
            color: "black"

            GridLayout {
                anchors.fill: parent
                columns: 2
                columnSpacing: 0
                rowSpacing: 0

                PowerButton {
                    text: "Shutdown"
                    icon: "root:/assets/shutdown.png"
                    command: "systemctl shutdown"
                }

                PowerButton {
                    text: "Reboot"
                    icon: "root:/assets/reboot.png"
                    command: "systemctl reboot"
                }

                PowerButton {
                    text: "Logout"
                    icon: "root:/assets/logout.png"
                    command: "hyprctl dispatch exit"
                }

                PowerButton {
                    text: "Sleep"
                    icon: "root:/assets/suspend.png"
                    command: "systemctl suspend"
                }
            }
        }
    }
}