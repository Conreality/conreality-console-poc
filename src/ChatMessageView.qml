import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3

ListView {
  id: listView

  displayMarginBeginning: 40
  displayMarginEnd: 40
  verticalLayoutDirection: ListView.BottomToTop
  spacing: 12

  model: chat

  Component.onCompleted: positionViewAtBeginning()
  onCountChanged: positionViewAtBeginning()

  delegate: Column {
    readonly property bool sentByMe: model.sender === "00000000-0000-0000-0000-000000000000" // FIXME

    anchors.right: sentByMe ? parent.right : undefined
    spacing: 6

    Row {
      id: messageRow

      anchors.right: sentByMe ? parent.right : undefined
      spacing: 6

      Image {
        id: avatar
        source: "qrc:/icons/google/ic_face_white_48px.svg" // TODO: use player avatar
        sourceSize: Qt.size(48, 48)
        width: 48 //height
        height: 48 //parent.height
        visible: !sentByMe

        //ToolTip.visible: hovered
        //ToolTip.delay: 1000
        //ToolTip.timeout: 2500
        //ToolTip.text: model.sender
      }

      Rectangle {
        width: Math.min(messageText.implicitWidth + 24,
                 listView.width - (sentByMe ? 0 : avatar.width + messageRow.spacing))
        height: messageText.implicitHeight + 24
        color: sentByMe ? "lightgrey" : "steelblue"

        Label {
          id: messageText

          anchors.fill: parent
          anchors.margins: 12
          wrapMode: Label.Wrap

          text: model.text
          color: sentByMe ? "black" : "white"
        }
      }
    }

    Label {
      anchors.right: sentByMe ? parent.right : undefined
      text: Qt.formatDateTime(model.timestamp, "d MMM HH:mm:ss")
      color: "lightgrey"

      //ToolTip.visible: hovered
      //ToolTip.delay: 1000
      //ToolTip.timeout: 2500
      //ToolTip.text: model.timestamp // ISO-8601 format
    }
  }

  ScrollBar.vertical: ScrollBar { }
}
