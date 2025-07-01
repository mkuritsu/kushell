import QtQuick
import "root:/services"
import "root:/config"

Text {
    text: Time.time
    color: "#f9e2af"
    font.pixelSize: ShellConfig.fontSize
    font.family: ShellConfig.fontFamily
    font.bold: true
}