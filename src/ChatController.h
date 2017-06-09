/* This is free and unencumbered software released into the public domain. */

#pragma once

#include "TableModel.h"

class ChatController final : public TableModel {
  Q_OBJECT

public:
  explicit ChatController(QObject* parent = nullptr);

signals:

public slots:
  void sendMessage(const QString& text);
};
