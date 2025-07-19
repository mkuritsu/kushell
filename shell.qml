import Quickshell
import qs.modules
import qs.config

ShellRoot {
  LazyLoader {
    active: Settings.activeModules.includes("applauncher")
    
    AppLauncher { }
  }

  LazyLoader {
    active: Settings.activeModules.includes("screenshot")

    Screenshot { }
  }

  LazyLoader {
    active: Settings.isModuleEnabled("lockscreen")

    Lockscreen { }
  }
  
  Variants {
    model: Quickshell.screens

    Scope {
      required property ShellScreen modelData

      LazyLoader {
        active: Settings.activeModules.includes("background")

        Background {
          screen: modelData
        }
      }

      LazyLoader {
        active: Settings.activeModules.includes("bar")

        Bar {
          screen: modelData
        }
      }
    }
  }
}
