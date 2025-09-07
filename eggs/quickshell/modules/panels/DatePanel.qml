import Quickshell.Widgets
import QtQuick.Layouts
import qs.config
import qs.components
import qs.modules.calendar

TestPanel {
    name: "date"
    width: screen.width * 0.30
    height: screen.height * 0.50
    panelColor: Theme.base00
    origin: TestPanel.Origin.TopRight

    anchors {
        top: true
        right: true
    }

    margins {
        top: Props.topBarHeight
    }

    ColumnLayout {
        anchors.margins: 16
        anchors.fill: parent
        spacing: 16

        Time {
            format: "hh:mm:ss"
            color: Theme.base16
            font.pixelSize: 28
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignCenter
        }

        Calendar {}
    }
}
