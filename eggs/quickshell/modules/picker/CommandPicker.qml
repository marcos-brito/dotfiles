import Quickshell
import qs.components
import qs.services

BasePicker {
    id: root
    name: "command-picker"
    items: Commands.commands
    key: "name"

    function launch(cmd) {
        cmd.action()
    }

    delegate: CommandItem {}
}
