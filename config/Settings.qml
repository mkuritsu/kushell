pragma Singleton

import Quickshell
import Quickshell.Io
import Qt.labs.platform

Singleton {
  property alias fontFamily: json.fontFamily
  property alias fontSize: json.fontSize
  property alias barHeight: json.barHeight
  property alias textColor: json.textColor
  property alias accentColor: json.accentColor
  property alias highlightColor: json.highlightColor
  property alias backgroundColor: json.backgroundColor
  property alias activeModules: json.activeModules
  property alias launchPrefix: json.launchPrefix

  function isModuleEnabled(module) {
    return this.activeModules.includes(module);
  }

  FileView {
    path: `${StandardPaths.standardLocations(StandardPaths.ConfigLocation)[0]}/kushell/config.json`
    watchChanges: true
    onFileChanged: reload()
    onAdapterUpdated: writeAdapter()

    JsonAdapter {
      id: json

      property string fontFamily: "CaskaydiaMono Nerd Font"
      property real fontSize: 14
      property real barHeight: 30
      property string textColor: "#C0CAF5"
      property string accentColor: "#7AA2F7"
      property string highlightColor: "#45475a"
      property string backgroundColor: "#1A1B26"
      property list<string> activeModules: ["applauncher", "background", "bar", "screenshot", "lockscreen"]
      property string launchPrefix: "uwsm app --"
    }
  }
}
