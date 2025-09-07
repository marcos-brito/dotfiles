pragma Singleton

import Quickshell
import Quickshell.Io

Singleton {
    id: root
    property string userName
    property string uptime

    Process {
        running: true
        command: ["whoami"]
        stdout: StdioCollector {
            onStreamFinished: root.userName = text
        }
    }

    Process {
        running: true
        command: ["awk", "\"{printf \"%dh %dm\n\", $1/3600, ($1%3600)/60}\"", "/proc/uptime" ]
        stdout: StdioCollector {
            onStreamFinished: root.uptime = text
        }
    }
}
