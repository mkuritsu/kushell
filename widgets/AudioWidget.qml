import QtQuick
import "root:/services" as Services
import "root:/config"

Row {
  spacing: 5

  Text {
    color: ShellConfig.accentColor
    text: `${Services.Audio.defaultSink == null ? 0 : Math.round(Services.Audio.defaultSink.audio.volume * 100)}% `
    font.pixelSize: ShellConfig.fontSize
    font.family: ShellConfig.fontFamily
  }
    
  Text {
    color: ShellConfig.accentColor
    text: `${Services.Audio.defaultSource == null ? 0 : Math.round(Services.Audio.defaultSource.audio.volume * 100)}% `
    font.pixelSize: ShellConfig.fontSize
    font.family: ShellConfig.fontFamily
  }
}
