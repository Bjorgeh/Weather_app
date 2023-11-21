#include "current_weather.h"

#include <QVector>

current_weather::current_weather(QObject *parent)
    : QObject{parent}
{
}

void current_weather::set_current_weather(QString CityName, QString WeatherDescription,QString timeStamp, QString Icon, float Temperature, float TemperatureFeelsLike)
{
    weather_info_map["City"] = CityName;
    weather_info_map["Description"] = WeatherDescription;
    weather_info_map["Icon"] = Icon;
    weather_info_map["TimeStamp"] = timeStamp;

    weather_temp_map["Temperature"] = Temperature;
    weather_temp_map["TemperatureFeelsLike"] = TemperatureFeelsLike;
}

QString current_weather::getCityName()
{
    return weather_info_map["City"];
}

QString current_weather::getWeatherDescription()
{
    return weather_info_map["Description"];
}

QString current_weather::getTimeStamp()
{
    return weather_info_map["TimeStamp"];
}

QString current_weather::getIcon()
{
    return weather_info_map["Icon"];
}

float current_weather::getTemperature()
{
    return weather_temp_map["Temperature"];
}

float current_weather::getTemperatureFeelsLike()
{
    return weather_temp_map["TemperatureFeelsLike"];
}

void current_weather::setCityName(QString CityName)
{
    weather_info_map["City"] = CityName;
}

void current_weather::setWeatherDescription(QString WeatherDescription)
{
    weather_info_map["Description"] = WeatherDescription;
}

void current_weather::setTimeStamp(QString TimeStamp)
{
    weather_info_map["TimeStamp"] = TimeStamp;
}

void current_weather::setIcon(QString Icon)
{
    weather_info_map["Icon"] = Icon;
}

void current_weather::setTemperature(float Temperature)
{
    weather_temp_map["Temperature"] = Temperature;
}

void current_weather::setTemperatureFeelsLike(float TemperatureFeelsLike)
{
    weather_temp_map["TemperatureFeelsLike"] = TemperatureFeelsLike;
}
