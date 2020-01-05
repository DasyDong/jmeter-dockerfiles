#!/bin/bash

main() {
  cd /workspace

  download_jmeter_test_plan

  run_jmeter

  upload_jmeter_test_log

  upload_jmeter_log

  zip_jmeter_test_report

  upload_jmeter_test_report
}

download_jmeter_test_plan() {
  local command="swift download $ST_CONTAINER $JMETER_TEST_PLAN"

  exec_command "$command"
}

run_jmeter() {
  local command="jmeter -n -t $JMETER_TEST_PLAN -l $JMETER_TEST_LOG -e -o report -R $JMETER_SLAVE_HOSTS -j $JMETER_LOG"

  exec_command "$command"
}

upload_jmeter_test_log() {
  local command="swift upload $ST_CONTAINER $JMETER_TEST_LOG"

  exec_command "$command"
}

upload_jmeter_log() {
  local command="swift upload $ST_CONTAINER $JMETER_LOG"

  exec_command "$command"
}

zip_jmeter_test_report() {
  local command="zip -r -q $JMETER_TEST_REPORT report"

  exec_command "$command"
}

upload_jmeter_test_report() {
  local command="swift upload $ST_CONTAINER $JMETER_TEST_REPORT"

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
