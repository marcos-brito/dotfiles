import QtQuick
import qs.config
import qs.components

import QtQuick
import qs.config

BasePanel {
    id: root
    property bool closeOnEsc: true
    default property alias content: contentWrapper.data
    property string panelColor: Theme.transparent
    property int origin: TestPanel.Origin.Top

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

        // ✅ Edge connector
        Edge {
            id: connector
            color: root.panelColor
            size: Props.radius * 2
            anchors.margins: -1 // overlap to hide seams

            transform: Rotation {
                origin.x: width / 2
                origin.y: height / 2
                angle: {
                    switch (root.origin) {
                    case TestPanel.Origin.TopLeft:
                        return 0;
                    case TestPanel.Origin.TopRight:
                        return 90;
                    case TestPanel.Origin.BottomRight:
                        return 180;
                    case TestPanel.Origin.BottomLeft:
                        return 270;
                    default:
                        return 0;
                    }
                }
            }

            anchors {
                left: (root.origin === TestPanel.Origin.Left || root.origin === TestPanel.Origin.TopLeft || root.origin === TestPanel.Origin.BottomLeft) ? panelBackground.right : undefined

                right: (root.origin === TestPanel.Origin.Right || root.origin === TestPanel.Origin.TopRight || root.origin === TestPanel.Origin.BottomRight) ? panelBackground.left : undefined

                top: (root.origin === TestPanel.Origin.Top || root.origin === TestPanel.Origin.TopLeft || root.origin === TestPanel.Origin.TopRight) ? panelBackground.bottom : undefined

                bottom: (root.origin === TestPanel.Origin.Bottom || root.origin === TestPanel.Origin.BottomLeft || root.origin === TestPanel.Origin.BottomRight) ? panelBackground.top : undefined
            }
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

                    slide.x: (root.origin === TestPanel.Origin.TopLeft || root.origin === TestPanel.Origin.BottomLeft || root.origin === TestPanel.Origin.Left) ? -panelBackground.width : (root.origin === TestPanel.Origin.TopRight || root.origin === TestPanel.Origin.BottomRight || root.origin === TestPanel.Origin.Right) ? panelBackground.width : 0

                    slide.y: (root.origin === TestPanel.Origin.TopLeft || root.origin === TestPanel.Origin.TopRight || root.origin === TestPanel.Origin.Top) ? -panelBackground.height : (root.origin === TestPanel.Origin.BottomLeft || root.origin === TestPanel.Origin.BottomRight || root.origin === TestPanel.Origin.Bottom) ? panelBackground.height : 0
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

// BasePanel {
//     id: root
//     property bool closeOnEsc: true
//     default property alias content: contentWrapper.data
//     property string panelColor: Theme.transparent
//     property int origin: TestPanel.Origin.Center
//
//     enum Origin {
//         Top,
//         TopLeft,
//         TopRight,
//         Bottom,
//         BottomLeft,
//         BottomRight,
//         Right,
//         Left,
//         Center
//     }
//
//     focusable: true
//
//     Shortcut {
//         sequences: ["Escape"]
//         enabled: root.closeOnEsc
//         onActivated: root.close()
//         context: Qt.WindowShortcut
//     }
//
//     Timer {
//         id: timer
//         interval: 200
//         repeat: false
//         onTriggered: root.visible = false
//     }
//
//     function open(): void {
//         visible = true;
//         panelBackground.state = "opened";
//     }
//
//     function close(): void {
//         panelBackground.state = "closed";
//         timer.start();
//     }
//
//     Rectangle {
//         id: panelBackground
//         color: root.panelColor
//         anchors.fill: parent
//         topLeftRadius: Props.radius
//         bottomLeftRadius: Props.radius
//         transformOrigin: Item.Center
//         state: "closed"
//
//         transform: Translate {
//             id: slide
//         }
//
//         Item {
//             id: contentWrapper
//             anchors.fill: parent
//             state: "closed"
//         }
//
//         states: [
//             State {
//                 name: "opened"
//                 PropertyChanges {
//                     contentWrapper.opacity: 1
//                     panelBackground.scale: 1
//                     slide.x: 0
//                     slide.y: 0
//                 }
//             },
//             State {
//                 name: "closed"
//                 PropertyChanges {
//                     contentWrapper.opacity: 0
//                     panelBackground.scale: 0.4
//                     slide.x: {
//                         switch (root.origin) {
//                         case TestPanel.Origin.TopLeft:
//                         case TestPanel.Origin.BottomLeft:
//                         case TestPanel.Origin.Left:
//                             return -panelBackground.width;
//                             break;
//                         case TestPanel.Origin.TopRight:
//                         case TestPanel.Origin.BottomRight:
//                         case TestPanel.Origin.Right:
//                             return +panelBackground.width;
//                             break;
//                         default:
//                             return 0;
//                             break;
//                         }
//                     }
//                     slide.y: {
//                         switch (root.origin) {
//                         case TestPanel.Origin.TopLeft:
//                         case TestPanel.Origin.TopRight:
//                         case TestPanel.Origin.Top:
//                             return -panelBackground.height;
//                             break;
//                         case TestPanel.Origin.BottomRight:
//                         case TestPanel.Origin.BottomLeft:
//                         case TestPanel.Origin.Bottom:
//                             return +panelBackground.height;
//                             break;
//                         default:
//                             return 0;
//                             break;
//                         }
//                     }
//                 }
//             }
//         ]
//
//         transitions: [
//             Transition {
//                 from: "closed"
//                 to: "opened"
//                 NumberAnimation {
//                     properties: "opacity,scale,x,y"
//                     duration: 200
//                     easing.type: Easing.OutExpo
//                 }
//             },
//             Transition {
//                 from: "opened"
//                 to: "closed"
//                 NumberAnimation {
//                     properties: "opacity,scale,x,y"
//                     duration: 200
//                     easing.type: Easing.InQuad
//                 }
//             }
//         ]
//     }
// }
