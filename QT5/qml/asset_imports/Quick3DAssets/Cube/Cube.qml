import QtQuick 2.15
import QtQuick3D 1.15

Node {
    id: rootNode

    Model {
        id: cube
        eulerRotation.x: -90
        scale.x: 100
        scale.y: 100
        scale.z: 100
        source: "meshes/cube.mesh"

        DefaultMaterial {
            id: m_cube_material
            diffuseColor: "#ffcccccc"
        }
        materials: [
            m_cube_material
        ]
    }
}
