import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Widgets
import Quickshell.Hyprland
import Quickshell.Wayland
import "root:/config"

Scope {
    id: root

    readonly property list<DesktopEntry> applications: DesktopEntries.applications.values

    GlobalShortcut {
        appid: "kushell"
        name: "applauncher"
        onPressed: {
            appLauncherLoader.active = true
        }
    }


    LazyLoader {
        id: appLauncherLoader
        active: false

        PanelWindow {
            id: appLauncher
            color: ShellConfig.overlayShadowColor
            exclusionMode: ExclusionMode.Ignore
            WlrLayershell.layer: WlrLayer.Overlay
            WlrLayershell.keyboardFocus: WlrKeyboardFocus.Exclusive
            anchors {
                top: true
                bottom: true
                left: true
                right: true
            }

            HyprlandFocusGrab {
                active: appLauncherLoader.active
                windows: [ appLauncher ]
            }

            MouseArea {
                anchors.fill: parent
                onPressed: appLauncherLoader.active = false
            }

            Rectangle {
                anchors.centerIn: parent
                implicitWidth: 800
                implicitHeight: 400
                radius: 18
                color: ShellConfig.backgroundColor

                Column {
                    property string searchQuery: ""

                    id: container
                    anchors.fill: parent

                    Rectangle {
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: parent.width * 0.95
                        height: 30
                        color: ShellConfig.backgroundAccentColor

                        TextInput {
                            id: searchField
                            anchors.verticalCenter: parent.verticalCenter
                            color: ShellConfig.textColor
                            font.pixelSize: ShellConfig.fontSize
                            font.family: ShellConfig.fontFamily
                            focus: true
                            onTextChanged: container.searchQuery = this.text

                            Keys.onPressed: event => {
                                if (event.key == Qt.Key_Down) {
                                    appList.currentIndex = Math.min(appList.model.length - 1, appList.currentIndex + 1)
                                } else if (event.key == Qt.Key_Up) {
                                    appList.currentIndex = Math.max(0, appList.currentIndex - 1)
                                } else if (event.key == Qt.Key_Enter - 1) { // for some reason enter is -1?
                                    appList.model[appList.currentIndex].execute()
                                    appLauncherLoader.active = false
                                } else if (event.key == Qt.Key_Escape) {
                                    appLauncherLoader.active = false
                                }
                            }
                        }
                    }
                    
                    ScrollView {
                        implicitWidth: parent.width * 0.95
                        implicitHeight: parent.height * 0.8
                        clip: true

                        ListView {
                            id: appList
                            currentIndex: 0
                            anchors.fill: parent
                            model: root.applications.filter(a => a.name.toLowerCase().includes(container.searchQuery.toLowerCase())).sort((a, b) => a.name.localeCompare(b.name))

                            delegate: Rectangle {
                                required property int index
                                required property DesktopEntry modelData

                                implicitWidth: parent.width
                                implicitHeight: 30
                                color: appList.currentIndex == index ? ShellConfig.highlightColor : "transparent"

                                MouseArea {
                                    id: mouseArea
                                    hoverEnabled: true
                                    anchors.fill: parent
                                    onEntered: {
                                        appList.currentIndex = index
                                    }
                                    onPressed: {
                                        modelData.execute()
                                        appLauncherLoader.active = false
                                    }
                                }

                                Row {
                                    anchors.fill: parent
                                    spacing: 10

                                    IconImage {
                                        source: Quickshell.iconPath(modelData?.icon, "root:/assets/broken_image.svg")
                                        height: parent.height
                                        width: height
                                    }
                                    
                                    Text {
                                        anchors.verticalCenter: parent.verticalCenter
                                        text: `${modelData.name}`
                                        color: ShellConfig.textColor
                                        font.pixelSize: ShellConfig.fontSize
                                        font.family: ShellConfig.fontFamily
                                    }
                                }

                            }
                        }
                    }
                }
            }
        }
    }
}