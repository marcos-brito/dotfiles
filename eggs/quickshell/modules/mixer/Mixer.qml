import Quickshell
import Quickshell.Services.Pipewire
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import "../services/"
import "../components/"
import "../config/"

FloatingWindow {
    implicitHeight: 200
    implicitWidth: 400
    color: Theme.base00

    ColumnLayout {
        spacing: 16

        PwNodeLinkTracker {
            id: linkTracker
            node: Pipewire.defaultAudioSink
        }

        Entry {
            node: Pipewire.defaultAudioSink
        }

        Repeater {
            model: linkTracker.linkGroups

            Entry {
                required property PwLinkGroup modelData
                node: modelData.source
            }
        }
    }
}
