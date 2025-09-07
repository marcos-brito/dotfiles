import qs.config
import QtQuick
import QtQuick.Effects
import Quickshell.Widgets

Rectangle {
    id: root
    required property int edge

    enum Edge {
        LEFT,
        RIGTH,
        TOP,
        BOTTOM
    }

    width: 40
    height: 40
    color: Theme.base00

    layer.enabled: true
    layer.effect: MultiEffect {
        maskSource: mask
        maskEnabled: false
        maskInverted: true
        maskThresholdMin: 0.5
        maskSpreadAtMin: 1
    }

    Item {
        id: mask
        anchors.fill: parent
        layer.enabled: true
        visible: false

        ClippingRectangle {
            id: maskInner
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.bottomMargin: 0
            topLeftRadius: (root.edge === Connector.Edge.BOTTOM) || (root.edge === Connector.Edge.RIGHT) ? root.size : 0
            topRightRadius: (root.edge === Connector.Edge.TOP) || (root.edge === Connector.Edge.LEFT) ? root.size : 0
            bottomLeftRadius: 0
            bottomRightRadius: 0

            anchors.fill: parent
            anchors.margins: 8
            radius: 50
        }
    }
}
