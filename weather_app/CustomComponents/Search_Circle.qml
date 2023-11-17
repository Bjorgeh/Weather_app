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


                        //Sets current weather .. Working, but no custom component for this yet.
                        /*
                            let weather = Weatherdata.get_current_weather(input.text,APIKey.get_api_key())

                            let current_temp = weather[0][0].toString()
                            let current_temp_feelsLike = weather[0][1].toString()
                            let icon = weather[1][0].toString()
                            console.log(icon)
                            main_rectangle.top_view_left_text = "Now: "+ current_temp + "\nFeels like: " +current_temp_feelsLike
                            main_rectangle.top_view_left_image = "https://openweathermap.org/img/wn/"+ icon +"@2x.png"

                        */

                    }

                    //Custom DarkMode_button
                    DarkMode_button{
                        id: dark_mode_button
                        anchors.top: input.bottom
                        button_width: input.width
                        button_height: input.height
                        anchors.topMargin: 5

                    }
                }
            }
        }
    }
}
