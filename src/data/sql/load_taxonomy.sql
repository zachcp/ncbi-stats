DROP TABLE IF EXISTS ncbi_taxonomy;

CREATE TABLE ncbi_taxonomy AS
SELECT
    CAST(SPLIT_PART (line, E '\t|\t', 1) AS INTEGER) as tax_id,
    SPLIT_PART (line, E '\t|\t', 2) as tax_name,
    SPLIT_PART (line, E '\t|\t', 3) as species,
    SPLIT_PART (line, E '\t|\t', 4) as genus,
    SPLIT_PART (line, E '\t|\t', 5) as family,
    SPLIT_PART (line, E '\t|\t', 6) as "order",
    SPLIT_PART (line, E '\t|\t', 7) as class,
    SPLIT_PART (line, E '\t|\t', 8) as phylum,
    SPLIT_PART (line, E '\t|\t', 9) as kingdom,
    REGEXP_REPLACE (SPLIT_PART (line, E '\t|\t', 10), '\t\|$', '') as superkingdom
FROM
    read_csv_auto (
        'rankedlineage.dmp',
        sep = '\t',
        header = false,
        skip = 2
    );
