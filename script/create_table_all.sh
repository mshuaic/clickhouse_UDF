#!/bin/bash

methods=( haircut
          fifo
          rand)

for m in "${methods[@]}"
do
    (set -x; ./create_table.sh ../query/table.sql aml "$m")
done

