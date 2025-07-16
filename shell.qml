//@ pragma UseQApplication
import Quickshell
import "components"

ShellRoot {
  Variants {
    model: Quickshell.screens

    Scope {
      required property ShellScreen modelData

      Background {
        screen: modelData
      }

      Bar {
        screen: modelData
      }
    }
  }
}
