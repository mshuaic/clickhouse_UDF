#!/usr/bin/env bash

CLICKHOUSE_CLIENT=/usr/bin/clickhouse-client
QUERY_DB_NAME=${2:-aml}
QUERY_FROM_TABLE_NAME=${3:-fifo}
QUERY_TO_TABLE_NAME=${4:-"$QUERY_FROM_TABLE_NAME"_result}

$CLICKHOUSE_CLIENT \
    --queries-file $1 \
    --param_db_name=${QUERY_DB_NAME} \
    --param_from_table_name=${QUERY_FROM_TABLE_NAME} \
    --param_to_table_name=${QUERY_TO_TABLE_NAME} \
    --time
