CREATE TABLE {db_name:Identifier}.{table_name:Identifier}
(
    `block_number` UInt64,
    `tx_index` UInt64,
    `hash` String,
    `src` String,
    `des` String,
    `value` UInt256,
    `balance_src` Int256,
    `tainted_value` Int256,
    `tainted_src` Int256,
    `tainted_des` Int256
)
ENGINE = Executable({algorithm:String}||' '||{seed:String}||' '||{amount:String}, TabSeparated, (
    SELECT *
    FROM ethereum.tx_balance
    WHERE (block_number >= {start_block:UInt64}) AND (block_number <= {end_block:UInt64})
          AND balance > 0
          AND value > 0
    ORDER BY (block_number, transaction_index) ASC
))
SETTINGS command_read_timeout = 100000, command_write_timeout = 100000
