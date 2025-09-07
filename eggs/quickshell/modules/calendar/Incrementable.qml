import QtQuick.Layouts
import qs.components
import qs.config

RowLayout {
    id: root
    required property int value
    required property string text
    property string color: Theme.base05
    property int size: 12
    property int max
    property int min

    spacing: 8

    function increment() {
        if (max && value >= max)
            return;
        value += 1;
    }

    function decrement() {
        if (min && value <= min)
            return;
        value -= 1;
    }

    BaseButton {
        onClicked: root.decrement()
        IconifyIcon {
            set: Icons.set
            icon: Icons.calendarPrevious
            color: root.color
            implicitSize: root.size
        }
    }

    BaseText {
        text: root.text
        color: root.color
        font.pixelSize: root.size
    }

    BaseButton {
        onClicked: root.increment()
        IconifyIcon {
            set: Icons.set
            icon: Icons.calendarNext
            color: root.color
            implicitSize: root.size
        }
    }
}
