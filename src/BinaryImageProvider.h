/* This is free and unencumbered software released into the public domain. */

#pragma once

#include <QQuickImageProvider>

class BinaryImageProvider : public QQuickImageProvider {
public:
  explicit BinaryImageProvider()
    : QQuickImageProvider(QQmlImageProviderBase::Pixmap) {}

  QPixmap requestPixmap(const QString& id, QSize* size, const QSize& requestedSize) override;
};
