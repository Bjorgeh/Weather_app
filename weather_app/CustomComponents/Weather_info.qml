import QtQuick 2.15

Item {
    id: weather_item

    width: parent.width /3
    height: parent.height

    // Custom properties
    property bool dark_mode: false
    property string text_top: "Date"
    property string text_bottom: "Temperature"
    property string imageLink: ""

    // Rectangle as "container"
    Rectangle {
        id: weather_rect
        color: dark_mode ? view_item.black : view_item.blue
        anchors.fill: parent

        // Column for displaying top-text|image|bottom-text
        Column {
            anchors.centerIn: parent

            // Top text - Date
            Text {
                id: text_field_top
                text: text_top
                color: dark_mode ? view_item.blue : view_item.black
            }

            // Image - Icon from API
            Image {
                id: png
                source: imageLink
            }

            // Bottom text - Temperatures
            Text {
                id: text_field_bottom
                text: text_bottom
                color: dark_mode ? view_item.blue : view_item.black
            }
        }
    }
}
