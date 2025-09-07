import Quickshell
import qs.bars
import qs.modules.osd
import qs.modules.picker
import qs.modules.notification
import qs.modules.background
import qs.modules.panels
import qs.components
import qs.services
import qs.config
import QtQuick

ShellRoot {

    PanelWindow {
        height: 400
        width: 400
        anchors.top: true
        anchors.right: true
        color: "#120487"
        visible: false

        EdgedPanel {
            contentWidth: 100
            contentHeight: 100
            origin: AnimatedPanel.Origin.Bottom

            Rectangle {
                anchors.fill: parent
                color: Theme.base01
            }
        }
    }
    Wallpaper {}
    Frame {}
    // Lock {}

    Notification {}
    NotificationDashboard {}
    Osd {}
    TopBar {}
    LeftBar {}

    AppPicker {}
    CommandPicker {}

    DatePanel {}
    // PlayerPanel {}
}
