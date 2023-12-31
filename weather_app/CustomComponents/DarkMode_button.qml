import QtQuick 2.15

//Dark mode button
Item {
    property bool darkMode: false

    property int button_width: 50
    property int button_height: 50
    property string button_text: ""

    property string bkgColor: "transparent"

    property string imageLink: ""

    Rectangle{
        id: darkModeButton
        width: button_width
        height: button_height
        color: bkgColor

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
                id: buttonImage
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.centerIn: parent
                source: imageLink
                width: button_width
                height: button_height-20
            }
        }
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
                //Changes to darkMode
                 root.app_dark_mode = !root.app_dark_mode

            }
        }
    }
}
