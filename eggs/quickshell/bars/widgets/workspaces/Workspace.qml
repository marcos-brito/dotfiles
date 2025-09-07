import QtQuick
import qs.config
import qs.services

Rectangle {
    required property var workspace

    color: Theme.base0E
    height: 10
    implicitWidth: Niri.isActive(workspace) ? 50 : 10
    radius: Niri.isActive(workspace) ? 8 : 50

    Behavior on implicitWidth {
        NumberAnimation {
            duration: 200
            easing.type: Easing.InOutQuad
        }
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onClicked: Niri.focusWorkspace(Niri.index(parent.workspace))
        onEntered: if (!Niri.isActive(parent.workspace))
            parent.implicitWidth = 30
        onExited: if (!Niri.isActive(parent.workspace))
            parent.implicitWidth = 10
    }
}
