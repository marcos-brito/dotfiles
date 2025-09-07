import QtQuick
import Quickshell
import Quickshell.Wayland
import qs.services
import qs.config

PanelWindow {
    id: root
    required property string name

    visible: false
    WlrLayershell.namespace: `qs-${name}`
    exclusionMode: ExclusionMode.Ignore
    color: Theme.transparent

    Component.onCompleted: {
        Panels.register(root);
    }

    function open(): void {
        root.visible = true;
    }

    function close(): void {
        root.visible = false
    }
}
