import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import "root:/config"
import "root:/utils"

Scope {
  GlobalShortcut {
    appid: "kushell"
    name: "applauncher"
    onPressed: {
      appLauncher.active = true
    }
  }
  
  LazyLoader {
    id: appLauncher
    active: false

    PanelWindow {
      id: launcherWindow
      WlrLayershell.layer: WlrLayer.Overlay
      WlrLayershell.keyboardFocus: WlrKeyboardFocus.Exclusive
      color: "transparent"
      anchors {
        top: true
        right: true
        left: true
        bottom: true
      }

      HyprlandFocusGrab {
        active: appLauncher.active
        windows: [ launcherWindow ]
      }

      MouseArea {
        anchors.fill: parent
        onPressed: appLauncher.active = false
      }

      Rectangle {
        anchors.fill: parent
        color: ShellConfig.backgroundColor
        opacity: 0.5
      }

      Rectangle {
        anchors.centerIn: parent
        implicitWidth: 500
        implicitHeight: 300
        radius: 10
        color: ShellConfig.backgroundColor
        border.color: ShellConfig.accentColor
        border.width: 2

        ColumnLayout {
          anchors.centerIn: parent
          width: parent.width * 0.95
          height: parent.height * 0.95
          spacing: 10

          TextInput {
            id: searchBox
            selectionColor: ShellConfig.highlightColor
            Layout.fillWidth: true
            height: 30
            color: ShellConfig.textColor
            font.pixelSize: ShellConfig.fontSize
            font.family: ShellConfig.fontFamily
            focus: true

            Keys.onPressed: event => {
              if (event.key == Qt.Key_Escape) {
                appLauncher.active = false
              } else if (event.key == Qt.Key_Enter - 1) {
                appLauncher.active = false
                const app = appList.model.values[appList.currentIndex]
                Utils.launchApplication(app)
              } else if (event.key == Qt.Key_Up) {
                appList.currentIndex = Math.max(0, appList.currentIndex - 1)
              } else if (event.key == Qt.Key_Down) {
                appList.currentIndex = Math.min(appList.model.values.length - 1, appList.currentIndex + 1)
              }
            }
          }

          ScrollView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true

            ListView {
              id: appList
              anchors.fill: parent
              currentIndex: 0
              model: ScriptModel {
                values: DesktopEntries.applications.values.filter(a => a.name.toLowerCase().includes(searchBox.text.toLowerCase())).sort((a, b) => a.name.localeCompare(b.name))
              }

              delegate: Rectangle {
                required property int index
                required property DesktopEntry modelData

                implicitWidth: appList.width
                implicitHeight: 30
                color: (appList.currentIndex == index || appMouse.containsMouse) ? ShellConfig.highlightColor : "transparent"

                MouseArea {
                  id: appMouse
                  hoverEnabled: true
                  anchors.fill: parent
                  onPressed: {
                    appLauncher.active = false
                    Utils.launchApplication(modelData)
                  }
                }

                Row {
                  anchors.fill: parent
                  spacing: 10

                  IconImage {
                    asynchronous: true
                    source: Quickshell.iconPath(modelData?.icon)
                    height: parent.height * 0.95
                    width: height
                  }

                  Text {
                    anchors.verticalCenter: parent.verticalCenter
                    text: modelData.name
                    color: ShellConfig.textColor
                    font.pixelSize: ShellConfig.fontSize
                    font.family: ShellConfig.fontFamily
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}
