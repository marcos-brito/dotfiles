import QtQuick.Layouts
import qs.config
import qs.components

BaseItem {
    id: root
    required property var value

    RowLayout {
        spacing: 16
        IconifyIcon {
            set: Icons.set
            icon: root.value.icon
            color: Theme.base05
            implicitSize: 24
        }

        ColumnLayout {
            BaseText {
                text: root.value.name
                color: Theme.base05
                font.pixelSize: 14
            }

            BaseText {
                text: root.value.desc
                color: Theme.base07
                opacity: 0.7
            }
        }
    }
}
