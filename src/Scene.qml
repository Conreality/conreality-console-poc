import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3
import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Input 2.0
import Qt3D.Logic 2.0
import Qt3D.Extras 2.0
import QtQuick.Scene3D 2.0

Rectangle {
  id: scene
  anchors.fill: parent
  anchors.margins: 0
  color: "darkRed" // TODO

  transform: Rotation {
    id: sceneRotation
    axis.x: 1
    axis.y: 0
    axis.z: 0
    origin.x: scene.width / 2
    origin.y: scene.height / 2
  }

  Scene3D {
    id: scene3d
    anchors.fill: parent
    anchors.margins: 10
    focus: true
    aspects: ["input", "logic"]
    cameraAspectRatioMode: Scene3D.AutomaticAspectRatio

    Entity {
      id: sceneRoot

      Camera {
        id: camera
        projectionType: CameraLens.PerspectiveProjection
        fieldOfView: 45
        //aspectRatio: 16/9
        nearPlane : 0.1
        farPlane : 1000.0
        position: Qt.vector3d( 0.0, 0.0, 40.0 )
        upVector: Qt.vector3d( 0.0, 1.0, 0.0 )
        viewCenter: Qt.vector3d( 0.0, 0.0, 0.0 )
      }

      FirstPersonCameraController {
        camera: camera
      }

      components: [
        RenderSettings {
          activeFrameGraph: ForwardRenderer {
            camera: camera
            clearColor: "transparent"
          }
        },
        InputSettings {}
      ]
    }
  }
}
