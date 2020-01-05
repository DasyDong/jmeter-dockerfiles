#!/bin/bash

main() {
  cd /workspace

  if [ "$JMETER_TEST_DATA_SETS" ]; then
      download_jmeter_test_data_sets
  fi

  run_jmeter_server
}

download_jmeter_test_data_sets() {
  local command="swift download $ST_CONTAINER $JMETER_TEST_DATA_SETS"

  exec_command "$command"
}

run_jmeter_server() {
  local command="jmeter-server -Dserver.rmi.localport=50000 -Dserver_port=1099"

  exec_command "$command"
}

exec_command() {
  echo "[`date`] $1"

  $1

  if [ $? -eq "0" ]; then
    echo "[`date`] succeeded"
  else
    echo "[`date`] failed"

    exit 1
  fi
}

if [ $# -eq 1 ]; then
  exec "$@"
else
  main
fi
