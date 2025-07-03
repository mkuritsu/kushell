import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import "root:/widgets"
import "root:/services"
import "root:/config"

Scope {
    PowerMenu {
        id: powerMenu
        active: false
    }

    Variants {
        model: Quickshell.screens

        PanelWindow {
            property var modelData
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

                Rectangle { // left
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    color: "transparent"
                    clip: true

                    Row {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.leftMargin: 10
                        anchors.left: parent.left
                        spacing: 0

                        WindowTitleWidget {
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }

                }

                Rectangle { // center
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    color: "transparent"

                    WorkspacesWidget { 
                        screen: modelData
                        anchors.centerIn: parent
                    }
                }

                Rectangle { // right
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
                            source: "root:/assets/shutdown.png"
                            anchors.verticalCenter: parent.verticalCenter
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