/* This is free and unencumbered software released into the public domain. */

#include <QtGlobal> /* for qUtf8Printable() */
#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QSqlDatabase>
#include <QSqlError>

#include "TableModel.h"

int
main(int argc, char* argv[]) {
  QApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

  QApplication app(argc, argv);

  QSqlDatabase db = QSqlDatabase::addDatabase("QPSQL");
  db.setHostName("localhost");
  db.setPort(5432);
  if (!db.open()) {
    const auto error = db.lastError();
    qFatal("PostgreSQL: %s.", qUtf8Printable(error.text()));
    return -1;
  }

  QQmlApplicationEngine engine;
  auto rootContext = engine.rootContext();

  TableModel playerModel{"player"};
  rootContext->setContextProperty("playerModel", &playerModel);

  engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
  if (engine.rootObjects().isEmpty()) {
    return -1;
  }

  return app.exec();
}
