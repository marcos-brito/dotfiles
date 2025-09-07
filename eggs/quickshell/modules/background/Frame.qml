import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Effects
import qs.config
import qs.components

BasePanel {
    aboveWindows: false
    exclusionMode: ExclusionMode.Ignore
    visible: true
    name: "frame"
    WlrLayershell.layer: WlrLayer.Background

    anchors {
        top: true
        bottom: true
        left: true
        right: true
    }

    Rectangle {
        anchors.fill: parent
        color: Theme.base00

        layer.enabled: true
        layer.effect: MultiEffect {
            maskSource: mask
            maskEnabled: true
            maskInverted: true
            maskThresholdMin: 0.5
            maskSpreadAtMin: 1
        }

        Item {
            id: mask

            anchors.fill: parent
            layer.enabled: true
            visible: false

            Rectangle {
                id: maskInner

                anchors.leftMargin: Props.leftBarWidth
                anchors.topMargin: Props.topBarHeight
                anchors.bottomMargin: 5
                anchors.rightMargin: 5
                anchors.fill: parent
                anchors.margins: 8
                radius: 8
            }
        }
    }
}
