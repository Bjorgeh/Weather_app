import QtQuick 2.15

Item {
    id: view_item

    //All
    property bool dark_mode: false

    //Left rectangle
    property string left_Image: ""
    property string left_text: ""
    property string left_text_top: ""

    //Middle Rectangle
    property string middle_Image: ""
    property string middle_text: ""
    property string middle_text_top: ""

    //Right rectangle
    property string right_Image: ""
    property string right_text: ""
    property string right_text_top: ""

    //true if top, false if bottom
    property bool anchor_top: true

    //Color property
    property string black: "black"
    property string blue: "#5651ff"

    Row{
        id: row_view
        anchors.top: anchor_top ? parent.top : undefined
        anchors.bottom: anchor_top ? undefined : parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: root.height /5

        //Left rectangle
        Rectangle{
            id: left
            color: dark_mode ? view_item.black : view_item.blue
            anchors.left: parent.left
            width: parent.width /3
            height: parent.height
            Column{
                Text {
                    id: left_text_field_top
                    text: left_text_top
                    color: dark_mode ? view_item.blue : view_item.black
                }
                anchors.centerIn: parent
                Image {
                    id: left_png
                    source: left_Image
                }
                Text {
                    id: left_text_field_bottom
                    text: left_text
                    color: dark_mode ? view_item.blue : view_item.black
                }
            }
        }

        //Middle rectangle
        Rectangle{
            id: middle
            color: dark_mode ? view_item.black : view_item.blue
            anchors.left: left.right
            width: parent.width /3
            height: parent.height
            Column{
                Text {
                    id: middle_text_field_top
                    text: middle_text_top
                    color: dark_mode ? view_item.blue : view_item.black
                }
                anchors.centerIn: parent
                Image {
                    id: middle_png
                    source: middle_Image
                }
                Text {
                    id: middle_text_field_bottom
                    text: middle_text
                    color: dark_mode ? view_item.blue : view_item.black
                }
            }
        }

        //right rectangle
        Rectangle{
            id: right
            color: dark_mode ? view_item.black : view_item.blue
            anchors.left: middle.right
            width: parent.width /3
            height: parent.height
            Column{
                Text {
                    id: right_text_field_top
                    text: right_text_top
                    color: dark_mode ? view_item.blue : view_item.black
                }
                anchors.centerIn: parent
                Image {
                    id: right_png
                    source: right_Image
                }
                Text {
                    id: right_text_field_bottom
                    text: right_text
                    color: dark_mode ? view_item.blue : view_item.black
                }
            }
        }
    }
}

