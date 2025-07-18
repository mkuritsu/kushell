import QtQuick
import "root:/services"
import "root:/config"

Rectangle {
  signal clicked()

  id: root
  color: mouseArea.containsMouse ? ShellConfig.highlightColor : "transparent"
  height: parent.height
  width: text.width + 20
  radius: 10

  MouseArea {
    id: mouseArea
    anchors.fill: parent
    hoverEnabled: true
    cursorShape: Qt.PointingHandCursor
    onClicked: {
      root.clicked()
    }
  }

  Text {
    id: text
    anchors.centerIn: parent
    text: Time.time
    color: ShellConfig.accentColor
    font.pixelSize: ShellConfig.fontSize
    font.family: ShellConfig.fontFamily
    font.bold: true
  }
}
