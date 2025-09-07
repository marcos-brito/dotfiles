import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import Quickshell
import qs.config
import qs.components

BaseItem {
    id: root
    required property DesktopEntry value

    RowLayout {
        spacing: 16

        IconImage {
            IconifyIcon {
                id: fallback
                visible: false
                set: Icons.set
                icon: Icons.noIconApp
                color: Theme.base16
                implicitSize: 24
            }

            source: Quickshell.iconPath(root.value.icon, true) || fallback.source
            implicitSize: 24
        }

        ColumnLayout {
            BaseText {
                text: root.value.name
                color: Theme.base05
                font.pixelSize: 14
            }

            BaseText {
                text: root.value.comment
                color: Theme.base07
                opacity: 0.7
            }
        }
    }
}
