import Quickshell
import QtQuick.Layouts
import qs.config
import qs.bars.widgets
import qs.bars.widgets.workspaces
import qs.config

PanelWindow {
    id: root
    height: Props.topBarHeight
    color: Theme.base00

    anchors {
        top: true
        left: true
        right: true
    }

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: Props.barMargin
        anchors.rightMargin: Props.barMargin

        RowLayout {
            spacing: Props.widgetSpacing
            Layout.alignment: Qt.AlignLeft

            Workspaces {}
            Song {}
        }

        FocusedWindow {
            Layout.alignment: Qt.AlignRight
        }

        RowLayout {
            spacing: Props.widgetSpacing
            Layout.alignment: Qt.AlignRight

            Clock {}
            Sound {}
        }
    }
}
