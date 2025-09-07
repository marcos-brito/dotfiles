import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import qs.config
import qs.components
import qs.services

WrapperMouseArea {
    id: root
    onPressed: Panels.open("player")
    hoverEnabled: true

    RowLayout {
        spacing: 8

        IconifyIcon {
            set: "lucide"
            icon: Icons.music
            color: Theme.base09
            implicitSize: 18
        }

        Text {
            text: `${Media.active.trackTitle} - ${Media.active.trackArtist}`
            color: Theme.base09
            elide: Text.ElideRight
        }
    }
}
