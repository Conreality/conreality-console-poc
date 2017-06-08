/* This is free and unencumbered software released into the public domain. */

#pragma once

#include <QObject>

class ChatController final : public QObject {
  Q_OBJECT

public:
  explicit ChatController(QObject* parent = nullptr)
    : QObject(parent) {}

signals:

public slots:
  void sendMessage(const QString& text);
};
