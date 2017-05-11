import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3

Page {

  ColumnLayout {
    id: homeLayout
    anchors.fill: parent
    spacing: 0

    Frame {
      id: dashboardFrame
      Layout.fillWidth: true
      Layout.fillHeight: true

      Rectangle { // TODO
        anchors.fill: parent
        color: "blue"
      }
    }

    Frame {
      id: eventFrame
      Layout.fillWidth: true
      Layout.minimumHeight: 160
      Layout.preferredHeight: parent.height * 0.33

      Rectangle { // TODO
        anchors.fill: parent
        color: "red"
      }
    }
  }
}
