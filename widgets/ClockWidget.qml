import QtQuick
import "root:/services" as Services
import "root:/config"

Rectangle {
  id: root
  color: "transparent"
  height: parent.height
  width: text.width + 20
  radius: 10

  Text {
    id: text
    anchors.centerIn: parent
    text: Services.Time.time
    color: ShellConfig.accentColor
    font.pixelSize: ShellConfig.fontSize
    font.family: ShellConfig.fontFamily
    font.bold: true
  }
}
