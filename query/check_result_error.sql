SELECT (sum(tainted) - toInt256({amount:UInt64} * pow(10, 18))) / ({amount:UInt64} * pow(10, 18)) AS error_rate
FROM
(
    SELECT argMax(tainted, _max_block_index) AS tainted
    FROM
    (
        SELECT
            src AS address,
            argMax(tainted_src, (block_number, tx_index)) AS tainted,
            max((block_number, tx_index)) AS _max_block_index
        FROM {db_name:Identifier}.{table_name:Identifier}
        GROUP BY src
        UNION ALL
        SELECT
            des AS address,
            argMax(tainted_des, (block_number, tx_index)) AS tainted,
            max((block_number, tx_index)) AS _max_block_index
        FROM {db_name:Identifier}.{table_name:Identifier}
        GROUP BY des
    )
    GROUP BY address
)
