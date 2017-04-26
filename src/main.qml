import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0

ApplicationWindow {
  id: window
  visible: true
  width: 1024
  height: 768
  title: qsTr("Conreality Console")
  Material.theme: Material.Dark
  Material.accent: Material.Purple

  header: ToolBar {
    Material.foreground: "white"

    RowLayout {
      spacing: 20
      anchors.fill: parent

      ToolButton {
        onClicked: optionsMenu.open()

        Menu {
          id: optionsMenu
          x: parent.width - width
          transformOrigin: Menu.TopRight

          MenuItem {
            text: "About"
            onTriggered: aboutDialog.open()
          }
        }
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

  SwipeView {
    id: swipeView
    anchors.fill: parent
    currentIndex: tabBar.currentIndex

    HomePage {}
    ChatPage {}
    ScenePage {}
    MapPage {}
  }

  AboutDialog {
    id: aboutDialog
  }
}
