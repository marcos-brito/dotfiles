import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Controls
import qs.config
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Controls
import qs.config

Slider {
    id: control
    property string color: Theme.base05
    property bool flip: false   // <--- NEW

    // flip-aware value handling
    property real effectiveValue: flip ? (to - value + from) : value
    onEffectiveValueChanged: if (!flip) value = effectiveValue

    background: Rectangle {
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.topMargin: control.implicitHeight / 3
        anchors.bottomMargin: control.implicitHeight / 3
        x: control.leftPadding
        y: control.topPadding + control.availableHeight / 2 - height / 2
        width: control.width
        height: control.height
        radius: 8
        color: Theme.base01

        Rectangle {
            width: control.orientation === Qt.Horizontal
                   ? control.visualPosition * parent.width
                   : parent.width

            height: control.orientation === Qt.Vertical
                    ? (control.flip
                        ? (1 - control.visualPosition) * parent.height
                        : control.visualPosition * parent.height)
                    : parent.height

            anchors.bottom: control.orientation === Qt.Vertical && control.flip ? parent.bottom : undefined
            color: control.color
            radius: 8
        }

        MouseArea {
            anchors.fill: parent
            onWheel: {
                if (wheel.angleDelta.y > 0 || wheel.angleDelta.x > 0) {
                    control.value += control.stepSize;
                    return;
                }
                control.value -= control.stepSize;
            }
        }
    }

    handle: Rectangle {}
}
