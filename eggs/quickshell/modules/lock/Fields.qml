import QtQuick
import QtQuick.Layouts
import qs.components
import qs.services
import qs.config

ColumnLayout {
    id: root
    required property LockContext context

    spacing: 32

    BaseText {
        text: Sysinfo.userName
        font.pixelSize: 24
        Layout.alignment: Qt.AlignHCenter
    }

    ColumnLayout {
        spacing: 8

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

        BaseText {
            visible: root.context.showFailure
            color: Theme.base08
            text: "Incorrect password"
        }
    }

    BaseButton {
        Layout.fillWidth: true
        color: Theme.base16
        text: "Entrar"
        Layout.preferredHeight: passwordBox.height
    }
}
