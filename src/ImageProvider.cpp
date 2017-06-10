/* This is free and unencumbered software released into the public domain. */

#include "ImageProvider.h"

#include <QtGlobal> /* for qDebug(), qFatal(), qUtf8Printable() */
#include <QSqlError>
#include <QSqlQuery>
#include <QVariant>

QPixmap
ImageProvider::requestPixmap(const QString& id,
                             QSize* const size,
                             const QSize& requestedSize) {

  QSqlQuery sql_query;
  sql_query.prepare("SELECT data, type FROM public.binary WHERE id = ? LIMIT 1");
  sql_query.bindValue(0, id.toInt());
  sql_query.exec();

  const auto error = sql_query.lastError();
  if (error.isValid()) {
    qFatal("PostgreSQL: %s.", qUtf8Printable(error.text()));
  }

  QPixmap original, result;

  if (sql_query.next()) {
    original.loadFromData(sql_query.value(0).toByteArray(),
      qUtf8Printable(sql_query.value(1).toString()));
  }
  else {
    original = QPixmap(requestedSize.width(), requestedSize.height());
    original.fill(QColor("white").rgba());
  }

  if (size) *size = original.size();

  if (requestedSize.isValid()) {
    result = original.scaled(requestedSize.width(), requestedSize.height(),
      Qt::KeepAspectRatio, Qt::SmoothTransformation);
  }
  else {
    result = original;
  }

  return result;
}
