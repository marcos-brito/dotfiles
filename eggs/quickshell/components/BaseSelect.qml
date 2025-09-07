import Quickshell.Widgets
import QtQuick // for Text
import QtQuick.Controls // for RowLayout
import "../config/"

ComboBox {
    id: control

    background: WrapperRectangle {
        color: Theme.base00
        radius: 8
    }

    delegate: ItemDelegate {
        id: delegate

        required property var model
        required property int index

        highlighted: control.highlightedIndex === index

        background: Rectangle {
            implicitWidth: control.implicitWidth
            implicitHeight: control.implicitHeight
            color: highlighted ? Theme.base00 : Theme.base01
        }

        contentItem: Text {
            text: delegate.model[control.textRole]
            color: Theme.base08
            font: control.font
            elide: Text.ElideRight
            verticalAlignment: Text.AlignVCenter
        }
    }

    contentItem: Text {
        text: control.displayText
        font: control.font
        color: Theme.base08
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }

    indicator: IconifyIcon {
        x: control.width - control.rightPadding 
        y: control.topPadding + (control.availableHeight - height) / 2 + 1
        set: Icons.set
        icon: Icons.down
        color: Theme.base08
        implicitSize: 16
        rotation: control.popup.visible ? 180 : 0

        Behavior on rotation {
            RotationAnimation {
                duration: 200
                easing.type: Easing.InOutQuad
            }
        }
    }

    popup: Popup {
        y: control.height - 1
        width: control.width
        height: Math.min(contentItem.implicitHeight, control.Window.height - topMargin - bottomMargin)

        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            model: control.popup.visible ? control.delegateModel : null
            currentIndex: control.highlightedIndex

            ScrollIndicator.vertical: ScrollIndicator {}
        }

        background: Rectangle {
            color: Theme.base01
            radius: 8
        }
    }
}
