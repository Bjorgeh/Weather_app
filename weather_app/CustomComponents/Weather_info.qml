import QtQuick 2.15

Item {
    id: weather_item

    width: parent.width /3
    height: parent.height

    // Custom properties
    property bool dark_mode: false
    property string text_top: ""
    property string text_top1: ""
    property string text_top2: ""
    property string text_bottom: ""
    property string text_bottom1: ""
    property string text_bottom2: ""
    property string imageLink: ""
    property string bkg_color: dark_mode ? view_item.black : view_item.blue
    property string text_color: dark_mode ? view_item.blue : view_item.black

    // Rectangle as "container"
    Rectangle {
        id: weather_rect
        color: bkg_color
        anchors.fill: parent

        // Column for displaying top-text|image|bottom-text
        Column {
            anchors.centerIn: parent

            // Top text - Date
            Text {
                id: text_field_top
                text: text_top
                color: text_color
            }
            // Top text1
            Text {
                id: text_field_top1
                text: text_top1
                color: text_color
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
                color: text_color
            }
            // Bottom text - Temperatures
            Text {
                id: text_field_bottom1
                text: text_bottom1
                color: text_color
            }
            // Bottom text - Temperatures
            Text {
                id: text_field_bottom2
                text: text_bottom2
                color: text_color
            }
        }
    }
}
