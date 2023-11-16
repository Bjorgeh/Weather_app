import QtQuick 2.15

//Dark mode button
Item {
    property bool darkMode: false

    property int button_width: 50
    property int button_height: 50
    property string button_text: ""

    property string buttonImage_source_light: "https://cdn-icons-png.flaticon.com/512/5115/5115625.png"
    property string buttonImage_source_dark: "https://cdn-icons-png.flaticon.com/512/5261/5261864.png"

    Rectangle{
        id: darkModeButton
        width: button_width
        height: button_height
        color: "transparent"

        Column{
            //anchors.centerIn: parent
            width: parent.width
            height: parent.height

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr(button_text)
                color: darkMode ? buttonImage_source_light : buttonImage_source_dark
            }

            Image{
                anchors.horizontalCenter: parent.horizontalCenter
                source: darkMode ? buttonImage_source_dark : buttonImage_source_light
                width: button_width/3
                height: button_height/2
            }
        }
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
                //darkModeButton.color = "lightgrey"
                root.app_dark_mode = !root.app_dark_mode
            }
        }
    }
}