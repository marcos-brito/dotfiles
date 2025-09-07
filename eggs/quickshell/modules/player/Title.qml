import QtQuick
import QtQuick.Layouts
import qs.services
import qs.config

ColumnLayout {
    spacing: 16

    Text {
        text: Media.active.trackArtist
        color: Theme.base05
        font.pixelSize: 16
    }

    Text {
        text: Media.active.trackTitle
        color: Theme.base05
        font.pixelSize: 12
    }
}
