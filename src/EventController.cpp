/* This is free and unencumbered software released into the public domain. */

#include "EventController.h"

#include <QtGlobal> /* for qDebug(), qFatal(), qUtf8Printable() */
#include <QSqlError>
#include <QSqlQuery>
#include <QVariant>

EventController::EventController(QObject* const parent)
  : TableModel("public.event", parent) {
  setSort(0, Qt::DescendingOrder);
  select();
}
