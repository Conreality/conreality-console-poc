import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3

Pane {
  // TODO: remove padding

  RowLayout {
    anchors.fill: parent

    Flickable {
      Layout.fillWidth: true
      Layout.fillHeight: true

      TextArea.flickable: TextArea {
        id: messageField

        placeholderText: qsTr("Type your message here")
        wrapMode: TextArea.Wrap
        focus: true
      }

      ScrollBar.vertical: ScrollBar { }
    }

    Button {
      id: sendButton
      Layout.minimumWidth: 80
      Layout.fillHeight: true

      text: qsTr("Send Message")
      enabled: messageField.length > 0

      onClicked: {
        chat.sendMessage(messageField.text)
        messageField.clear()
        messageField.forceActiveFocus()
      }
    }

  }

  onVisibleChanged: {
    if (visible) {
      messageField.forceActiveFocus()
    }
  }
}
