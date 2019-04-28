#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "commandsmodel.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    CommandsModel model;

    engine.rootContext()->setContextProperty("Model",&model);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
