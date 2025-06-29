import Quickshell
import QtQuick
import QtQuick.Layouts
import "root:/widgets"
import "root:/services"

Scope {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            property var modelData
            screen: modelData
            color: "#181825"
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

                        AudioWidget { 
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        ClockWidget {
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                }
            }
        }
    }
}