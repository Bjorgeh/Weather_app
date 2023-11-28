# Qt Quick Weather Application

## About the Project
This project is focused on developing a simple yet functional desktop weather application using Qt Quick QML, C++, and JavaScript. The application aims to provide an intuitive and user-friendly interface that displays real-time weather updates and forecasts for selected cities.

## Requirements:
1. Qt Creator 10.0.3 or newer 
2. Qt Desktop 6.6.0 MINGW 64 
3. Qt WebAssembly 6.6.0 Multi Threaded (This is under testing)

## Features:
1. **City Selection**: Allows users to choose a city to view weather data, implemented as either a search field.
2. **Current Weather Conditions Display**: Shows current weather conditions for the selected city, including temperature and weather type (sunny, rainy, cloudy, etc.).
3. **Weather Icon**: Incorporates icons representing the current weather conditions.
4. **Long-Term Forecast**: Features a simple long-term 3-day forecast, with date, temperatures and weather icons.
5. **Interactive User Interface**: Designed to be intuitive and easy to navigate.
6. **Error Handling**: ~~Basic error handling for situations like network errors or incorrect city names.~~
7. **Temperature Unit Choice**: Allows users to choose between Celsius and Fahrenheit.
8. **Manual Update Function**: ~~Feature to manually update weather data.~~
9. **Dark Mode**: An option for users to switch between dark/light mode.

## Usage:
How to use the weather app
1. Register at [OpenWeatherMap](https://openweathermap.org/) to get your unique API key.
2. Insert the API key in the ./Weather_app/weather_app/secret/api_key.js like this:
```
   .pragma library

   function get_api_key() {
       //This key is from the OpenWeatherMap API
       return "YOUR_API_KEY"
}
```
3. Now the application configuration is complete.
4. Enjoy the app.
