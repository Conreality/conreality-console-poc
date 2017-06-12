/* This is free and unencumbered software released into the public domain. */

#pragma once

#include <QQuickImageProvider>
#include <QSqlQuery>
#include <QString>
#include <QVariant>

class ImageProvider : public QQuickImageProvider {
public:
  explicit ImageProvider();

  virtual ~ImageProvider() = default;

  virtual QVariant parseID(const QString& /*id*/) const = 0;

  virtual QPixmap makeEmpty(const QSize& /*size*/) const = 0;

  virtual QPixmap makeEmpty(const QVariant& /*key*/) const = 0;

  virtual QPixmap loadFromQuery(const QSqlQuery& /*query*/) const = 0;

protected:
  QPixmap requestPixmap(const QString& id, QSize* size, const QSize& requestedSize) override;

  const QSqlQuery& query() const {
    return _query;
  }

  QSqlQuery& query() {
    return _query;
  }

private:
  QSqlQuery _query;
};
