#ifndef TEMP_CONVERTION_H
#define TEMP_CONVERTION_H

#include <QObject>

class Temp_Convertion : public QObject
{
    Q_OBJECT
public:
    explicit Temp_Convertion(QObject *parent = nullptr);

    Q_INVOKABLE double kelvin_to_celsius(double kelvin);
    Q_INVOKABLE double kelvin_to_fahrenheit(double kelvin);

signals:

};

#endif // TEMP_CONVERTION_H
