pragma singleton
import Quickshell.Services.SystemTray 

import Quickshell

Singleton {
    property list<SystemTrayItem> items: SystemTray.items.values
}
