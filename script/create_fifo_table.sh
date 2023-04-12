#!/usr/bin/env bash


# default upbit hack blocks
QUERY_START_BLOCK=${START_BLOCK:-9007863}
QUERY_END_BLOCK=${END_BLOCK:-10364596}
QUERY_DB_NAME=${DB_NAME:-aml}
QUERY_TABLE_NAME=${TABLE_NAME:-fifo}
CLICKHOUSE_CLIENT=/usr/bin/clickhouse-client
TABLE_FOLDER=../table

$CLICKHOUSE_CLIENT \
    --queries-file $TABLE_FOLDER/fifo.sql \
    --param_start_block=${QUERY_START_BLOCK} \
    --param_end_block=${QUERY_END_BLOCK} \
    --param_db_name=${QUERY_DB_NAME} \
    --param_table_name=${QUERY_TABLE_NAME}
