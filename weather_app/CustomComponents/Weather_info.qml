import QtQuick 2.15

Item {
    id: weather_item

    //Custom properties
    property bool dark_mode: false
    property string left_text_top: "Date"
    property string left_text: "Temperature"
    property string imageLink: ""

    //Rectangle as "container"
    Rectangle{
        id: weather_rect
        color: dark_mode ? view_item.black : view_item.blue
        anchors.left: parent.left
        width: parent.width /3
        height: parent.height

        //Column for displaying top-text, image and bottom-text
        Column{
            Text {
                id: text_field_top
                text: left_text_top
                color: dark_mode ? view_item.blue : view_item.black
            }
            anchors.centerIn: parent
            Image {
                id: png
                source: imageLink
            }
            Text {
                id: text_field_bottom
                text: left_text
                color: dark_mode ? view_item.blue : view_item.black
            }
        }
    }
}
