pragma Singleton

import Quickshell
import Quickshell.Services.UPower

Singleton {
  readonly property bool isLaptop: laptopBatteries.values.length > 0

  readonly property ScriptModel laptopBatteries: ScriptModel {
    values: UPower.devices.values.filter(d => d.isLaptopBattery)
  }

  readonly property real batteryPercentage: Math.round(laptopBatteries.values[0]?.percentage * 100)
}
