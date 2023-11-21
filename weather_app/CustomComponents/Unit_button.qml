import QtQuick 2.15

//Dark mode button
Item {

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
                //Changes units to F or C
                main_rectangle.is_celsius = !main_rectangle.is_celsius

            }
        }
    }
}
