/* This is free and unencumbered software released into the public domain. */

#include "ChatController.h"

#include <QtGlobal> /* for qDebug(), qFatal(), qUtf8Printable() */
#include <QSqlError>
#include <QSqlQuery>
#include <QVariant>

ChatController::ChatController(QObject* const parent)
  : TableModel("public.message_with_avatar", parent) {
  setSort(0, Qt::DescendingOrder);
  select();
}

void
ChatController::sendMessage(const QString& text) {
  qDebug("chat.sendMessage(\"%s\")", qUtf8Printable(text)); // DEBUG

  QSqlQuery sql_query;
  sql_query.prepare("SELECT public.message_send(session_user, ?)");
  sql_query.bindValue(0, text);
  sql_query.exec();
  const auto error = sql_query.lastError();
  if (error.isValid()) {
    qFatal("PostgreSQL: %s.", qUtf8Printable(error.text()));
  }
}
