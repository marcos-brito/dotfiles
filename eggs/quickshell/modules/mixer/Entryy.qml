import Quickshell
import Quickshell.Services.Pipewire
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import "../services/"
import "../components/"
import "../config/"

GridLayout {
    required property PwNode node

    PwObjectTracker {
        objects: [node]
    }

        BaseButton {
            implicitHeight: 30
            implicitWidth: 30
            radius: 16
            onPressed: node.audio.muted = !node.audio.muted
            IconifyIcon {
                implicitSize: 18
                anchors.centerIn: parent
                set: "lucide"
                icon: node.audio.muted ? Icons.audioMuted : Icons.audio
                color: node.audio.muted ? Theme.base08 : Theme.base0B
            }
        }

    RowLayout {
        Text {
            text: {
                // application.name -> description -> name
                const app = node.properties["application.name"] ?? (node.description != "" ? node.description : node.name);
                const media = node.properties["media.name"];
                return media != undefined ? `${app} - ${media}` : app;
            }
        }

        Text {
            Layout.rightMargin: 5
            Layout.alignment: Qt.AlignRight
            text: `${Math.floor(node.audio.volume * 100)}%`
            color: Theme.base05
        }
    }

    RowLayout {

        BaseSlider {
            width: 200
            color: node.audio.muted ? Theme.base08 : Theme.base0B
            value: node.audio.volume
            onValueChanged: node.audio.volume = value
        }
    }
}
