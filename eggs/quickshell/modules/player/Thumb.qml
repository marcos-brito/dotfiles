import QtQuick
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
import qs.services
import qs.components
import qs.services

Image {
    id: image
    sourceSize.width: 120
    sourceSize.height: 120
    source: Media.active.trackArtUrl
    fillMode: Image.PreserveAspectCrop

    layer.enabled: true
    layer.effect: OpacityMask {
        maskSource: Rectangle {
            width: image.sourceSize.width
            height: image.sourceSize.height
            radius: 8
            visible: false
        }
    }
}
