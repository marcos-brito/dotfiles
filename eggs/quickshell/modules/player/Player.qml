import QtQuick.Layouts
import qs.services
import qs.components
import qs.services
import qs.config

ColumnLayout {
    spacing: Props.widgetSpacing

    BaseSelect {
        model: Media.identities()
        onAccepted: Media.setActive(currentText)
    }

    RowLayout {
        spacing: Props.widgetSpacing * 2
        Thumb {}
        ColumnLayout {

            Title {
                Layout.alignment: Qt.AlignTop
            }
            Controls {
                Layout.alignment: Qt.AlignBottom
            }
        }
    }

    Progress {}
}
