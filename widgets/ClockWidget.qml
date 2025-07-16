import QtQuick
import "root:/services"
import "root:/config"

Text {
  text: Time.time
  color: ShellConfig.accentColor
  font.pixelSize: ShellConfig.fontSize
  font.family: ShellConfig.fontFamily
  font.bold: true
}
