import QtQuick
import QtQuick.Window
import "./CustomComponents"

//Weather App
Window {
    id: root
    width: 900
    height: 900
    visible: true
    title: qsTr("Bjorgeh's WeatherStation")

    //Sets bool value for darkmode
    property bool app_dark_mode: true

    //Color property
    property string black: "black"
    property string blue: "#5651ff"

    //Main rectangle for background and main layout
    Rectangle{
        id: main_rectangle
        anchors.fill: parent
        color: root.app_dark_mode ? root.black : root.blue

        property int updateWeather: 0

        //Top_View properties
        property string top_view_left_image: ""
        property string top_view_middle_image: ""
        property string top_view_right_image: ""

        property string top_view_left_text: ""
        property string top_view_middle_text: ""
        property string top_view_right_text: ""

        property string top_view_left_text_top: ""
        property string top_view_middle_text_top: ""
        property string top_view_right_text_top: ""

        //Bottom_View properties
        property string bottom_view_left_image: ""
        property string bottom_view_middle_image: ""
        property string bottom_view_right_image: ""

        property string bottom_view_left_text: ""
        property string bottom_view_middle_text: ""
        property string bottom_view_right_text: ""

        property string bottom_view_left_text_top: ""
        property string bottom_view_middle_text_top: ""
        property string bottom_view_right_text_top: ""


        onUpdateWeatherChanged: {

            //Sets data in top_view
            top_view.left_text = top_view_left_text
            top_view.left_Image = top_view_left_image
            top_view.left_text_top = top_view_left_text_top

            top_view.middle_text = top_view_middle_text
            top_view.middle_Image = top_view_middle_image
            top_view.middle_text_top = top_view_middle_text_top

            top_view.right_text = top_view_right_text
            top_view.right_Image = top_view_right_image
            top_view.right_text_top = top_view_right_text_top

            //Sets data in bottom_view

            bottom_view.left_text = bottom_view_left_text
            bottom_view.left_Image = bottom_view_left_image
            bottom_view.left_text_top = bottom_view_left_text_top

            bottom_view.middle_text = bottom_view_middle_text
            bottom_view.middle_Image = bottom_view_middle_image
            bottom_view.middle_text_top = bottom_view_middle_text_top

            bottom_view.right_text = bottom_view_right_text
            bottom_view.right_Image = bottom_view_right_image
            bottom_view.right_text_top = bottom_view_right_text_top

        }

        //Top bar
        Bar_view{
            id: top_view
            dark_mode: root.app_dark_mode
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
        }

        //Middle circle
        Search_Circle{
            anchors.centerIn: parent
            width: parent.width * 0.4
            height: parent.height * 0.4
            dark_mode: root.app_dark_mode
        }

        //bottom bar
        Bar_view{
            id: bottom_view
            dark_mode: root.app_dark_mode
            anchor_top: false
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
        }
    }
}


