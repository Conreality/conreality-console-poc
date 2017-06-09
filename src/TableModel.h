/* This is free and unencumbered software released into the public domain. */

#pragma once

#include <QSqlDatabase>
#include <QSqlTableModel>

class TableModel : public QSqlTableModel {
  Q_OBJECT

public:
  explicit TableModel(QObject* parent = nullptr,
                      QSqlDatabase db = QSqlDatabase())
    : QSqlTableModel(parent, db) {}

  explicit TableModel(const char* tableName,
                      QObject* parent = nullptr,
                      QSqlDatabase db = QSqlDatabase());

  void generateRoleNames();

  QVariant data(const QModelIndex& index, int role) const override;

  QHash<int, QByteArray> roleNames() const override {
    return _roleNames;
  }

  void refresh();

private:
  QHash<int, QByteArray> _roleNames;
};
