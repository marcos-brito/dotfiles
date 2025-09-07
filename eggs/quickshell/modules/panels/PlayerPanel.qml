import Quickshell.Widgets
import QtQuick
import qs.config
import qs.components
import qs.modules.player

BasePanel {
    name: "player"
    width: screen.width * 0.35
    height: screen.height * 0.3
    visible: true

    anchors {
        top: true
        left: true
    }

    margins {
        top: Props.topBarHeight
        left: Props.leftBarWidth + 80
    }

    ClippingWrapperRectangle {
        anchors.fill: parent
        margin: 16
        color: Theme.base00
        bottomLeftRadius: 8
        bottomRightRadius: 8

        Player {}
    }
}
