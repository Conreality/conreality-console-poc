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
    anchors.fill: parent
    plugin: osmPlugin
    center: QtPositioning.coordinate(59.91, 10.75) // Oslo
    zoomLevel: 16
  }
}
