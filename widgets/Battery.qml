import QtQuick
import qs.services as Services
import qs.config

Text {
  visible: Services.Power.isLaptop
  text: `${Services.Power.percentage}% `
  color: Settings.accentColor
  font.pixelSize: Settings.fontSize
  font.family: Settings.fontFamily
  font.bold: true
}
