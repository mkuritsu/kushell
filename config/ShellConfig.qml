pragma Singleton

import Quickshell
import Quickshell.Io
import Qt.labs.platform

Singleton {
  property alias titleFontSize: json.titleFontSize
  property alias fontSize: json.fontSize
  property alias fontFamily: json.fontFamily
  property alias accentColor: json.accentColor
  property alias highlightColor: json.highlightColor
  property alias backgroundColor: json.backgroundColor
  property alias backgroundAccentColor: json.backgroundAccentColor
  property alias overlayShadowColor: json.overlayShadowColor
  property alias textColor: json.textColor
  property alias textAccentColor: json.textAccentColor
  property alias wallpaperPath: json.wallpaperPath

  FileView {
    path: `${StandardPaths.writableLocation(StandardPaths.HomeLocation)}/.config/kushell/config.json`
    watchChanges: true
    onFileChanged: reload()
    onAdapterUpdated: writeAdapter()

    JsonAdapter {
      id: json
      
      property string fontFamily: "JetBrains Mono NL Nerd Font"
      property real fontSize: 14
      property real titleFontSize: 20
      property string textColor: "white"
      property string textAccentColor: "#D699B6"
      property string accentColor: "#DBBC7F"
      property string highlightColor: "#45475a"
      property string backgroundColor: "#2B3339"
      property string backgroundAccentColor: "#232A2E"
      property string overlayShadowColor: "#c2000000"
      property string wallpaperPath: `${StandardPaths.writableLocation(StandardPaths.HomeLocation)}/.config/background`
    }
  }
}
