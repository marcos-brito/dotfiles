import QtQuick
import QtQuick.Controls
import qs.config
import qs.components

TextField {
    id: root
    color: Theme.base05
    implicitHeight: 50
    background: Rectangle {
        anchors.fill: root
        color: Theme.base01
        radius: 16
    }
}
