pragma Singleton

import Quickshell
import Quickshell.Io

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

    FileView {
        path: "config.json"
        watchChanges: true
        onFileChanged: reload()
        onAdapterUpdated: writeAdapter()

        JsonAdapter {
            id: json

            property string fontFamily: "JetBrains Mono NL Nerd Font"
            property real fontSize: 14
            property real titleFontSize: 20
            property string textColor: "#ebedf3"
            property string textAccentColor: "#f5c2e7"
            property string accentColor: "#CBA6F7"
            property string highlightColor: "#45475a"
            property string backgroundColor: "#181825"
            property string backgroundAccentColor: "#151520"
            property string overlayShadowColor: "#c2000000"
        }
    }
}