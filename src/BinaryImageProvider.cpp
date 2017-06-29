/* This is free and unencumbered software released into the public domain. */

#include "BinaryImageProvider.h"

#include <QtGlobal> /* for qDebug(), qFatal(), qUtf8Printable() */
#include <QSqlError>
#include <QSqlQuery>
#include <QVariant>

BinaryImageProvider::BinaryImageProvider()
  : ImageProvider{} {

  query().prepare("SELECT data, type FROM conreality.binary WHERE id = ? LIMIT 1");
}

QVariant
BinaryImageProvider::parseID(const QString& id) const {
  return id.toInt();
}

QPixmap
BinaryImageProvider::makeEmpty(const QSize& size) const {
  QPixmap result{size.width(), size.height()};
  result.fill(QColor("white").rgba());
  return result;
}

QPixmap
BinaryImageProvider::makeEmpty(const QVariant& /*key*/) const {
  return {};
}

QPixmap
BinaryImageProvider::loadFromQuery(const QSqlQuery& query) const {
  QPixmap result;
  const auto data = query.value(0);
  if (!data.isNull() && data.isValid()) {
    result.loadFromData(data.toByteArray(),
      qUtf8Printable(query.value(1).toString()));
  }
  return result;
}
