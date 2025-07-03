import QtQuick
import "root:/services"
import "root:/config"

Text {
    visible: Battery.laptopBatteries.values.length > 0
    text: `${Battery.percentage}% `
    color: "#DBBC7F"
    font.pixelSize: ShellConfig.fontSize
    font.family: ShellConfig.fontFamily
    font.bold: true
}