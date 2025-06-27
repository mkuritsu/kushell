pragma Singleton

import Quickshell
import Quickshell.Services.UPower
import QtQuick

Singleton {
    property var laptopBatteries: ScriptModel {
        values: UPower.devices.values.filter(d => d.isLaptopBattery)
    }

    property real percentage: Math.round(laptopBatteries.values[0].percentage * 100)
}