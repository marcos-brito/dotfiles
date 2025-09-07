import Quickshell

BasePicker {
    id: root
    name: "app-picker"
    items: DesktopEntries.applications.values
    key: "name"

    function launch(entry: DesktopEntry) {
        entry.execute()
    }

    delegate: AppItem {}
}
