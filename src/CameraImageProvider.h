/* This is free and unencumbered software released into the public domain. */

#pragma once

#include <QQuickImageProvider>

class CameraImageProvider : public QQuickImageProvider {
public:
  explicit CameraImageProvider()
    : QQuickImageProvider(QQmlImageProviderBase::Pixmap) {}

  QPixmap requestPixmap(const QString& id, QSize* size, const QSize& requestedSize) override;
};
