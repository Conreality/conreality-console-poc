import QtQuick 2.7
import QtQuick.Controls 2.1
import QtLocation 5.8
import QtPositioning 5.8

Page {

  // See: https://doc.qt.io/qt-5/location-plugin-osm.html
  Plugin {
    id: osmPlugin
    name: "osm"
    PluginParameter {
      name: "osm.useragent"
      value: "Conreality Console"
    }
  }

  // See: https://doc.qt.io/qt-5/qml-qtlocation-map.html
  Map {
    id: map
    anchors.fill: parent
    plugin: osmPlugin
    center: QtPositioning.coordinate(59.91, 10.75) // Oslo
    zoomLevel: 16
    //minimumZoomLevel: 12
    copyrightsVisible: false
  }

  // See: https://doc.qt.io/qt-5/location-positioning-qml.html#positionsource
  // See: https://doc.qt.io/qt-5/qml-qtpositioning-positionsource.html
  // See: https://doc.qt.io/qt-5/qml-qtpositioning-position.html
  PositionSource {
    active: true

    onPositionChanged: {
      // Center the map on the current position:
      map.center = position.coordinate
    }
  }
}
