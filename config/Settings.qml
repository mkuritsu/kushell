pragma Singleton

import Quickshell
import Quickshell.Io

Singleton {
  property alias fontFamily: json.fontFamily
  property alias fontSize: json.fontSize
  property alias textColor: json.textColor
  property alias accentColor: json.accentColor
  property alias highlightColor: json.highlightColor
  property alias backgroundColor: json.backgroundColor
  property alias activeModules: json.activeModules

  function isModuleEnabled(module) {
    return this.activeModules.includes(module)
  }

  FileView {
    path: `${Quickshell.env("XDG_CONFIG_HOME")}/kushell/config.json`
    watchChanges: true
    onFileChanged: reload()
    onAdapterUpdated: writeAdapter()

    JsonAdapter {
      id: json
      
      property string fontFamily: "CaskaydiaMono Nerd Font Mono"
      property real fontSize: 14
      property string textColor: "#C0CAF5"
      property string accentColor: "#7AA2F7"
      property string highlightColor: "#45475a"
      property string backgroundColor: "#1A1B26"
      property list<string> activeModules: ["applauncher", "background", "bar", "screenshot", "lockscreen"]
    }
  }
}
