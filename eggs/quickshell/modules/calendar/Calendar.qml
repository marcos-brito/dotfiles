import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import qs.config

ColumnLayout {
    id: root

    property int year:  (new Date()).getFullYear()
    property int month: (new Date()).getMonth()

    RowLayout {
        Incrementable {
            Layout.alignment: Qt.AlignLeft
            color: Theme.base16
            value: root.year
            text: root.year
            onValueChanged: root.year = value
        }

        Incrementable {
            Layout.alignment: Qt.AlignRight
            color: Theme.base16
            value: root.month
            text: Qt.formatDate(new Date(0, root.month), "MMMM")
            min: 1
            max: 12
            onValueChanged: root.month = value
        }
    }

    DayOfWeekRow {
        id: row
        Layout.fillWidth: true

        delegate: Text {
            text: shortName
            font: control.font
            color: Theme.base16
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter

            required property string shortName
        }
    }

    MonthGrid {
        year: root.year
        month: root.month
        id: grid
        Layout.fillWidth: true
        Layout.fillHeight: true

        delegate: Rectangle {
            required property var model

            width: 25
            height: 25
            color: model.today ? Theme.base16 : Theme.base00
            radius: 4

            Text {
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: parent.model.day
                color: {
                    const isCurrentDay = parent.model.today;
                    const isCurrentMonth = parent.model.month === grid.month;

                    if (isCurrentDay)
                        return Theme.base00;

                    if (isCurrentMonth)
                        return Theme.base16;

                    return Theme.base02;
                }
            }
        }
    }
}
