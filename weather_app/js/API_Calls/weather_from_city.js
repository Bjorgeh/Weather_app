.pragma library

//Gets the weather from API by city name
function get_weather(CityName, api_key) {
    const api_link = "https://api.openweathermap.org/data/2.5/weather?q=" + encodeURIComponent(CityName) + "&appid=" + api_key;

    //Makes API Request
    var request = new XMLHttpRequest();
    request.open("GET", api_link, false);
    request.send();

    //Sets respons as variable
    var response = JSON.parse(request.responseText);

    //Changes the temps from kelvin to celcius
    if (response && response.main) {
        response.main.temp = kelvinToCelsius(response.main.temp);
        response.main.feels_like = kelvinToCelsius(response.main.feels_like);
        response.main.temp_min = kelvinToCelsius(response.main.temp_min);
        response.main.temp_max = kelvinToCelsius(response.main.temp_max);
    }

    //Prints respons nore readable
    console.log(JSON.stringify(response, null, 2));
    return response;
}

//Takes kelvin and returns celcius
function kelvinToCelsius(kelvin) {
    return kelvin - 273.15;
}



