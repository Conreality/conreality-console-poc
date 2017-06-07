/* This is free and unencumbered software released into the public domain. */

#include <QtGlobal> /* for qUtf8Printable() */
#include <QApplication>
#include <QProcessEnvironment>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>

#include "TableModel.h"

static void
execute_or_die(const char* const sql) {
  QSqlQuery sql_query(sql);
  const auto error = sql_query.lastError();
  if (error.isValid()) {
    qFatal("PostgreSQL: %s.", qUtf8Printable(error.text()));
  }
}

int
main(int argc, char* argv[]) {
  QApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

  QApplication app(argc, argv);
  const auto env = QProcessEnvironment::systemEnvironment();

  QSqlDatabase db = QSqlDatabase::addDatabase("QPSQL");
  db.setHostName("localhost");
  db.setPort(5432);
  db.setDatabaseName(env.value("USER", "postgres"));
  if (!db.open("00000000-0000-0000-0000-000000000000", "")) {
    const auto error = db.lastError();
    qFatal("PostgreSQL: %s.", qUtf8Printable(error.text()));
    return -1;
  }

  execute_or_die("SELECT public.session_start()");
  app.connect(&app, &QApplication::aboutToQuit, []{
    execute_or_die("SELECT public.session_terminate()");
  });

  QQmlApplicationEngine engine;
  auto rootContext = engine.rootContext();

  TableModel playerModel{"public.object_player"};
  rootContext->setContextProperty("playerModel", &playerModel);

  engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
  if (engine.rootObjects().isEmpty()) {
    return -1;
  }

  return app.exec();
}
