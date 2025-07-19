import QtQuick
import qs.services as Services
import qs.config

Text {
  id: text
  text: Qt.formatDateTime(Services.Time.date, "HH:mm:ss")
  color: Settings.accentColor
  font.pixelSize: 128
  font.family: Settings.fontFamily
  font.bold: true
}
