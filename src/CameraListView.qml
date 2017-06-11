import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

ListView {
  id: listView
  anchors.fill: parent
  topMargin: 0
  leftMargin: 0
  bottomMargin: 0
  rightMargin: 0
  spacing: 4

  model: players
  delegate: ItemDelegate {
    width: listView.width - listView.leftMargin - listView.rightMargin
    height: frame.implicitHeight + label.implicitHeight + 8*3

    Item {
      anchors.fill: parent

      Image {
        id: frame
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 8
        width: 160; height: 160
        sourceSize: Qt.size(160, 160)
        source: model.avatar ? "image://binary/" + model.avatar : "qrc:/icons/google/ic_face_white_48px.svg" // TODO
      }

      Label {
        id: label
        anchors.horizontalCenter: frame.horizontalCenter
        anchors.top: frame.bottom
        anchors.topMargin: 8
        anchors.bottomMargin: 8
        text: model.nick // TODO
      }
    }

    highlighted: ListView.isCurrentItem
    //onClicked: console.log("clicked:", model) // TODO
  }

  ScrollIndicator.vertical: ScrollIndicator { }
}
