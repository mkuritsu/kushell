import QtQuick
import QtQuick.Layouts
import qs.services as Services
import qs.config

RowLayout {
  spacing: 10

  Row {
    Layout.fillHeight: true
    spacing: 5

    Text {
      anchors.verticalCenter: parent.verticalCenter
      color: Settings.accentColor
      text: `${Services.Audio.defaultSink == null ? 0 : Math.round(Services.Audio.defaultSink.audio.volume * 100)}%`
      font.pixelSize: Settings.fontSize
      font.family: Settings.fontFamily
    }

    Text {
      anchors.verticalCenter: parent.verticalCenter
      color: Settings.accentColor
      text: ``
      font.pixelSize: Settings.fontSize * Settings.iconSizeMultiplier
      font.family: Settings.fontFamily
    }
  }
    
  Row {
    Layout.fillHeight: true
    spacing: 5

    Text {
      anchors.verticalCenter: parent.verticalCenter
      color: Settings.accentColor
      text: `${Services.Audio.defaultSource == null ? 0 : Math.round(Services.Audio.defaultSource.audio.volume * 100)}%`
      font.pixelSize: Settings.fontSize
      font.family: Settings.fontFamily
    }

    Text {
      anchors.verticalCenter: parent.verticalCenter
      color: Settings.accentColor
      text: ``
      font.pixelSize: Settings.fontSize * Settings.iconSizeMultiplier
      font.family: Settings.fontFamily
    }
  }
}
