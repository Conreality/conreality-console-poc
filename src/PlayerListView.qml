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
    text: model.nick
    width: listView.width - listView.leftMargin - listView.rightMargin
    height: avatar.implicitHeight
    leftPadding: avatar.implicitWidth + 16

    Image {
      id: avatar
      width: 48; height: 48
      sourceSize: Qt.size(48, 48)
      source: model.avatar ? "image://binary/" + model.avatar : "qrc:/icons/google/ic_face_white_48px.svg"
    }
  }

  ScrollIndicator.vertical: ScrollIndicator { }
}
