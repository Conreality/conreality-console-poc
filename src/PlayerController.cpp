/* This is free and unencumbered software released into the public domain. */

#include "PlayerController.h"

#include <QtGlobal> /* for qDebug(), qFatal(), qUtf8Printable() */
#include <QSqlError>
#include <QSqlQuery>
#include <QVariant>

PlayerController::PlayerController(QObject* const parent)
  : TableModel("conreality.player_object", parent) {
  select();
}
