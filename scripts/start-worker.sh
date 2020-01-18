#!/bin/sh

if [[ -z $SPARK_WORK_CPU_COUNT ]] && [[ -z $SPARK_MEM ]]; then
  /spark/bin/spark-class org.apache.spark.deploy.worker.Worker \
    --webui-port $SPARK_WORKER_WEBUI_PORT \
    -c $SPARK_WORK_CPU_COUNT \
    -m $SPARK_MEM \
    $SPARK_MASTER
elif [[ -z $SPARK_WORK_CPU_COUNT ]]; then
  /spark/bin/spark-class org.apache.spark.deploy.worker.Worker \
    --webui-port $SPARK_WORKER_WEBUI_PORT \
    -c $SPARK_WORK_CPU_COUNT \
    $SPARK_MASTER
elif [[ -z $SPARK_MEM ]]; then
  /spark/bin/spark-class org.apache.spark.deploy.worker.Worker \
    --webui-port $SPARK_WORKER_WEBUI_PORT \
    -m $SPARK_MEM \
    $SPARK_MASTER
else:
  /spark/bin/spark-class org.apache.spark.deploy.worker.Worker \
    --webui-port $SPARK_WORKER_WEBUI_PORT \
    $SPARK_MASTER
fi