import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Fusion
import qs.config

Rectangle {
    id: root
    required property LockContext context

    color: Theme.base00

    Button {
        text: "Its not working, let me out"
        onClicked: root.context.unlocked()
    }

    ColumnLayout {
        anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter
        }

        Date {}

        Fields {
            context: root.context
        }

    }
}
