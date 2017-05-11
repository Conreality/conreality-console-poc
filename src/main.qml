import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3
import Qt.labs.platform 1.0 as Labs

ApplicationWindow {
  id: window
  visible: true
  width: 1280
  height: 768
  title: qsTr("Conreality Console")

  Labs.MenuBar {
    id: menuBar

    Labs.Menu {
      id: fileMenu
      title: qsTr("File")

      Labs.MenuItem {
        text: qsTr("Quit")
        shortcut: StandardKey.Quit
        onTriggered: Qt.quit()
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
        onTriggered: aboutDialog.open()
      }
    }
  }

/*
  header: ToolBar {
    //Material.foreground: "white"

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
*/

  RowLayout {
    anchors.fill: parent
    spacing: 0

    Frame {
      id: lhs
      anchors.left: parent.left
      anchors.top: parent.top
      anchors.bottom: parent.bottom
      width: 72

      ButtonGroup {
        buttons: lhsColumn.children
        onClicked: {
          //console.log("clicked:", ) // TODO
        }
      }

      ColumnLayout {
        id: lhsColumn
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter

        NavButton {
          icon: "qrc:/icons/google/ic_dashboard_white_48px.svg"
          text: qsTr("Home")
          onClicked: rhs.currentIndex = 0
        }

        NavButton {
          icon: "qrc:/icons/google/ic_chat_white_48px.svg"
          text: qsTr("Chat")
          onClicked: rhs.currentIndex = 1
        }

        NavButton {
          icon: "qrc:/icons/google/ic_settings_white_48px.svg"
          text: qsTr("Database")
          onClicked: rhs.currentIndex = 2
        }

        NavButton {
          icon: "qrc:/icons/google/ic_map_white_48px.svg"
          text: qsTr("Map")
          onClicked: rhs.currentIndex = 3
        }

        NavButton {
          icon: "qrc:/icons/google/ic_3d_rotation_white_48px.svg"
          text: qsTr("Scene")
          onClicked: rhs.currentIndex = 4
        }
      }
    }

    StackLayout {
      id: rhs
      anchors.left: lhs.right
      anchors.right: parent.right
      anchors.top: parent.top
      anchors.bottom: parent.bottom
      currentIndex: 4

      HomeScreen {
        id: homeScreen
      }

      ChatScreen {
        id: chatScreen
      }

      DatabaseScreen {
        id: databaseScreen
      }

      MapScreen {
        id: mapScreen
      }

      // FIXME: flickering?
      // See: https://bugreports.qt.io/browse/QTBUG-47992
      // See: https://bugreports.qt.io/browse/QTBUG-53433
      SceneScreen {
        id: sceneScreen
      }
    }
  }

  AboutDialog {
    id: aboutDialog
  }
}
