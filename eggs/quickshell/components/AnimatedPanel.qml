import QtQuick
import qs.config

BasePanel {
    id: root
    property bool closeOnEsc: true
    default property alias content: contentWrapper.data
    property string panelColor: Theme.transparent
    property string slideFrom: "right" // "top", "bottom", "left", "right"

    enum Origin {
        Top,
        TopLeft,
        TopRight,
        Bottom,
        BottomLeft,
        BottomRight,
        Right,
        Left
    }

    focusable: true

    Shortcut {
        sequences: ["Escape"]
        enabled: root.closeOnEsc
        onActivated: root.close()
        context: Qt.WindowShortcut
    }

    Timer {
        id: timer
        interval: 200
        repeat: false
        onTriggered: root.visible = false
    }

    function open(): void {
        visible = true;
        panelBackground.state = "opened";
    }

    function close(): void {
        panelBackground.state = "closed";
        timer.start();
    }

    Rectangle {
        id: panelBackground
        color: root.panelColor
        anchors.fill: parent
        topLeftRadius: Props.radius
        bottomLeftRadius: Props.radius
        transformOrigin: Item.Center
        state: "closed"

        transform: Translate {
            id: slide
        }

        Item {
            id: contentWrapper
            anchors.fill: parent
            state: "closed"
        }

        states: [
            State {
                name: "opened"
                PropertyChanges {
                    contentWrapper.opacity: 1
                    panelBackground.scale: 1
                    slide.x: 0
                    slide.y: 0
                }
            },
            State {
                name: "closed"
                PropertyChanges {
                    contentWrapper.opacity: 0
                    panelBackground.scale: 0.4
                    slide.x: (root.slideFrom === "left" ? -panelBackground.width : root.slideFrom === "right" ? panelBackground.width : 0)
                    slide.y: (root.slideFrom === "top" ? -panelBackground.height : root.slideFrom === "bottom" ? panelBackground.height : 0)
                }
            }
        ]

        transitions: [
            Transition {
                from: "closed"
                to: "opened"
                NumberAnimation {
                    properties: "opacity,scale,x,y"
                    duration: 200
                    easing.type: Easing.OutExpo
                }
            },
            Transition {
                from: "opened"
                to: "closed"
                NumberAnimation {
                    properties: "opacity,scale,x,y"
                    duration: 200
                    easing.type: Easing.InQuad
                }
            }
        ]
    }
}
