import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import "root:/widgets"
import "root:/config"

LazyLoader {
    id: root
    active: false

    PanelWindow {
        id: window
        exclusionMode: ExclusionMode.Ignore
		WlrLayershell.layer: WlrLayer.Overlay
        WlrLayershell.keyboardFocus: WlrKeyboardFocus.Exclusive
        color: ShellConfig.overlayShadowColor
        anchors {
            top: true
            bottom: true
            left: true
            right: true
        }

        MouseArea {
            anchors.fill: parent
            onClicked: root.active = false
        }

        Rectangle {
            anchors.centerIn: parent
            width: parent.width * 0.7
            height: parent.height * 0.7
            color: ShellConfig.backgroundColor
            radius: 25
            focus: true

            Keys.onPressed: event => {
                if (event.key == Qt.Key_Escape) {
                    root.active = false;
                }
            }

            GridLayout {
                anchors.fill: parent
                columns: 2
                columnSpacing: 0
                rowSpacing: 0

                PowerButton {
                    text: "Shutdown"
                    icon: "root:/assets/shutdown.png"
                    command: "systemctl poweroff"
                    topLeftRadius: 25
                }

                PowerButton {
                    text: "Reboot"
                    icon: "root:/assets/reboot.png"
                    command: "systemctl reboot"
                    topRightRadius: 25
                }

                PowerButton {
                    text: "Logout"
                    icon: "root:/assets/logout.png"
                    command: "hyprctl dispatch exit"
                    bottomLeftRadius: 25
                }

                PowerButton {
                    text: "Sleep"
                    icon: "root:/assets/suspend.png"
                    command: "systemctl suspend"
                    bottomRightRadius: 25
                    onClicked: {
                        root.active = false;
                    }
                }
            }
        }
    }
}