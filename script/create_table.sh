#!/usr/bin/env bash

# default upbit hack blocks

QUERY_START_BLOCK=${START_BLOCK:-9007863}
QUERY_END_BLOCK=${END_BLOCK:-10364596}
QUERY_DB_NAME=${2:-aml}
QUERY_TABLE_NAME=${3:-fifo}
QUERY_ALGORITHM=${4:-"$QUERY_TABLE_NAME"}
QUERY_SEED=${SEED:-0xa09871AEadF4994Ca12f5c0b6056BBd1d343c029}
QUERY_AMOUNT=${AMOUNT:-342000}

CLICKHOUSE_CLIENT=/usr/bin/clickhouse-client

$CLICKHOUSE_CLIENT \
    --queries-file $1 \
    --param_start_block=${QUERY_START_BLOCK} \
    --param_end_block=${QUERY_END_BLOCK} \
    --param_db_name=${QUERY_DB_NAME} \
    --param_table_name=${QUERY_TABLE_NAME} \
    --param_seed=${QUERY_SEED} \
    --param_amount=${QUERY_AMOUNT} \
    --param_algorithm=${QUERY_ALGORITHM} \
