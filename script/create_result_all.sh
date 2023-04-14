#!/bin/bash

methods=( haircut
          fifo
          rand)

for m in "${methods[@]}"
do
    (set -x; ./create_result.sh ../query/result.sql aml "$m")
done

