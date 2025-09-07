import QtQuick
import QtQuick.Layouts
import qs.components

RowLayout {
    IconifyIcon {
        id: icon
        set: "lucide"
        icon: Icons.passwordEmpty
        color: Theme.base0E
        implicitSize: 28
    }

    BaseTextField {
        id: passwordBox
        implicitWidth: 400
        font.pixelSize: 22
        focus: true
        enabled: !root.context.unlockInProgress
        echoMode: TextInput.Password
        inputMethodHints: Qt.ImhSensitiveData
        onTextChanged: root.context.currentText = this.text
        onAccepted: root.context.tryUnlock()

        Connections {
            target: root.context

            function onCurrentTextChanged() {
                passwordBox.text = root.context.currentText;
            }
        }
    }
}
