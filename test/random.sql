SELECT *
FROM executable('rand.py 0xa09871AEadF4994Ca12f5c0b6056BBd1d343c029 342000',
                TabSeparated,
                'block_number UInt64,
                tx_index UInt64,
                hash String,
                src String,
                des String,
                value UInt256,
                balance_src Int256,
                tainted_value Int256,
                tainted_src Int256,
                tainted_des Int256', (
    SELECT *
    FROM ethereum.tx_balance
    WHERE (block_number >= 9007863) AND (block_number <= 9024596)
    ORDER BY (block_number, transaction_index) ASC
))
