import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Notifications
import qs.services
import qs.config

Rectangle {
    id: root
    property list<Notification> notifications
    property bool dynamic: true

    color: Theme.base00
    width: parent.width
    height: Math.min(listView.contentHeight + 32, parent.height)

    Connections {
        target: NotificationService
        onReceived: notification => {
            if (root.dynamic)
                listModel.append({
                    value: notification
                });
        }
    }

    function clear() {
        listModel.clear();
    }

    Component.onCompleted: {
        for (const notification of root.notifications) {
            listModel.append({
                value: notification
            });
        }
    }

    ListModel {
        id: listModel
    }

    Behavior on height {
        NumberAnimation {
            duration: 100
            easing.type: Easing.InOutQuad
        }
    }

    ListView {
        id: listView
        anchors.fill: parent
        spacing: 16
        anchors.margins: 16
        model: listModel
        delegate: Content {}
    }
}
