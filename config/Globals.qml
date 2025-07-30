pragma Singleton

import Quickshell

Singleton {
  readonly property string wallpaperPath: `${Quickshell.env("XDG_CONFIG_HOME")}/kushell/background`
}

