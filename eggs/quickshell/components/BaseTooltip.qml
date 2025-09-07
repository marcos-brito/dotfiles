import QtQuick
import QtQuick.Controls.Basic
import qs.config

ToolTip {
    id: control

    delay: 400

    contentItem: BaseText {
        text: control.text
        font: control.font
    }

    background: Rectangle {
        color: Theme.base02
    }
}
