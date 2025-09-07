import QtQuick
import QtQuick.Layouts
import qs.services

RowLayout {
    Repeater {
        model: Niri.workspaces

        Workspace {
            required property var modelData
            workspace: modelData
        }
    }
}
