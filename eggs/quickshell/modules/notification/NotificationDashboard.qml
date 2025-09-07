import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import qs.components
import qs.services
import qs.config

AnimatedPanel {
    id: root

    name: "notification-dashboard"
    panelColor: Theme.base00
    width: screen.width * 0.25
    height: screen.height * 0.7

    margins.left: Props.leftBarWidth

    anchors {
        left: true
    }

    NotificationList {
        id: list
        notifications: NotificationService.notifications
    }
}
