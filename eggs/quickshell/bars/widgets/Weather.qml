import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import "../config/"
import "../components/"
import "../player/"

BaseButton {
    implicitWidth: 70
    implicitHeight: 40
    color: Theme.base00

    RowLayout {
        anchors.fill: parent

        IconifyIcon {
            set: "lucide"
            icon: Icons.audio
            color: Theme.base0B
            implicitSize: 18
        }

        Text {
            text: "55"
            font.pixelSize: 12
            color: Theme.base0B
        }
    }
}
