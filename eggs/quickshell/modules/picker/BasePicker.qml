import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import qs.components
import qs.config
import Quickshell.Io
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import qs.components
import qs.config

AnimatedPanel {
    id: root
    required property list<var> items
    required property Component delegate
    property string query
    property string key

    slideFrom: "bottom"
    width: screen.width * 0.4
    height: screen.height * 0.6
    anchors.bottom: true

    Searcher {
        id: searcher
        query: root.query
        key: root.key
        items: root.items
        onItemsChanged: root.updateModel()
        onResultChanged: root.updateModel()
    }

    ListModel {
        id: listModel
    }

    function updateModel() {
        const source = actualItems();
        listModel.clear();

        for (let i = 0; i < source.length; i++) {
            listModel.append({
                value: source[i]
            });
        }
    }

    function actualItems(): list<var> {
        return root.queryIsEmpty() ? searcher.items : searcher.result;
    }

    function launch(item: var): void {}

    function queryIsEmpty(): bool {
        return query.trim().length == 0;
    }

    IpcHandler {
        target: root.name

        function open(): void {
            root.open();
        }
    }

    WrapperRectangle {
        color: Theme.base00
        width: root.width
        height: Math.min(listView.contentHeight + input.height + 48, root.height) // 48 for spacing/margins
        anchors.bottom: parent.bottom
        margin: 16

        Behavior on height {
            NumberAnimation {
                duration: 100
                easing.type: Easing.InOutQuad
            }
        }

        ColumnLayout {
            anchors.fill: parent
            spacing: 16
            anchors.margins: 16

            ListView {
                id: listView
                spacing: 16
                Layout.alignment: Qt.AlignTop
                Layout.fillWidth: true
                Layout.fillHeight: true
                highlight: BaseItem {
                    color: Theme.base02
                }

                model: listModel
                delegate: root.delegate
            }

            BaseTextField {
                id: input
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignBottom
                font.pixelSize: 16
                focus: true
                onTextChanged: root.query = text
                onAccepted: {
                    root.launch(root.actualItems()[listView.currentIndex]);
                    root.close();
                }

                Shortcut {
                    sequence: "Ctrl+K"
                    enabled: true
                    onActivated: listView.decrementCurrentIndex()
                    context: Qt.WindowShortcut
                }

                Shortcut {
                    sequence: "Ctrl+J"
                    enabled: true
                    onActivated: listView.incrementCurrentIndex()
                    context: Qt.WindowShortcut
                }
            }
        }
    }
}
