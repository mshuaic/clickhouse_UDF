#!/usr/bin/env bash

CLICKHOUSE_CLIENT=/usr/bin/clickhouse-client
TABLE_FOLDER=../table

$CLICKHOUSE_CLIENT \
    --queries-file $TABLE_FOLDER/haircut_result.sql \
    --hardware-utilization
