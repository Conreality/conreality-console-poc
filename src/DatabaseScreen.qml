import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3

Page {

  RowLayout {
    id: databaseLayout
    anchors.fill: parent
    spacing: 0

    Frame {
      id: formFrame
      Layout.fillWidth: true
      Layout.fillHeight: true

      Rectangle { // TODO
        anchors.fill: parent
        color: "blue"
      }
    }

    Frame {
      id: listFrame
      Layout.preferredWidth: 320
      Layout.fillHeight: true

      Rectangle { // TODO
        anchors.fill: parent
        color: "red"
      }
    }
  }

/*
  ListView {
    id: listView
    anchors.fill: parent
    topMargin: 48
    leftMargin: 48
    bottomMargin: 48
    rightMargin: 48
    spacing: 20

    model: ["Alice", "Bob", "Charlie", "Dave"] // TODO
    delegate: ItemDelegate {
      text: modelData
      width: listView.width - listView.leftMargin - listView.rightMargin
      height: avatar.implicitHeight
      leftPadding: avatar.implicitWidth + 16

      Image {
        id: avatar
        source: "qrc:/icons/google/ic_face_white_48px.svg"
        sourceSize: Qt.size(48, 48)
        width: 48; height: 48
        visible: false
      }

      ColorOverlay {
        anchors.fill: avatar
        source: avatar
        color: "#ffffff"
      }
    }
  }
*/
}
