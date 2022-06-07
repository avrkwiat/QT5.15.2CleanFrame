import QtQuick 2.0
import Onlygui5 1.0

Rectangle {
    id: main_menu2

    width: 100; height: 90
    color: "red"

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: {
            parent.color = 'green';
            Values.nameValues = "You sand click massage to buttonClicked2"
            //send signal to cpp slot
            window.buttonClicked2("Click Me")
        }
    }
}
