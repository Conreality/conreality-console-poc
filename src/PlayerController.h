/* This is free and unencumbered software released into the public domain. */

#pragma once

#include "TableModel.h"

class PlayerController final : public TableModel {
  Q_OBJECT

public:
  explicit PlayerController(QObject* parent = nullptr);

signals:

public slots:
};
