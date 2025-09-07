import QtQuick
import "fuzzySort.js" as F

Item {
    property string query
    property list<var> result
    required property list<var> items
    property string key

    onQueryChanged: {
        result = fuzzysort.go(query, items, {
            key: key
        }).map((result => result.obj));
    }
}
