import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Material
import "js/API_Calls/weather_from_city.js" as WeatherService
import "secret/api_key.js" as APIKey

//Weather App
Window {
    width: 800
    height: 600
    visible: true
    title: qsTr("Bjorgeh's WeatherStation")

    Rectangle{
        id: background
        anchors.fill: parent
        color: "black"

        Rectangle {
            id: circle
            anchors.centerIn: parent
            width: 300
            height: 300
            radius: height / 2
            color: "gray"

            //Gets picture of the moon
            Image {
                id: moon
                source: "https://i.pinimg.com/originals/fa/86/97/fa869743d08ca95414a50cc0ec1526bd.png"
                width: 450
                height: 450
                anchors.centerIn: parent
            }

            //Takes cirty input from user
            TextField{
                id: input
                anchors.centerIn: parent
                placeholderText: "City"
                font.pixelSize: 20
                font.bold: true
                placeholderTextColor: "white"

                //Takes an Enter press to accept input
                onAccepted: {
                    console.log(input.text)
                    WeatherService.get_weather(input.text,APIKey.get_api_key())

                }
            }
        }
    }
}

