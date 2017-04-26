import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.3
import Qt.labs.platform 1.0 as Labs

ApplicationWindow {
  id: window
  visible: true
  width: 1024
  height: 768
  title: qsTr("Conreality Console")
  Material.theme: Material.Dark
  Material.accent: Material.Purple

  Labs.MenuBar {
    id: menuBar

    Labs.Menu {
      id: fileMenu
      title: qsTr("File")

      Labs.MenuItem {
        text: qsTr("Quit")
      }
    }

    Labs.Menu {
      id: viewMenu
      title: qsTr("&View")

      Labs.MenuItem {
        text: qsTr("Zoom In")
        shortcut: StandardKey.ZoomIn
      }

      Labs.MenuItem {
        text: qsTr("Zoom Out")
        shortcut: StandardKey.ZoomOut
      }
    }

    Labs.Menu {
      id: helpMenu
      title: qsTr("&Help")

      Labs.MenuItem {
        text: qsTr("About")
      }
    }
  }

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
