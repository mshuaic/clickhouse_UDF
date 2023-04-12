CREATE TABLE aml.haircut
(
    `block` UInt64,
    `tx_index` UInt64
    `hash` String,
    `src` String,
    `des` String,
    `value` UInt256,
    `balance_src` Int256,
    `tainted_value` Int256,
    `tainted_src` Int256,
    `tainted_des` Int256
)
ENGINE = Executable('haircut 0xa09871AEadF4994Ca12f5c0b6056BBd1d343c029 342000', TabSeparated, (
    SELECT *
    FROM ethereum.tx_balance
    WHERE (block_number >= {start_block:UInt64}) AND (block_number <= {end_block:UInt64})
    ORDER BY (block_number, transaction_index) ASC
))
SETTINGS command_read_timeout = 100000, command_write_timeout = 100000
