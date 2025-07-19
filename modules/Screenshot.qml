import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick

Scope {
  GlobalShortcut {
    appid: "kushell"
    name: "screenshot"
    onPressed: {
      screenshot.active = true
    }
  }

  Process {
    id: screenshotProc
  }

  LazyLoader {
    id: screenshot
    active: false

    Variants {
      model: Quickshell.screens

      PanelWindow {
        required property ShellScreen modelData

        id: window
        WlrLayershell.layer: WlrLayer.Overlay
        WlrLayershell.exclusionMode: ExclusionMode.Ignore
        WlrLayershell.keyboardFocus: WlrKeyboardFocus.Exclusive
        color: "transparent"
        screen: modelData
        anchors {
          top: true
          left: true
          right: true
          bottom: true
        }

        ScreencopyView {
          anchors.fill: parent
          captureSource: window.modelData

          Rectangle {
            id: selectionRect
            color: "transparent"
            visible: false
            border.width: 5
            border.color: "red"
          }

          MouseArea {
            property real startX: 0
            property real startY: 0

            anchors.fill: parent
            onPressed: event => {
              selectionRect.visible = true
              selectionRect.width = 0
              selectionRect.height = 0
              selectionRect.x = event.x
              selectionRect.y = event.y
              startX = event.x
              startY = event.y
            }
            onPositionChanged: event => {
              if (selectionRect.visible) {
                const minX = Math.min(event.x, startX)
                const minY = Math.min(event.y, startY)
                const maxX = Math.max(event.x, startX)
                const maxY = Math.max(event.y, startY)
                selectionRect.x = minX
                selectionRect.y = minY
                selectionRect.width = Math.abs(startX - event.x)
                selectionRect.height = Math.abs(startY - event.y)
              }
            }
            onReleased: {
              selectionRect.visible = false
              const x = window.screen.x + selectionRect.x
              const y = window.screen.y + selectionRect.y
              const geometry = `${x},${y} ${selectionRect.width}x${selectionRect.height}`
              screenshotProc.command = ["slurp", "-o"]
              screenshotProc.running = true
              screenshot.active = false
            }
          }
        }


        Rectangle {
          anchors.centerIn: parent
          implicitHeight: 100
          implicitWidth: 100

          MouseArea {
            anchors.fill: parent
            onClicked: {
              screenshot.active = false
            }
          }
        }
      }
    }
  }
}
