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

    //Row for showing icons and info in rectangels
    Row{
        id: row_view
        anchors.top: anchor_top ? parent.top : undefined
        anchors.bottom: anchor_top ? undefined : parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: root.height /5


        //Left rectangle
        Weather_info{

            id: top_left_component
            anchors.left: parent.left

            dark_mode: view_item.dark_mode

            text_top: view_item.left_text_top
            text_bottom: view_item.left_text
            imageLink: view_item.left_Image
        }

        //Middle Rectangle
        Weather_info{

            id: top_middle_component
            anchors.left: top_left_component.right

            dark_mode: view_item.dark_mode

            text_top: view_item.middle_text_top
            text_bottom: view_item.middle_text
            imageLink: view_item.middle_Image
        }

        //Right rectangle
        Weather_info{

            id: top_right_component
            anchors.left: top_middle_component.right

            dark_mode: view_item.dark_mode

            text_top: view_item.right_text_top
            text_bottom: view_item.right_text
            imageLink: view_item.right_Image
        }
    }
}
