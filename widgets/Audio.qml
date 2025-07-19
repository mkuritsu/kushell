import QtQuick
import qs.services as Services
import qs.config

Row {
  spacing: 5

  Text {
    color: Settings.accentColor
    text: `${Services.Audio.defaultSink == null ? 0 : Math.round(Services.Audio.defaultSink.audio.volume * 100)}% `
    font.pixelSize: Settings.fontSize
    font.family: Settings.fontFamily
  }
    
  Text {
    color: Settings.accentColor
    text: `${Services.Audio.defaultSource == null ? 0 : Math.round(Services.Audio.defaultSource.audio.volume * 100)}% `
    font.pixelSize: Settings.fontSize
    font.family: Settings.fontFamily
  }
}
