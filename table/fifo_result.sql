CREATE TABLE aml.haircut_result
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
    `tainted_des` Int256,
    INDEX hash_idx hash TYPE bloom_filter GRANULARITY 1,
    INDEX src_idx src TYPE bloom_filter GRANULARITY 1,
    INDEX des_idx des TYPE bloom_filter GRANULARITY 1
)
ENGINE = MergeTree
ORDER BY (block_number, tx_index) AS
SELECT *
FROM aml.haircut
