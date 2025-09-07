import Quickshell.Widgets
import QtQuick.Layouts
import qs.config
import qs.components
import qs.services

WrapperMouseArea {
    hoverEnabled: true
    onClicked: Panels.open("date")

    RowLayout {
        spacing: 8
        anchors.fill: parent

        IconifyIcon {
            set: "lucide"
            icon: Icons.clock
            color: Theme.base16
            implicitSize: 18
        }

        Time {
            format: "hh:mm"
            color: Theme.base16
        }
    }
}
