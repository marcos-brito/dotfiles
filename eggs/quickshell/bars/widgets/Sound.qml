import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Pipewire
import Quickshell.Widgets
import qs.config
import qs.components

WrapperMouseArea {
    id: root
    property PwNode node: Pipewire.defaultAudioSource

    onPressed: node.audio.muted = !node.audio.muted
    onWheel: {
        if (wheel.angleDelta.y > 0 || wheel.angleDelta.x > 0) {
            if (node.audio.volume < 1)
                node.audio.volume += 0.1;
            return;
        }

        if (node.audio.volume > 0)
            node.audio.volume -= 0.1;
    }

    PwObjectTracker {
        objects: [root.node]
    }

    RowLayout {
        spacing: 8

        IconifyIcon {
            set: "lucide"
            icon: root.node.audio.muted ? Icons.audioMuted : Icons.audio
            color: root.node.audio.muted ? Theme.base08 : Theme.base0B
            implicitSize: 18
        }

        Text {
            text: `${Math.round(root.node.audio.volume * 100)}`
            color: root.node.audio.muted ? Theme.base08 : Theme.base0B
        }
    }
}
