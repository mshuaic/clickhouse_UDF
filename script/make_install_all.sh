#!/bin/bash

cd ../src/cpp
# Loop through all subdirectories
for dir in */; do
    # Change into the subdirectory
    cd "$dir"
    # Run the command in the subdirectory
    make
    (set -x; cp "${PWD##*/}" /var/lib/clickhouse/user_scripts)
    # Change back to the parent directory
    cd ..
done
