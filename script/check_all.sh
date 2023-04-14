#!/bin/bash

methods=( haircut
          fifo
          rand)

for m in "${methods[@]}"
do
    (set -x; ./check_result_error.sh ../query/check_result_error.sql aml "$m""_result")
done

