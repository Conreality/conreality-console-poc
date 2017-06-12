/* This is free and unencumbered software released into the public domain. */

#pragma once

#include <QQuickImageProvider>
#include <QSqlQuery>

class BinaryImageProvider : public QQuickImageProvider {
public:
  explicit BinaryImageProvider();

  QPixmap requestPixmap(const QString& id, QSize* size, const QSize& requestedSize) override;

private:
  QSqlQuery _query;
};
