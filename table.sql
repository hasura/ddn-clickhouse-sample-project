CREATE TABLE IF NOT EXISTS test
(
    `id` Int32,
    `test_column` String,
) ENGINE = MergeTree() ORDER BY id;