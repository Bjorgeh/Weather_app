#include "temp_convertion.h"
#include "timestamp_convertion.h"
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

    const QUrl url(u"qrc:/weather_app/Main.qml"_qs);

    //Makes objects from c++ class available in QML
    engine.rootContext()->setContextProperty("convertion", &Convertion);
    engine.rootContext()->setContextProperty("timeConvertion", &timestamp_convertion);

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
