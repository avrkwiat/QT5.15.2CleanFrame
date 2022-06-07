# QT5.15.2CleanFrame
Clear project Qt 5.15.2 with singelton, signal and slots connected to CPP
1) All values declarate in qml\imports\Onlygui5\Values.qml
2) All signal declarate in qml\content\App.qml
    signal buttonClicked(string str)
    signal buttonClicked2(string str) etc.
3) Singelton Values are declarate in sec\main.cpp linke pl.nstrefa.avrkiwat
    qmlRegisterSingletonType<ValuesFromC>("pl.nstrefa.avrkwiat", 1, 0, "ValueC",
                                     [&](QQmlEngine *, QJSEngine *) -> QObject * {
        return &valueC;
    });
4) Example slot are in qml\content\MenuTest.qml  
          onClicked: {
            //send signal to cpp slot
            window.buttonClicked2("Click Me")
        }
