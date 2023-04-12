#!/usr/bin/env bash

CLICKHOUSE_CLIENT=/usr/bin/clickhouse-client
QUERY_DB_NAME=${2:-aml}
QUERY_TABLE_NAME=${3:-fifo_result}
QUERY_AMOUNT=${AMOUNT:-342000}

$CLICKHOUSE_CLIENT \
    --queries-file $1 \
    --param_db_name=${QUERY_DB_NAME} \
    --param_table_name=${QUERY_TABLE_NAME} \
    --param_amount=${QUERY_AMOUNT} \
