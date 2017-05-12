import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3

ListView {
  id: listView

  displayMarginBeginning: 40
  displayMarginEnd: 40
  verticalLayoutDirection: ListView.BottomToTop
  spacing: 12

  model: ListModel { // newest messages first
    id: messageList
    ListElement { body: "Pong"; timestamp: 1494593814 }
    //ListElement { from: "Bob"; body: "Ping"; timestamp: 1494593814 }
    ListElement { from: "Alice"; body: "Ping"; timestamp: 1494593814 }
  }

  delegate: Column {
    readonly property bool sentByMe: model.from === undefined

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
        width: height
        height: parent.height
        visible: !sentByMe
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

          text: model.body
          color: sentByMe ? "black" : "white"
        }
      }
    }

    Label {
      anchors.right: sentByMe ? parent.right : undefined
      text: Qt.formatDateTime(new Date(model.timestamp * 1000), "d MMM hh:mm")
      color: "lightgrey"
    }
  }

  ScrollBar.vertical: ScrollBar { }
}
