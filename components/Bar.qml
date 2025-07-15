import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import "root:/widgets"
import "root:/config"

Scope {
    PowerMenu {
        id: powerMenu
        active: false
    }

    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property ShellScreen modelData

            screen: modelData
            color: ShellConfig.backgroundColor
            implicitHeight: 30
            anchors {
                top: true
                left: true
                right: true
            }

            RowLayout {
                anchors.fill: parent
                spacing: 0

                // left
                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    color: "transparent"
                }

                // center
                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    color: "transparent"

                    WorkspacesWidget { 
                        screen: modelData
                        anchors.centerIn: parent
                    }
                }

                // right
                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    color: "transparent"

                    Row {
                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.rightMargin: 10
                        spacing: 15

                        TrayWidget {
                            anchors.verticalCenter: parent.verticalCenter
                            height: parent.height
                        }

                        BatteryWidget {
                            anchors.verticalCenter: parent.verticalCenter   
                        }
                        
                        AudioWidget { 
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        ClockWidget {
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        IconImage {
                            anchors.verticalCenter: parent.verticalCenter
                            source: "root:/assets/shutdown.png"
                            height: parent.height * 0.9
                            width: height

                            MouseArea {
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: powerMenu.active = true
                            }
                        }
                    }
                }
            }
        }
    }
}