import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3

Page {

  RowLayout {
    anchors.fill: parent
    spacing: 0

    Frame {
      Layout.fillWidth: true
      Layout.fillHeight: true

      ColumnLayout {
        anchors.fill: parent

        ChatMessageView {
          id: messageView

          Layout.fillWidth: true
          Layout.fillHeight: true
          Layout.margins: inputPane.leftPadding
        }

        ChatInputPane {
          id: inputPane

          Layout.fillWidth: true
          Layout.minimumHeight: 80   // TODO: one line of text
          Layout.preferredHeight: 80 // TODO: two lines of text
          Layout.maximumHeight: 80   // TODO: three lines of text
        }
      }
    }

    Frame {
      Layout.minimumWidth: 160
      Layout.preferredWidth: parent.width * 0.20
      Layout.fillHeight: true

      PlayerListView {
        id: listView

        anchors.fill: parent
      }
    }
  }
}
