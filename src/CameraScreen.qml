import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3

Page {

  RowLayout {
    anchors.fill: parent
    spacing: 0

    Frame {
      Layout.fillWidth: true
      Layout.fillHeight: true

      // TODO: remove margins
      Image {
        id: cameraFrame
        anchors.fill: parent
        //source: undefined
        fillMode: Image.PreserveAspectFit
        visible: false

        onStatusChanged: {
          loadingIndicator.running = (this.status === Image.Loading)
        }
      }

      BusyIndicator {
        id: loadingIndicator
        anchors.centerIn: parent
        running: false
      }
    }

    Frame {
      Layout.minimumWidth: 240
      Layout.preferredWidth: parent.width * 0.20
      Layout.fillHeight: true

      CameraListView {
        anchors.fill: parent

        onSelectionChanged: {
          if (uuid) {
            console.log("Loading camera frame: " + uuid) // DEBUG
            cameraFrame.visible = true
            cameraFrame.source = "image://camera/" + uuid
          }
          else {
            cameraFrame.visible = false
            //cameraFrame.source = null
          }
        }
      }
    }
  }
}
