import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import qs.components
import qs.services
import qs.config

AnimatedPanel {
    id: root

    name: "notification"
    panelColor: Theme.transparent
    closeOnEsc: false
    width: screen.width * 0.25
    height: screen.height * 0.5
    focusable: false

    margins.top: Props.topBarHeight

    anchors {
        top: true
        right: true
    }

    Connections {
        target: NotificationService
        onReceived: notification => {
            root.open();
            timer.restart();
        }
    }

    Timer {
        id: timer
        interval: 5000
        onTriggered: {
            root.close();
            list.clear();
        }
    }

    NotificationList {
        id: list
    }
}
