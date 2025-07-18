import Quickshell
import "modules"
import "config"

ShellRoot {
  LazyLoader {
    active: ShellConfig.activeModules.includes("applauncher")
    AppLauncher { }
  }
  
  Variants {
    model: Quickshell.screens

    Scope {
      required property ShellScreen modelData

      LazyLoader {
        active: ShellConfig.activeModules.includes("background")
        Background {
          screen: modelData
        }
      }

      LazyLoader {
        active: ShellConfig.activeModules.includes("bar")
        Bar {
          screen: modelData
        }
      }
    }
  }
}
