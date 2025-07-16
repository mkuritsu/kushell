pragma Singleton

import Quickshell
import Quickshell.Wayland

Singleton {
  readonly property Toplevel activeWindow: ToplevelManager.activeToplevel?.activated ? ToplevelManager.activeToplevel : null
}
