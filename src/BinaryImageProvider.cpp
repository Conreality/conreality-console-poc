/* This is free and unencumbered software released into the public domain. */

#include "BinaryImageProvider.h"

#include <QtGlobal> /* for qDebug(), qFatal(), qUtf8Printable() */
#include <QSqlError>
#include <QSqlQuery>
#include <QVariant>

BinaryImageProvider::BinaryImageProvider()
  : QQuickImageProvider{QQmlImageProviderBase::Pixmap} {

  _query.setForwardOnly(true);
  _query.prepare("SELECT data, type FROM public.binary WHERE id = ? LIMIT 1");
}

QPixmap
BinaryImageProvider::requestPixmap(const QString& id,
                                   QSize* const size,
                                   const QSize& requestedSize) {

  _query.bindValue(0, id.toInt());
  _query.exec();

  const auto error = _query.lastError();
  if (error.isValid()) {
    qFatal("PostgreSQL: %s.", qUtf8Printable(error.text()));
  }

  QPixmap original, result;

  if (_query.first()) {
    original.loadFromData(_query.value(0).toByteArray(),
      qUtf8Printable(_query.value(1).toString()));
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

  _query.finish();

  return result;
}
