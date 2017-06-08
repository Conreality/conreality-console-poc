/* This is free and unencumbered software released into the public domain. */

#pragma once

#include "TableModel.h"

class CameraController final : public TableModel {
  Q_OBJECT

public:
  explicit CameraController(QObject* parent = nullptr)
    : TableModel("public.object_camera", parent) {}

signals:

public slots:
};
