import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import qs.components
import qs.config

ColumnLayout {
    Time {
        color: Theme.base16
        font.pixelSize: 28
        font.bold: true
        horizontalAlignment: Text.AlignHCenter
        Layout.alignment: Qt.AlignCenter
    }

    Text {
        text: Qt.formatDate(new Date(grid.year, grid.month, 3), "MMMM")
        color: Theme.base16
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
        id: grid
        Layout.fillWidth: true

        delegate: Rectangle {
            required property var model

            width: 35
            height: 35
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
