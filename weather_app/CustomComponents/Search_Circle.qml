import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Controls.Material
import "../JS/API_Calls/Weather_from_city.js" as Weatherdata
import "../JS/Show_results.js" as Results
import "../Secret/Api_key.js" as APIKey

//Item for middle circle and searchfield
Item {
    id: front_search_field
    property bool dark_mode: false
    property string moon: "https://i.pinimg.com/originals/fa/86/97/fa869743d08ca95414a50cc0ec1526bd.png"
    property string sun: "https://www.pngall.com/wp-content/uploads/2016/07/Sun-Download-PNG.png"

    property string source_light:"https://cdn-icons-png.flaticon.com/512/5115/5115625.png"
    property string source_dark: "https://cdn-icons-png.flaticon.com/512/5261/5261864.png"

    property string cImage: "https://png2.cleanpng.com/sh/fe1625c150c91df1205f0495789c6e83/L0KzQYm3VsMxN6d0kJH0aYP2gLBuTfNmdKRujeU2Y3BwgMb7hgIucZR0huU2aHXkfMXvTfxwb5CyTdQ8OEDodoi9VMkybGIzT6M6OUa1SIO4VcMxPGE1TaI8NEG1PsH1h5==/kisspng-celsius-computer-icons-health-logo-5b380ef76491d1.711962821530400503412.png"
    property string fImage: "https://cdn-icons-png.flaticon.com/512/16/16090.png"

    Rectangle {
        id: circle
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
        radius: height / 2
        color: "gray"

        //Gets picture of the moon
        Image {
            id: moon_sun
            source: dark_mode ? moon : sun
            width: parent.width +150
            height: parent.height +150
            anchors.centerIn: parent

            Column{
                anchors.centerIn: parent

                //Takes city input from user
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
                        input.placeholderText = input.text

                        //gets 3 hour forecast
                        let short_forecast = Weatherdata.get_three_hour_forecast(input.text, APIKey.get_api_key())
                        //gets three day forecast
                        let long_forecast = Weatherdata.get_three_days_forecast(input.text, APIKey.get_api_key())

                        //sets the weather data
                        Results.set_short_data(short_forecast)
                        Results.set_long_data(long_forecast)

                        //Uses JS function to set weatherdata in c++ current_weater object
                        Weatherdata.set_current_weather(input.text,APIKey.get_api_key())

                        main_rectangle.city_name = input.text
                    }

                    Rectangle{
                        id: button_rect
                        //Custom DarkMode_button
                        anchors.top: input.bottom
                        width: input.width - input.width/3
                        height: input.height
                        anchors.left: parent.left
                        color: "transparent"

                        DarkMode_button{
                            id: dark_mode_button
                            anchors.top: parent.top
                            button_width: parent.width/2
                            button_height: parent.height
                            anchors.left: parent.left
                            anchors.topMargin: 5

                            imageLink: root.app_dark_mode ? source_dark : source_light
                        }

                        //Custom button
                        Unit_button{
                            id: tempUnit_button
                            anchors.top: parent.top
                            anchors.right: parent.right
                            button_width: parent.width/2
                            button_height: parent.height
                            anchors.topMargin: 5

                            imageLink: main_rectangle.is_celsius ? cImage : fImage
                        }

                    }
                }
            }
        }
    }
}
