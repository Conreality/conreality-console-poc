import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

Page {

  RowLayout {
    anchors.fill: parent
    spacing: 0

    Frame {
      Layout.fillWidth: true
      Layout.fillHeight: true

      Rectangle { // TODO
        anchors.fill: parent
        color: "blue"
      }
    }

    Frame {
      Layout.minimumWidth: 160
      Layout.preferredWidth: parent.width * 0.20
      Layout.fillHeight: true

      PlayerListView {
        anchors.fill: parent

        onSelectionChanged: {
          if (uuid) {
            console.log("Loading player form: " + uuid) // DEBUG
            //playerForm.visible = true
            //playerForm.source = "image://binary/" + uuid
          }
          else {
            //playerForm.visible = false
            //playerForm.source = null
          }
        }
      }
    }
  }
}
