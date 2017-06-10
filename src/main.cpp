/* This is free and unencumbered software released into the public domain. */

#include <QtGlobal> /* for qDebug(), qFatal(), qUtf8Printable() */
#include <QApplication>
#include <QProcessEnvironment>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QSqlDatabase>
#include <QSqlDriver>
#include <QSqlError>
#include <QSqlQuery>

#include "CameraController.h"
#include "ChatController.h"
#include "EventController.h"
#include "ImageProvider.h"
#include "PlayerController.h"

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
  app.connect(&app, &QApplication::aboutToQuit, [&db] {
    db.driver()->unsubscribeFromNotification("message");
    db.driver()->unsubscribeFromNotification("event");
    execute_or_die("SELECT public.session_terminate()");
  });

  QQmlApplicationEngine engine;
  auto rootContext = engine.rootContext();

  engine.addImageProvider("binary", new ImageProvider);

  CameraController cameras;
  rootContext->setContextProperty("cameras", &cameras);

  ChatController chat;
  rootContext->setContextProperty("chat", &chat);

  EventController events;
  rootContext->setContextProperty("events", &events);

  PlayerController players;
  rootContext->setContextProperty("players", &players);

  app.connect(db.driver(),
    static_cast<void(QSqlDriver::*)(const QString&, QSqlDriver::NotificationSource, const QVariant&)>(&QSqlDriver::notification),
    [&](const QString& name, QSqlDriver::NotificationSource /*source*/, const QVariant& payload) {

    qDebug("NOTIFY %s, %s", qUtf8Printable(name), qUtf8Printable(payload.toString())); // DEBUG

    if (name.compare("event") == 0) {
      events.refresh();
      return;
    }

    if (name.compare("message") == 0) {
      chat.refresh();
      return;
    }
  });
  db.driver()->subscribeToNotification("event");
  db.driver()->subscribeToNotification("message");

  engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
  if (engine.rootObjects().isEmpty()) {
    return -1;
  }

  return app.exec();
}
