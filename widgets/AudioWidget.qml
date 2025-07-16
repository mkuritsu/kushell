import QtQuick
import "root:/config"
import "root:/services"

Row {
  spacing: 5

  Text {
    color: ShellConfig.accentColor
    text: `${AudioService.defaultSink == null ? 0 : Math.round(AudioService.defaultSink.audio.volume * 100)}% `
    font.pixelSize: ShellConfig.fontSize
    font.family: ShellConfig.fontFamily
  }
    
  Text {
    color: ShellConfig.accentColor
    text: `${AudioService.defaultSource == null ? 0 : Math.round(AudioService.defaultSource.audio.volume * 100)}% `
    font.pixelSize: ShellConfig.fontSize
    font.family: ShellConfig.fontFamily
  }
}
