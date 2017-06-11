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

      BusyIndicator {
        running: true // TODO
        anchors.centerIn: parent
      }
    }

    Frame {
      Layout.minimumWidth: 240
      Layout.preferredWidth: parent.width * 0.20
      Layout.fillHeight: true

      CameraListView {
        anchors.fill: parent
      }
    }
  }
}
