import QtQuick
import "root:/services" as Services
import "root:/config"

Text {
  visible: Services.Power.isLaptop
  text: `${Services.Power.percentage}% `
  color: ShellConfig.accentColor
  font.pixelSize: ShellConfig.fontSize
  font.family: ShellConfig.fontFamily
  font.bold: true
}
