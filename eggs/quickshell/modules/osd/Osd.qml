import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import Quickshell.Io
import Quickshell.Services.Pipewire
import qs.components
import qs.config

AnimatedPanel {
    id: root
    property PwNode node: Pipewire.defaultAudioSource

    closeOnEsc: false
    panelColor: Theme.base00
    focusable: false
    name: "osd"
    width: screen.width * 0.05
    height: screen.height * 0.2

    anchors {
        right: true
    }

    PwObjectTracker {
        objects: [root.node]
    }

    Timer {
        id: timer
        interval: 2000
        onTriggered: root.close()
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.bottomMargin: Props.barMargin
        anchors.topMargin: Props.barMargin

        BaseSlider {
            flip: true
            color: root.node.audio.muted ? Theme.base08 : Theme.base0B
            value: root.node.audio.volume
            stepSize: 0.1
            onValueChanged: root.node.audio.volume = value
            orientation: Qt.Vertical
            Layout.alignment: Qt.AlignHCenter
            Layout.fillHeight: true
        }

        IconifyIcon {
            set: "lucide"
            icon: root.node.audio.muted ? Icons.audioMuted : Icons.audio
            color: root.node.audio.muted ? Theme.base08 : Theme.base0B
            implicitSize: 20
            Layout.alignment: Qt.AlignHCenter
        }
    }

    IpcHandler {
        target: "osd"

        function show(): void {
            root.open()
            timer.restart();
        }

        function toogle(): void {
            root.node.audio.muted = !root.node.audio.muted;
            show();
        }

        function increase(): void {
            if (root.node.audio.volume < 1)
                root.node.audio.volume += 0.05;
            show();
        }

        function decrease(): void {
            if (root.node.audio.volume > 0)
                root.node.audio.volume -= 0.05;
            show();
        }
    }
}
