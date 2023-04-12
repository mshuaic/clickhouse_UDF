#!/usr/bin/env bash


# default upbit hack blocks
QUERY_START_BLOCK=${START_BLOCK:-9007863}
QUERY_END_BLOCK=${END_BLOCK:-10364596}
CLICKHOUSE_CLIENT=/usr/bin/clickhouse-client
TABLE_FOLDER=../table

$CLICKHOUSE_CLIENT \
    --queries-file $TABLE_FOLDER/haircut.sql \
    --param_start_block=${QUERY_START_BLOCK} \
    --param_end_block=${QUERY_END_BLOCK}
