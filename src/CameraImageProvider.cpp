/* This is free and unencumbered software released into the public domain. */

#include "CameraImageProvider.h"

#include <QtGlobal> /* for qDebug(), qFatal(), qUtf8Printable() */
#include <QSqlError>
#include <QSqlQuery>
#include <QVariant>

CameraImageProvider::CameraImageProvider()
  : ImageProvider{} {

  query().prepare("SELECT data FROM public.camera_frame WHERE uuid = ?::uuid LIMIT 1");
}

QVariant
CameraImageProvider::parseID(const QString& id) const {
  return id;
}

QPixmap
CameraImageProvider::makeEmpty(const QSize& size) const {
  QPixmap result{size.width(), size.height()};
  result.fill(QColor("black").rgba());
  return result;
}

QPixmap
CameraImageProvider::makeEmpty(const QVariant& /*key*/) const {
  QPixmap result{640, 480}; // TODO
  result.fill(QColor("black").rgba());
  return result;
}

QPixmap
CameraImageProvider::loadFromQuery(const QSqlQuery& query) const {
  QPixmap result;
  const auto data = query.value(0);
  if (!data.isNull() && data.isValid()) {
    result.loadFromData(data.toByteArray(), "image/png");
  }
  return result;
}
