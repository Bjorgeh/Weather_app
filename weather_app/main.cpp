#include "temp_convertion.h"
#include "timestamp_convertion.h"
#include "current_weather.h"

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    //Makes object from Temp_Convertion class available in QML
    Temp_Convertion Convertion;
    //Makes object from timestamp_convertion class available in QML
    timestamp_convertion timestamp_convertion;
    //Makes object from current_weather class available in QML
    current_weather current_w;

    const QUrl url(u"qrc:/weather_app/Main.qml"_qs);

    //Makes objects from c++ class available in QML
    engine.rootContext()->setContextProperty("convertion", &Convertion);
    engine.rootContext()->setContextProperty("timeConvertion", &timestamp_convertion);
    engine.rootContext()->setContextProperty("current_weather",&current_w);

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
