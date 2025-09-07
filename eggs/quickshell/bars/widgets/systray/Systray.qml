import QtQuick
import QtQuick.Layouts
import Quickshell.Services.SystemTray

ColumnLayout {
    Repeater {
        model: SystemTray.items.values

        SystrayItem {
            required property SystemTrayItem modelData
            item: modelData
        }
    }
}
