pragma Singleton

import QtQuick
import Quickshell.Io
import Quickshell

Singleton {
    id: root
    property list<var> workspaces
    property list<var> windows
    property int idxToFocus
    property var focusedWindow: windows.find(w => w.is_focused)

    function focusWorkspace(idx: int): void {
        idxToFocus = idx;
        focusWorkspaceProc.running = true;
    }

    function index(workspace: var): int {
        return workspace.idx;
    }

    function isActive(workspace: var): bool {
        return workspace.is_active;
    }

    function windowName(window: var): string {
        return `${window.title}`;
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            workspacesProc.running = true;
            windowsProc.running = true;
        }
    }

    Process {
        id: workspacesProc
        running: true
        command: ["niri", "msg", "--json", "workspaces"]
        stdout: StdioCollector {
            onStreamFinished: {
                const workspaces = JSON.parse(text).sort((a, b) => a.id - b.id);
                root.workspaces = workspaces;
            }
        }
    }

    Process {
        id: windowsProc
        running: true
        command: ["niri", "msg", "--json", "windows"]
        stdout: StdioCollector {
            onStreamFinished: root.windows = JSON.parse(text)
        }
    }

    Process {
        id: focusWorkspaceProc
        running: false
        command: ["niri", "msg", "action", "focus-workspace", `${root.idxToFocus}`]
    }
}
