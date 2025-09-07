pragma Singleton

import Quickshell
import Quickshell.Services.Notifications

Singleton {
    id: root
    property list<Notification> notifications: []
    signal received(Notification notification)

    property NotificationServer server: NotificationServer {
        id: notificationServer

        imageSupported: true
        actionsSupported: true
        actionIconsSupported: true
        inlineReplySupported: true
        bodySupported: true
        bodyMarkupSupported: true
        bodyImagesSupported: true
        bodyHyperlinksSupported: true
        keepOnReload: false

        onNotification: notification => {
            notification.tracked = true;
            root.received(notification);
            root.notifications.push(notification);
        }
    }
}
