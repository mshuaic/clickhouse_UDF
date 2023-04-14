#!/bin/bash

methods=( haircut
          fifo
          rand)

CLICKHOUSE_CLIENT=/usr/bin/clickhouse-client

for m in "${methods[@]}"
do
    (set -x;
     $CLICKHOUSE_CLIENT --query "drop table aml.""$m""_result"
     )
done

