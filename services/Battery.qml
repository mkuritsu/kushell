pragma Singleton

import Quickshell
import Quickshell.Services.UPower

Singleton {
  readonly property ScriptModel laptopBatteries: ScriptModel {
    values: UPower.devices.values.filter(d => d.isLaptopBattery)
  }

  readonly property real percentage: Math.round(laptopBatteries.values[0]?.percentage * 100)
}
