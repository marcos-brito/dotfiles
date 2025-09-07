import QtQuick
import QtQuick.Layouts
import qs.config
import qs.components
import qs.services

RowLayout {
    spacing: 8
    anchors.centerIn: parent

    IconifyIcon {
        set: "lucide"
        icon: Icons.window
        color: Theme.base0C
        implicitSize: 18
    }

    Text {
        text: `${Niri.windowName(Niri.focusedWindow)}`
        color: Theme.base0C
        elide: Text.ElideRight
    }
}
