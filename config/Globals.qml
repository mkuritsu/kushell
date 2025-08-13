pragma Singleton

import Quickshell
import Qt.labs.platform

Singleton {
  readonly property string wallpaperPath: `${StandardPaths.standardLocations(StandardPaths.ConfigLocation)[0]}/kushell/background`
}
