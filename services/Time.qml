pragma Singleton

import Quickshell

Singleton {
  readonly property string time: {
    Qt.formatDateTime(clock.date, "HH:mm dd/MM/yyyy")
  }

  SystemClock {
    id: clock
    precision: SystemClock.Minutes
  }
}
