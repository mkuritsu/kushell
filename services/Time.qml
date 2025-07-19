pragma Singleton

import Quickshell

Singleton {
  property alias date: clock.date

  SystemClock {
    id: clock
    precision: SystemClock.Seconds
  }
}
