/* This is free and unencumbered software released into the public domain. */

#include "CameraImageProvider.h"

#include <QtGlobal> /* for qDebug(), qFatal(), qUtf8Printable() */
#include <QSqlError>
#include <QSqlQuery>
#include <QVariant>

QPixmap
CameraImageProvider::requestPixmap(const QString& id,
                                   QSize* const size,
                                   const QSize& requestedSize) {

  QSqlQuery sql_query;
  sql_query.prepare("SELECT data FROM public.camera_frame WHERE uuid = ?::uuid LIMIT 1");
  sql_query.bindValue(0, id);
  sql_query.exec();

  const auto error = sql_query.lastError();
  if (error.isValid()) {
    qFatal("PostgreSQL: %s.", qUtf8Printable(error.text()));
  }

  QPixmap original, result;

  if (sql_query.next()) {
    original.loadFromData(sql_query.value(0).toByteArray(), "image/png");
  }
  else {
    original = QPixmap(requestedSize.width(), requestedSize.height());
    original.fill(QColor("black").rgba());
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
