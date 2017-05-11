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

      ColumnLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle { // TODO
          Layout.fillWidth: true
          Layout.fillHeight: true
          color: "red"
        }

        Rectangle { // TODO
          Layout.fillWidth: true
          Layout.minimumHeight: 80
          Layout.maximumHeight: 80
          Layout.preferredHeight: 80
          color: "green"
        }
      }
    }

    Frame {
      id: participantFrame
      Layout.minimumWidth: 160
      Layout.preferredWidth: parent.width * 0.25
      Layout.fillHeight: true

      Rectangle { // TODO
        anchors.fill: parent
        color: "blue"
      }
    }
  }
}
