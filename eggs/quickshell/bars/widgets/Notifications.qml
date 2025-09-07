import QtQuick
import Quickshell.Widgets
import qs.components
import qs.services
import qs.config

WrapperMouseArea {
    onClicked: Panels.open("notification-dashboard")

    IconifyIcon {
        set: Icons.set
        icon: Icons.notifications
        color: Theme.base0A
        implicitSize: 18

        Rectangle {
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.topMargin: -5
            anchors.rightMargin: -3
            width: 8
            height: 8
            radius: 50
            color: Theme.base0A

            BaseText {
                visible: false
                anchors.centerIn: parent
                text: "+9"
                font.pixelSize: 7
                color: Theme.base00
            }
        }
    }
}
