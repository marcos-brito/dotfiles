import QtQuick.Layouts
import qs.components
import qs.config

ColumnLayout {
    anchors.fill: parent
    spacing: 32

    Time {
        font.pixelSize: 78
        font.bold: true
        color: Theme.base0E
        Layout.alignment: Qt.AlignHCenter
    }

    ColumnLayout {
        spacing: 16

        BaseText {
            text: "quinta"
            Layout.alignment: Qt.AlignHCenter
        }

        BaseText {
            text: "24/09"
            Layout.alignment: Qt.AlignHCenter
        }
    }
}
