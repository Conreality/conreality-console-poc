/* This is free and unencumbered software released into the public domain. */

#include "CameraController.h"

#include <QtGlobal> /* for qDebug(), qFatal(), qUtf8Printable() */
#include <QSqlError>
#include <QSqlQuery>
#include <QVariant>

CameraController::CameraController(QObject* const parent)
  : TableModel("conreality.camera_object", parent) {
  select();
}
