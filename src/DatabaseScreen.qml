import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

Page {

  RowLayout {
    id: databaseLayout
    anchors.fill: parent
    spacing: 0

    Frame {
      id: formFrame
      Layout.fillWidth: true
      Layout.fillHeight: true

      Rectangle { // TODO
        anchors.fill: parent
        color: "blue"
      }
    }

    Frame {
      id: listFrame
      Layout.minimumWidth: 160
      Layout.preferredWidth: parent.width * 0.20
      Layout.fillHeight: true

      PlayerListView {
        id: listView
      }
    }
  }
}
