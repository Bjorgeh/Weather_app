import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Controls.Material
import "../JS/API_Calls/Weather_from_city.js" as Weatherdata
import "../Secret/Api_key.js" as APIKey

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
                input.placeholderText = input.text

                //gets 3 hour forecast
                let short_forecast = Weatherdata.get_three_hour_forecast(input.text, APIKey.get_api_key())

                /*
                    Example from short_forecast function:
                    Actual temp, feels like, date and time, icon
                    [[-5.5499999999999545,-8.889999999999986,2023-11-16 03:00:00,03n],
                    [-7.7099999999999795,-11.370000000000005,2023-11-16 06:00:00,03n],
                    [-8.299999999999955,-12.089999999999975,2023-11-16 09:00:00,02d]]
                */

                //Sets three hour forecast
                main_rectangle.top_view_left_text = short_forecast[0][0] + "\nFeels like: " +short_forecast[0][1]
                main_rectangle.top_view_left_image = "https://openweathermap.org/img/wn/"+ short_forecast[0][3] +"@2x.png"
                main_rectangle.top_view_left_text_top = short_forecast[0][2]

                main_rectangle.top_view_middle_text =short_forecast[1][2] + "\n"+ short_forecast[1][0] + "\nFeels like: " +short_forecast[1][1]
                main_rectangle.top_view_middle_image = "https://openweathermap.org/img/wn/"+ short_forecast[1][3] +"@2x.png"
                main_rectangle.top_view_middle_text_top = short_forecast[1][2]

                main_rectangle.top_view_right_text =short_forecast[2][2] + "\n"+ short_forecast[2][0] + "\nFeels like: " +short_forecast[2][1]
                main_rectangle.top_view_right_image = "https://openweathermap.org/img/wn/"+ short_forecast[2][3] +"@2x.png"
                main_rectangle.top_view_right_text_top = short_forecast[2][2]


                //gets three day forecast
                let long_forecast = Weatherdata.get_three_days_forecast(input.text, APIKey.get_api_key())
                /*
                    Example from three_days_forecast function:
                    [-4.659999999999968,-4.659999999999968,2023-11-17 12:00:00,03d]
                    [-3.0600000000000023,-6.099999999999966,2023-11-18 12:00:00,02d]
                    [-5.569999999999993,-8.409999999999968,2023-11-19 12:00:00,04d]
                */

                main_rectangle.bottom_view_left_text = long_forecast[0][0] + "\nFeels like: " + long_forecast[0][1]
                main_rectangle.bottom_view_left_text_top = long_forecast[0][2]
                main_rectangle.bottom_view_left_image =  "https://openweathermap.org/img/wn/"+long_forecast[0][3]+"@2x.png"

                main_rectangle.bottom_view_middle_text = long_forecast[1][0] + "\nFeels like: " + long_forecast[1][1]
                main_rectangle.bottom_view_middle_text_top = long_forecast[1][2]
                main_rectangle.bottom_view_middle_image =  "https://openweathermap.org/img/wn/"+long_forecast[1][3]+"@2x.png"

                main_rectangle.bottom_view_right_text = long_forecast[2][0] + "\nFeels like: " + long_forecast[2][1]
                main_rectangle.bottom_view_right_text_top = long_forecast[2][2]
                main_rectangle.bottom_view_right_image =  "https://openweathermap.org/img/wn/"+long_forecast[2][3]+"@2x.png"

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

                //This triggers signal to update weather in main_rectangle
                main_rectangle.updateWeather++;
            }
        }
    }
}
