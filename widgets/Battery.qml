import QtQuick
import qs.services as Services
import qs.config

Row {
  visible: Services.Power.isLaptop
  spacing: 5

  Text {
    anchors.verticalCenter: parent.verticalCenter
    text: `${Services.Power.batteryPercentage ?? 0}%`
    color: Settings.accentColor
    font.pixelSize: Settings.fontSize
    font.family: Settings.fontFamily
  }

  Text {
    anchors.verticalCenter: parent.verticalCenter
    text: ``
    color: Settings.accentColor
    font.pixelSize: Settings.fontSize
    font.family: Settings.fontFamily
  }
}
