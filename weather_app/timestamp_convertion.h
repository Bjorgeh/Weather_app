#ifndef TIMESTAMP_CONVERTION_H
#define TIMESTAMP_CONVERTION_H

#include <QObject>

class timestamp_convertion : public QObject
{
    Q_OBJECT
public:
    explicit timestamp_convertion(QObject *parent = nullptr);

    Q_INVOKABLE QString timestamp_to_time(const QString &timestamp);
    Q_INVOKABLE QString timestamp_to_date(const QString &timestamp);

signals:

};

#endif // TIMESTAMP_CONVERTION_H
