import QtQuick 2.7
import QtQuick.Controls 2.1
//import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

Page {

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
}
