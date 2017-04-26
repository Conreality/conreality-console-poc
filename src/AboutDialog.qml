import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3

Dialog {
  modal: true
  focus: true
  title: "About"
  x: (window.width - width) / 2
  y: window.height / 6
  width: Math.min(window.width, window.height) / 3 * 2
  contentHeight: aboutColumn.height

  Column {
    id: aboutColumn
    spacing: 20

    Label {
      width: aboutDialog.availableWidth
      wrapMode: Label.Wrap
      font.pixelSize: 12
      text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
    }

    Label {
      width: aboutDialog.availableWidth
      wrapMode: Label.Wrap
      font.pixelSize: 12
      text: "Quisque quis ipsum vestibulum, euismod ex vel, suscipit augue. "
          + "Pellentesque habitant morbi tristique senectus et netus et "
          + "malesuada fames ac turpis egestas."
    }
  }
}
