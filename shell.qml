//@ pragma UseQApplication
import Quickshell
import "components"

import QtQuick
import Quickshell.Services.Pam

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
