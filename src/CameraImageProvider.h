/* This is free and unencumbered software released into the public domain. */

#pragma once

#include "ImageProvider.h"

class CameraImageProvider final : public ImageProvider {
public:
  explicit CameraImageProvider();

  QVariant parseID(const QString& id) const override;

  QPixmap makeEmpty(const QSize& size) const override;

  QPixmap makeEmpty(const QVariant& key) const override;

  QPixmap loadFromQuery(const QSqlQuery& query) const override;
};
