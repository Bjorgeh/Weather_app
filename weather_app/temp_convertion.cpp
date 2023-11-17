#include "temp_convertion.h"
//imports math for rounding numbers
#include <cmath>

// Constructor
Temp_Convertion::Temp_Convertion(QObject *parent)
    : QObject{parent}
{

}

// Function for converting Kelvin to Celsius
double Temp_Convertion::kelvin_to_celsius(double kelvin)
{
    double result = kelvin - 273.15;
    return std::round(result * 10) / 10; // Round to 1 decimal place
}

// Function for converting Kelvin to Fahrenheit
double Temp_Convertion::kelvin_to_fahrenheit(double kelvin)
{
    double result = kelvin * 9.0 / 5.0 - 459.67;
    return std::round(result * 10) / 10; // Round to 1 decimal place
}
