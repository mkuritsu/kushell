import QtQuick
import qs.services as Services
import qs.config

Text {
  id: text
  anchors.centerIn: parent
  text: Qt.formatDateTime(Services.Time.date, "HH:mm:ss")
  color: Settings.accentColor
  font.pixelSize: Settings.fontSize
  font.family: Settings.fontFamily
  font.bold: true
}

