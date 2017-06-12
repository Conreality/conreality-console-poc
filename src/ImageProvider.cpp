/* This is free and unencumbered software released into the public domain. */

#include "ImageProvider.h"

#include <QtGlobal> /* for qDebug(), qFatal(), qUtf8Printable() */
#include <QSqlError>
#include <QSqlQuery>
#include <QVariant>

ImageProvider::ImageProvider()
  : QQuickImageProvider{QQmlImageProviderBase::Pixmap} {

  query().setForwardOnly(true);
}

QPixmap
ImageProvider::requestPixmap(const QString& id,
                             QSize* const originalSize,
                             const QSize& requestedSize) {

  // FIXME: this procedure should be reentrant.

  const auto key = parseID(id);

  query().bindValue(0, key);
  query().exec();

  const auto error = query().lastError();
  if (error.isValid()) {
    qFatal("PostgreSQL: %s.", qUtf8Printable(error.text()));
  }

  QPixmap result;

  if (query().isActive() && query().first()) {
    result = loadFromQuery(query());
  }

  if (result.isNull()) {
    result = makeEmpty(key);
  }

  if (result.isNull() && requestedSize.isValid()) {
    result = makeEmpty(requestedSize);
  }

  if (originalSize) *originalSize = result.size();

  if (requestedSize.isValid()) {
    result = result.scaled(
      requestedSize.width(), requestedSize.height(),
      Qt::KeepAspectRatio, Qt::SmoothTransformation);
  }

  query().finish();

  return result;
}
