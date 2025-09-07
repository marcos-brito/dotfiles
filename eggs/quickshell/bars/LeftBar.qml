import Quickshell
import QtQuick.Layouts
import qs.config
import qs.bars.widgets
import qs.bars.widgets.systray

PanelWindow {
    width: Props.leftBarWidth
    color: Theme.base00

    anchors {
        left: true
        top: true
        bottom: true
    }

    margins {
        top: 18
        bottom: 132
    }

    ColumnLayout {
        height: parent.height
        anchors.horizontalCenter: parent.horizontalCenter

        ColumnLayout {
            Layout.alignment: Qt.AlignTop
            anchors.topMargin: 40
            spacing: Props.widgetSpacing

            DatePanel {}
            SoundPanel {}
            SystemPanel {}
            Notifications {}
        }

        Systray {
            Layout.alignment: Qt.AlignBottom
        }
    }
}
