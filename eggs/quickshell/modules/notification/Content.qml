import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import Quickshell.Services.Notifications
import qs.components
import qs.services
import qs.config

Rectangle {
    id: root
    required property Notification value
    property date time: Date.now()
    property bool folded: true

    color: Theme.base00
    radius: 8
    height: folded ? 50 : 100
    width: ListView.view.width

    MouseArea {
        hoverEnabled: true
        anchors.fill: parent
        onDoubleClicked: root.value.dismiss()
        onEntered: {
            root.color = Theme.base01;
            root.folded = false;
        }
        onExited: {
            root.color = Theme.base00;
            root.folded = true;
        }
    }

    RowLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        IconifyIcon {
            id: fallback
            visible: false
            set: Icons.set
            icon: Icons.notifications
            color: Theme.base05
            implicitSize: 24
        }

        IconImage {
            source: root.value.appIcon || fallback.source
            implicitSize: 24
        }

        ColumnLayout {
            Layout.fillWidth: true

            BaseText {
                text: `${root.value.summary} - ${Qt.formatTime(root.time, "hh:mm")}`
                opacity: .7
            }

            BaseText {
                text: root.value.body
            }

            RowLayout {
                visible: !root.folded

                Repeater {
                    model: root.value.actions
                    BaseButton {
                        required property NotificationAction modelData

                        text: action.text
                        onClicked: action.invoke()
                    }
                }
            }
        }

        IconifyIcon {
            set: Icons.set
            icon: Icons.down
            color: Theme.base05
            implicitSize: 16
            rotation: root.folded ? 0 : 180

            Behavior on rotation {
                RotationAnimation {
                    duration: 200
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }
}
