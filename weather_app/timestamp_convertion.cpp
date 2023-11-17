#include "timestamp_convertion.h"

timestamp_convertion::timestamp_convertion(QObject *parent)
    : QObject{parent}
{

}

// Converts timestamp to time
QString timestamp_convertion::timestamp_to_time(const QString &timestamp)
{
    return timestamp.mid(11, 5);
}

// Converts timestamp to date
QString timestamp_convertion::timestamp_to_date(const QString &timestamp)
{
    return timestamp.mid(8, 2) + "-" + timestamp.mid(5, 2);
}
