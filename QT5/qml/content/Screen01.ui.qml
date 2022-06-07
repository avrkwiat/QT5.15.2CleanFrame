
/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick3D 1.15
import Onlygui5 1.0
import Quick3DAssets.Cube 1.0
import QtQuick.Timeline 1.0

Rectangle {
    id: mainRectangle
    width: Constants.width
    height: Constants.height

    color: Constants.backgroundColor

    MenuTest {}
    MenuTest2 {
        y: 100
    }
    Text {
        text: Values.nameValues

        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 100
        anchors.topMargin: 0
        font.family: Constants.font.family
    }

    View3D {
        id: view3D
        anchors.fill: parent

        environment: sceneEnvironment

        SceneEnvironment {
            id: sceneEnvironment
            antialiasingMode: SceneEnvironment.MSAA
            antialiasingQuality: SceneEnvironment.High
        }

        Node {
            id: scene
            DirectionalLight {
                id: directionalLight
            }

            PerspectiveCamera {
                id: sceneCamera
                z: 350
            }

            //            Model {
            //                id: cubeModel
            //                eulerRotation.y: 45
            //                eulerRotation.x: 30
            //                materials: cubeMaterial
            //                source: "#Cube"
            //                DefaultMaterial {
            //                    id: cubeMaterial
            //                    diffuseColor: "#4aee45"
            //                }
            //            }
        }

        Cube {
            id: cube
            scale.x: 1
            eulerRotation.z: -0.00001
            eulerRotation.y: 41.88859
            eulerRotation.x: 0
        }
    }
    Timeline {
        id: timeline
        animations: [
            TimelineAnimation {
                id: timelineAnimation
                duration: 1000
                running: true
                loops: -1
                to: 1000
                from: 0
            }
        ]
        startFrame: 0
        endFrame: 1000
        enabled: true

        KeyframeGroup {
            target: cube
            property: "scale.x"
            Keyframe {
                frame: 0
                value: 1
            }

            Keyframe {
                frame: 374
                value: 0.5
            }

            Keyframe {
                frame: 1000
                value: 1
            }
        }
    }
}
