SET @stmt = (
    SELECT IF(
        (
            SELECT COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS
            WHERE TABLE_NAME = 'people' AND INDEX_NAME = 'IX_PEOPLE_FULL_NAME'
                AND TABLE_SCHEMA = database()
        ) > 0,
        'SELECT 1', 'CREATE UNIQUE INDEX `IX_PEOPLE_FULL_NAME` ON `people` (`firstName`, `lastName`);'
    )
);
PREPARE alterIfNotExists FROM @stmt;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;