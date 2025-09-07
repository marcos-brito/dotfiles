import QtQuick
import QtQuick.Controls
import "../config/"

Button {
    property int radius: 8
    property string color: Theme.base00
    property string hoverColor: Theme.base01


    background: Rectangle {
        anchors.fill: parent
        width: parent.width
        height: parent.height
        radius: parent.radius
        color: parent.hovered ? parent.hoverColor : parent.color

        Behavior on color {
            ColorAnimation {
                properties: "color"
                duration: 200
            }
        }
    }
}
