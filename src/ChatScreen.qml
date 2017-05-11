import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3

Page {

  RowLayout {
    id: chatLayout
    anchors.fill: parent
    spacing: 0

    Frame {
      id: messageFrame
      Layout.fillWidth: true
      Layout.fillHeight: true

      Rectangle { // TODO
        anchors.fill: parent
        color: "blue"
      }
    }

    Frame {
      id: participantFrame
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
