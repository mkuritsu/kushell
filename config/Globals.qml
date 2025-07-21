pragma Singleton

import Quickshell

Singleton {
  readonly property string wallpaperPath: `${Quickshell.env("HOME")}/.config/kushell/background`
}

