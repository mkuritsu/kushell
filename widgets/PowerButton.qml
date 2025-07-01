import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root
    required property string command
    required property string text
    required property string icon

    Layout.fillHeight: true
    Layout.fillWidth: true
    color: mouseArea.containsMouse ? "purple" : "transparent"

    MouseArea {
        id: mouseArea
        hoverEnabled: true
        anchors.fill: parent
        onClicked: proc.running = true
        onEntered: scaleUpAnimation.start()
        onExited: scaleDownAnimation.start()
    }

    Image {
        anchors.centerIn: parent
        width: parent.width * 0.2
        height: width
        source: root.icon
    }

    transform: Scale {
        id: scaleTransform
        property real scale: 1
        origin.x: parent.width / 4.0
        origin.y: parent.height / 4.0
        xScale: scale
        yScale: scale
    }

    PropertyAnimation {
        id: scaleUpAnimation
        target: scaleTransform
        properties: "scale"
        to: 1.1
        duration: 300
    }

    PropertyAnimation {
        id: scaleDownAnimation
        target: scaleTransform
        properties: "scale"
        to: 1.0
        duration: 300
    }

    Text {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 20
        text: root.text
        font.pixelSize: 20
        color: "white"
    }

    Process {
        id: proc
        running: false
        command: ["sh", "-c", root.command]
    }
}