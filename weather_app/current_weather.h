#ifndef CURRENT_WEATHER_H
#define CURRENT_WEATHER_H

#include <QMap>

#include <QObject>

class current_weather : public QObject
{
    Q_OBJECT
    //Q_PROPERTY(QString setCityName READ getCityName NOTIFY cityNameChanged)

public:
    current_weather(QObject *parent = nullptr);

    //Constructor for current_weather class
    Q_INVOKABLE void set_current_weather(QString CityName, QString WeatherDescription, QString timeStamp, QString Icon, float Temperature, float TemperatureFeelsLike);

    //Functions for getting data
    Q_INVOKABLE QString getCityName();
    Q_INVOKABLE QString getWeatherDescription();
    Q_INVOKABLE QString getTimeStamp();
    Q_INVOKABLE QString getIcon();
    Q_INVOKABLE float getTemperature();
    Q_INVOKABLE float getTemperatureFeelsLike();

    //Functions for setting data
    Q_INVOKABLE void setCityName(QString CityName);
    Q_INVOKABLE void setWeatherDescription(QString WeatherDescription);
    Q_INVOKABLE void setTimeStamp(QString TimeStamp);
    Q_INVOKABLE void setIcon(QString Icon);
    Q_INVOKABLE void setTemperature(float Temperature);
    Q_INVOKABLE void setTemperatureFeelsLike(float TemperatureFeelsLike);

signals:
    void cityNameChanged();

private:
    //Datamap
    Q_INVOKABLE QMap<QString,QString> weather_info_map;
    Q_INVOKABLE QMap<QString,float> weather_temp_map;

};

#endif // CURRENT_WEATHER_H
