import QtQuick
import Quickshell
import Quickshell.Widgets

IconImage {
    required property string set
    required property string icon
    required property string color

    implicitSize: 24
    asynchronous: true
    source: `https://api.iconify.design/${set}/${icon}.svg?height=${actualSize}&color=%23${color.replace("#", "")}`
}
