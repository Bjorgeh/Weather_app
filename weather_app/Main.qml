import QtQuick
import QtQuick.Window
import "./CustomComponents"
import "JS/API_Calls/Weather_from_city.js" as Weatherdata
import "JS/Show_results.js" as Results
import "Secret/Api_key.js" as APIKey

//Weather App
Window {
    id: root
    width: 900
    height: 900
    visible: true
    title: qsTr("Bjorgeh's WeatherStation")

    //Sets bool value for darkmode - change this to change between darkmode and lightmode
    property bool app_dark_mode: false

    //Color property
    property string black: "black"
    property string blue: "#5651ff"

    //Main rectangle for background and main layout
    Rectangle{
        id: main_rectangle
        anchors.fill: parent
        color: root.app_dark_mode ? root.black : root.blue

        //Variabel for signal to update weather
        property int updateWeather: 0

        property bool is_celsius: true
        property string f_or_c: is_celsius ? " C" : " F"

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

        property string city_name: ""

        //Signal for updating weather
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

            //Sets data in current_weather - from C++ object
            current_info.imageLink = current_weather.getIcon()
            current_info.text_top = current_weather.getCityName() + " now:\n" + current_weather.getTimeStamp()

            //sets variables for better readability
            let current_temp = is_celsius ? convertion.kelvin_to_celsius(current_weather.getTemperature()) : convertion.kelvin_to_fahrenheit(current_weather.getTemperature())
            let feels_like = is_celsius ? convertion.kelvin_to_celsius(current_weather.getTemperatureFeelsLike()) : convertion.kelvin_to_fahrenheit(current_weather.getTemperatureFeelsLike())

            current_info.text_bottom =
                    "Actual: "+ current_temp.toString()
                    + main_rectangle.f_or_c + "\n"
                    + current_weather.getWeatherDescription()
                    + "\n"
                    +"Feels like: "+ feels_like.toString() + main_rectangle.f_or_c
        }

        //Signal for updating weather and unit
        onIs_celsiusChanged: {

            main_rectangle.f_or_c = is_celsius ? " C" : " F"

            //gets 3 hour forecast
            let short_forecast = Weatherdata.get_three_hour_forecast(city_name, APIKey.get_api_key())
            //gets three day forecast
            let long_forecast = Weatherdata.get_three_days_forecast(city_name, APIKey.get_api_key())

            //sets the weather data
            Results.set_short_data(short_forecast)
            Results.set_long_data(long_forecast)
        }

        //Top bar
        Bar_view{
            id: top_view
            dark_mode: root.app_dark_mode
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
        }

        //Current weather
        Weather_info{
            id: current_info
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            width: parent.width/3
            height: parent.height/3
            dark_mode: root.app_dark_mode
            bkg_color: root.app_dark_mode ? root.black : root.blue
            text_color: root.app_dark_mode ? root.blue : root.black
        }

        //Middle circle
        Search_Circle{
            id: search_circle
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


