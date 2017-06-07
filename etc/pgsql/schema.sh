#!/bin/sh
#cat extensions.sql;    echo

# dependency order:
cat theater.table.sql; echo
cat group.table.sql;   echo
cat object.table.sql;  echo
cat object.procs.sql;  echo

# alphabetical order:
cat asset.table.sql;   echo
cat camera.table.sql;  echo
cat event.table.sql;   echo
cat message.table.sql; echo
cat message.procs.sql; echo
cat player.table.sql;  echo
cat target.table.sql;  echo

# dependency order:
cat object.views.sql;  echo
