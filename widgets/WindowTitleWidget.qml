import QtQuick
import Quickshell
import "root:/services"
import "root:/config"

Text {
    color: ShellConfig.textAccentColor
    font.pixelSize: ShellConfig.fontSize
    font.family: ShellConfig.fontFamily
    text: `${ActiveWindow.title}`
}
