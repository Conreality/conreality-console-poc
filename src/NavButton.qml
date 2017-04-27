import QtQuick 2.7
import QtQuick.Controls 2.1
//import QtQuick.Layouts 1.3

Button {
  property alias icon: image.source

  checked: false

  contentItem: Image {
    id: image
    sourceSize: Qt.size(48, 48)
    width: 48; height: 48
  }

  onClicked: {}
}
