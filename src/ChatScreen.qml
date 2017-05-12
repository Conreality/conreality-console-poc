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

        ChatMessageView {
          Layout.fillWidth: true
          Layout.fillHeight: true
        }

        ChatInputForm {
          Layout.fillWidth: true
          Layout.minimumHeight: 80   // TODO: one line of text
          Layout.preferredHeight: 80 // TODO: two lines of text
          Layout.maximumHeight: 80   // TODO: three lines of text
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
