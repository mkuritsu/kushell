import QtQuick

Rectangle {
  required property bool shouldAnimate
  property bool reverseAnimation: false

  id: root
  radius: 50
  color: "white"
  width: 50
  height: width
  transform: Translate {
    id: translation
  }

  PropertyAnimation {
    id: translateAnimation
    target: translation
    properties: "y"
    from: root.reverseAnimation ? 0 : 100
    to: root.reverseAnimation ? 100 : 0
    duration: 150
    easing.type: Easing.InOutQuad
    running: root.shouldAnimate
  }

  PropertyAnimation {
    target: root
    property: "opacity"
    from: 1.0
    to: 0
    duration: 300
    easing.type: Easing.InOutQuad
    running: root.shouldAnimate && root.reverseAnimation
  }
}
