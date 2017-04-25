import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

ApplicationWindow {
  visible: true
  width: 1024
  height: 768
  title: qsTr("Conreality Console")

  SwipeView {
    id: swipeView
    anchors.fill: parent
    currentIndex: tabBar.currentIndex

    Page {
      Label {
        text: qsTr("Home")
        anchors.centerIn: parent
      }
    }

    Page {
      Label {
        text: qsTr("Chat")
        anchors.centerIn: parent
      }
    }

    Page {
      Label {
        text: qsTr("Scene")
        anchors.centerIn: parent
      }
    }

    Page {
      Label {
        text: qsTr("Map")
        anchors.centerIn: parent
      }
    }
  }

  footer: TabBar {
    id: tabBar
    currentIndex: swipeView.currentIndex
    TabButton {
      text: qsTr("Home")
    }
    TabButton {
      text: qsTr("Chat")
    }
    TabButton {
      text: qsTr("Scene")
    }
    TabButton {
      text: qsTr("Map")
    }
  }
}
