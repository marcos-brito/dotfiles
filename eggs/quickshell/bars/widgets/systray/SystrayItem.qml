import QtQuick
import Quickshell.Widgets
import Quickshell.Services.SystemTray
import qs.components
import qs.config

IconImage {
    id: root
    required property SystemTrayItem item

    anchors.fill: parent
    source: item.icon || fallback.source
    implicitSize: 18

    BaseTooltip {
        text: root.item.tooltipTitle
        visible: mouseArea.containsMouse
    }

    IconifyIcon {
        id: fallback
        visible: false
        set: Icons.set
        icon: Icons.systrayFallback
        color: Theme.base05
        implicitSize: 18
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        acceptedButtons: Qt.AllButtons
        hoverEnabled: true

        onWheel: wheel => {}

        onClicked: mouse => {
            if (mouse.button === Qt.LeftButton)
                root.item.activate();

            if (mouse.button === Qt.MiddleButton)
                root.item.secondaryActivate();

            if (mouse.button === Qt.RightButton)
                root.item.display();
        }
    }
}
