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

        Rectangle { // TODO
          Layout.fillWidth: true
          Layout.fillHeight: true
          color: "red"
        }

        RowLayout {
          Layout.fillWidth: true
          Layout.minimumHeight: 80   // TODO: one line of text
          Layout.preferredHeight: 80 // TODO: two lines of text
          Layout.maximumHeight: 80   // TODO: three lines of text

          Flickable {
            Layout.fillWidth: true
            Layout.fillHeight: true

            TextArea.flickable: TextArea {
              id: messageField
              placeholderText: qsTr("Type your message here")
              wrapMode: TextArea.Wrap
            }

            ScrollBar.vertical: ScrollBar { }
          }

          Button {
            id: sendButton
            Layout.minimumWidth: 80
            Layout.fillHeight: true
            text: qsTr("Send Message")
            enabled: messageField.length > 0
          }
        }
      }
    }

    Frame {
      id: participantFrame
      Layout.minimumWidth: 160
      Layout.preferredWidth: parent.width * 0.20
      Layout.fillHeight: true

      PlayerListView {
        anchors.fill: parent
        id: listView
      }
    }
  }
}
