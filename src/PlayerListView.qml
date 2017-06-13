import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

ListView {
  signal selectionChanged(string uuid)

  anchors.fill: parent
  topMargin: 0
  leftMargin: 0
  bottomMargin: 0
  rightMargin: 0
  spacing: 4

  focus: true
  //keyNavigationEnabled: true // https://bugreports.qt.io/browse/QTBUG-57621
  highlightFollowsCurrentItem: true

  model: players

  delegate: ItemDelegate {
    width: ListView.view.width - ListView.view.leftMargin - ListView.view.rightMargin
    height: avatar.implicitHeight
    leftPadding: avatar.implicitWidth + 16

    text: model.nick

    Image {
      id: avatar
      width: 48; height: 48
      sourceSize: Qt.size(48, 48)
      source: model.avatar ? "image://binary/" + model.avatar : "qrc:/icons/google/ic_face_white_48px.svg"
    }

    highlighted: ListView.isCurrentItem
    onClicked: {
      ListView.view.currentIndex = index
      ListView.view.forceActiveFocus()
      ListView.view.selectionChanged(model.uuid)
    }
  }

  ScrollIndicator.vertical: ScrollIndicator { }

  Component.onCompleted: currentIndex = -1
}
