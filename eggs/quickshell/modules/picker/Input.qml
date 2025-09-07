import Quickshell.Widgets
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import qs.components
import qs.config

BaseTextField {
    font.pixelSize: 16
    focus: true

    Shortcut {
        sequences: ["Ctrl", "k"]
        enabled: true
        onActivated: root.previous()
        context: Qt.WindowShortcut
    }

    Shortcut {
        sequences: ["Ctrl", "j"]
        enabled: true
        onActivated: root.next()
        context: Qt.WindowShortcut
    }

    Shortcut {
        sequences: ["Tab"]
        enabled: true
        onActivated: root.complete()
        context: Qt.WindowShortcut
    }
}
