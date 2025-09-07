pragma Singleton

import Quickshell
import qs.components

Singleton {
    property var panels: ({})

    function register(panel: BasePanel) {
        panels[panel.name] = panel
    }

    function open(name: string) {
        panels[name].open();
    }

    function close(name: string) {
        panels[name].close();
    }
}
