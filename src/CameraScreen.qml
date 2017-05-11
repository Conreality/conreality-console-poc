import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3

Page {

  RowLayout {
    id: cameraLayout
    anchors.fill: parent
    spacing: 0

    Frame {
      id: imageFrame
      Layout.fillWidth: true
      Layout.fillHeight: true

      BusyIndicator {
        running: true // TODO
        anchors.centerIn: parent
      }
    }

    Frame {
      id: feedFrame
      Layout.minimumWidth: 160
      Layout.preferredWidth: parent.width * 0.25
      Layout.fillHeight: true

      Rectangle { // TODO
        anchors.fill: parent
        color: "red"
      }
    }
  }
}
