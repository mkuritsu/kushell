import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import Quickshell.Services.Pam
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Effects
import qs.widgets as Widgets
import qs.config

Scope {
  GlobalShortcut {
    appid: "kushell"
    name: "lock"
    onPressed: {
      lock.locked = true
    }
  }

  PamContext {
    id: pam

    onCompleted: result => {
      if (result == PamResult.Success) {
        lock.locked = false
      } else {
        pam.start()
      }
    }
  }

  WlSessionLock {
    id: lock
    locked: false

    WlSessionLockSurface {

      Component.onCompleted: {
        pam.start()
      }

      Rectangle {
        anchors.fill: parent
        color: "red"

        Image {
          id: background
          anchors.fill: parent
          source: Settings.wallpaperPath
        }

        MultiEffect {
          source: background
          anchors.fill: background
          blurEnabled: true
          blurMax: 64
          blur: 1.0
        }

        Widgets.BigClock {
          anchors.horizontalCenter: parent.horizontalCenter
        }

        TextInput {
          property bool textIncreased: false
          property bool textDecreased: false
          property int lastLength: 0

          id: textInput
          Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
          text: ""
          focus: true
          visible: false
          echoMode: TextInput.Password
          onTextChanged: {
            textIncreased = false
            textDecreased = false
            textIncreased = text.length > lastLength
            textDecreased = text.length < lastLength
            lastLength = text.length
          }

          Keys.onPressed: event => {
            if (event.key == Qt.Key_Enter - 1) {
              pam.respond(textInput.text)
            }
          }
        }

        Rectangle {
          anchors.centerIn: parent
          width: parent.width
          height: 100
          color: "transparent"

          RowLayout {
            spacing: 10
            anchors.centerIn: parent

            Repeater {
              model: textInput.length

              Widgets.PassCircle {
                required property int index

                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                shouldAnimate: textInput.textIncreased && index == textInput.length - 1
              }
            }

            Widgets.PassCircle {
              Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
              visible: shouldAnimate && this.opacity > 0
              shouldAnimate: textInput.textDecreased
              reverseAnimation: true
            }
          }
        }
      }
    }
  }
}
