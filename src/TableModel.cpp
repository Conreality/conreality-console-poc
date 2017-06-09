/* This is free and unencumbered software released into the public domain. */

#include "TableModel.h"

#include <QSqlRecord>

TableModel::TableModel(const char* const tableName,
                       QObject* const parent,
                       QSqlDatabase database)
  : TableModel(parent, database) {

  setTable(tableName);
  generateRoleNames();
}

void
TableModel::generateRoleNames() {
  _roleNames.clear();

  for (auto i = 0L; i < columnCount(); i++) {
    _roleNames.insert(Qt::UserRole + i + 1, record().fieldName(i).toUtf8());
  }
}

QVariant
TableModel::data(const QModelIndex& index,
                 const int role) const {
  if (!index.isValid() ||
      index.row() > QSqlTableModel::rowCount()) {
    return QVariant{};
  }

  if (role <= Qt::UserRole) {
    return QSqlTableModel::data(index, role);
  }

  const int columnIndex = role - Qt::UserRole - 1;
  const QModelIndex modelIndex = this->index(index.row(), columnIndex);
  return QSqlTableModel::data(modelIndex, Qt::DisplayRole);
}
