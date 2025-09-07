import Quickshell
import Quickshell.Wayland
import QtQuick
import qs.components
import qs.config

BasePanel {
    aboveWindows: false
    exclusionMode: ExclusionMode.Ignore
    visible: true
    name: "wallpaper"
    WlrLayershell.layer: WlrLayer.Background

    anchors {
        top: true
        bottom: true
        left: true
        right: true
    }

    Image {
        anchors.fill: parent
        source: Theme.wallpaper
    }
}
