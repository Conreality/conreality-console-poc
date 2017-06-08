/* This is free and unencumbered software released into the public domain. */

#pragma once

#include "TableModel.h"

class EventController final : public TableModel {
  Q_OBJECT

public:
  explicit EventController(QObject* parent = nullptr)
    : TableModel("public.event", parent) {}

signals:

public slots:
};
