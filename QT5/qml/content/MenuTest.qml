import QtQuick 2.0
import Onlygui5 1.0

Rectangle {
    id: main_menu

    width: 100; height: 90
    color: "green"



    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: {
            if (mouse.button == Qt.RightButton){
                parent.color = 'blue';
                Values.nameValues = "blue"
                //send signal to cpp slot
                window.buttonClicked("Change on Blue")

            }
            else{
                parent.color = 'red';
                Values.nameValues = "red"
                //send signal to cpp slot
                window.buttonClicked("Change on Red")
            }
        }
    }
}

