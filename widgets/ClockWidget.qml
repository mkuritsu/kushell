import QtQuick
import qs.services as Services
import qs.config

Rectangle {
  id: root
  color: "transparent"
  height: parent.height
  width: text.width + 20
  radius: 10

  Text {
    id: text
    anchors.centerIn: parent
    text: Qt.formatDateTime(Services.Time.date, "HH:mm:ss")
    color: Settings.accentColor
    font.pixelSize: Settings.fontSize
    font.family: Settings.fontFamily
    font.bold: true
  }
}
