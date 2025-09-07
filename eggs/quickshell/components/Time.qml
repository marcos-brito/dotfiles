import Quickshell
import Quickshell.Io
import QtQuick
import "../config/"

Text {
    property string format: "hh:mm"

    text: Qt.formatDateTime(clock.date, format)
    color: Theme.base05

    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }
}
