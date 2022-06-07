#include "ValuesFromC.h"

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include <QQmlContext>
#include <QQmlEngine>
#include <QtQuick>
#include <QTimer>

int main(int argc, char* argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    ValuesFromC valueC;
    valueC.setName("Click lef and right button on square");
    qmlRegisterSingletonType<ValuesFromC>("pl.nstrefa.avrkwiat", 1, 0, "ValueC",
                                     [&](QQmlEngine *, QJSEngine *) -> QObject * {
        return &valueC;
    });

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(
        &engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject* obj, const QUrl& objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);

    engine.addImportPath(":/qml");
    engine.addImportPath(":/qml/imports");
    engine.addImportPath(":/qml/asset_imports");
    engine.load(url);

    /// SLOT use, register in App.qml
    QObject *firstRootItem = engine.rootObjects().first();
    QObject::connect(firstRootItem, SIGNAL(buttonClicked(QString)), &valueC, SLOT(onButtonClicked(QString)));
    QObject::connect(firstRootItem, SIGNAL(buttonClicked2(QString)), &valueC, SLOT(onButtonClicked2(QString)));

    // Update the Role from C++ after 3 seconds.
//    QTimer* timer = new QTimer(&app);
//    timer->start(3000);
//    QObject::connect(timer, &QTimer::timeout, &user, &User::nameChanged);

    return app.exec();
}
