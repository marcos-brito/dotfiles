import qs.components
import QtQuick

Item {
    id: root
    property int origin: AnimatedPanel.Origin.Top
    property int contentHeight: 120
    property int contentWidth: 120
    property int edgeSize: 60
    default property alias data: content.data

    height: contentHeight + edgeSize * 2
    width: contentWidth + edgeSize * 2
    anchors.fill: parent
    state: origin

    Item {
        id: content
        width: root.contentWidth
        height: root.contentHeight
    }

    Edge {
        id: edge1
        size: root.edgeSize
    }

    Edge {
        id: edge2
        size: root.edgeSize
    }

    states: [
        State {
            name: AnimatedPanel.Origin.Top
            PropertyChanges {
                edge1.anchors.top: content.top
                edge1.anchors.left: content.left
                edge1.anchors.leftMargin: -root.edgeSize
                edge2.anchors.top: content.top
                edge2.anchors.right: content.right
                edge2.anchors.rightMargin: -root.edgeSize
                edge2.rotation: 270
            }
        },
        State {
            name: AnimatedPanel.Origin.TopRight
            PropertyChanges {
                edge1.anchors.top: content.top
                edge1.anchors.left: content.left
                edge1.anchors.leftMargin: -root.edgeSize
                edge2.anchors.bottom: content.bottom
                edge2.anchors.right: content.right
                edge2.anchors.bottomMargin: -root.edgeSize
            }
        },
        State {
            name: AnimatedPanel.Origin.TopLeft
            PropertyChanges {
                edge1.anchors.bottom: content.bottom
                edge1.anchors.left: content.left
                edge1.anchors.bottomMargin: -root.edgeSize
                edge1.rotation: 270
                edge2.anchors.top: content.top
                edge2.anchors.right: content.right
                edge2.anchors.rightMargin: -root.edgeSize
                edge2.rotation: 270
            }
        },
        State {
            name: AnimatedPanel.Origin.Bottom
            PropertyChanges {
                edge1.anchors.bottom: content.bottom
                edge1.anchors.left: content.left
                edge1.anchors.leftMargin: -root.edgeSize
                edge1.rotation: 90
                edge2.anchors.bottom: content.bottom
                edge2.anchors.right: content.right
                edge2.anchors.rightMargin: -root.edgeSize
                edge2.rotation: 180
            }
        },
        State {
            name: AnimatedPanel.Origin.BottomRight
            PropertyChanges {
                edge1.anchors.bottom: content.bottom
                edge1.anchors.left: content.left
                edge1.anchors.leftMargin: -root.edgeSize
                edge1.rotation: 90
                edge2.anchors.top: content.top
                edge2.anchors.right: content.right
                edge2.anchors.topMargin: -root.edgeSize
                edge2.rotation: 90
            }
        },
        State {
            name: AnimatedPanel.Origin.BottomLeft
            PropertyChanges {
                edge1.anchors.top: content.top
                edge1.anchors.left: content.left
                edge1.anchors.topMargin: -root.edgeSize
                edge1.rotation: 180
                edge2.anchors.bottom: content.bottom
                edge2.anchors.right: content.right
                edge2.anchors.rightMargin: -root.edgeSize
                edge2.rotation: 180
            }
        },
        State {
            name: AnimatedPanel.Origin.Right
            PropertyChanges {
                edge1.anchors.bottom: content.bottom
                edge1.anchors.right: content.right
                edge1.anchors.bottomMargin: -root.edgeSize
                edge2.anchors.top: content.top
                edge2.anchors.right: content.right
                edge2.anchors.topMargin: -root.edgeSize
                edge2.rotation: 90
            }
        },
        State {
            name: AnimatedPanel.Origin.Left
            PropertyChanges {
                edge1.anchors.bottom: content.bottom
                edge1.anchors.left: content.left
                edge1.anchors.bottomMargin: -root.edgeSize
                edge1.rotation: 270
                edge2.anchors.top: content.top
                edge2.anchors.left: content.left
                edge2.anchors.topMargin: -root.edgeSize
                edge2.rotation: 180
            }
        }
    ]
}
