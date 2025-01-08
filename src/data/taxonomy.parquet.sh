# https://observablehq.observablehq.cloud/framework-example-loader-duckdb/
FNAME="rankedlineage.dmp"
TAXONOMY_URL="ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/new_taxdump/new_taxdump.zip"

# Use the data loader cache directory to store the downloaded data.
TMPDIR="src/.observablehq/cache"

# Download the data (if it’s not already in the cache).
if [ ! -f "$TMPDIR/$FNAME" ]; then
    curl -O ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/new_taxdump/new_taxdump.zip
    unzip new_taxdump.zip rankedlineage.dmp
    mv ./rankedlineage.dmp "$TMPDIR/$FNAME"
fi

# Generate a Parquet file using DuckDB.
duckdb :memory: << EOF

CREATE OR REPLACE TABLE raw_taxonomy (
    line VARCHAR
);

-- Load the entire lines
COPY raw_taxonomy FROM '$TMPDIR/$FNAME' (
    DELIMITER '',  -- Read entire lines
    AUTO_DETECT false
);

-- Now create and populate the final table by splitting the lines
CREATE OR REPLACE TABLE taxonomy AS
SELECT
    CAST(SPLIT_PART(line, E'\t|\t', 1) AS INTEGER) as tax_id,
    SPLIT_PART(line, E'\t|\t', 2) as tax_name,
    SPLIT_PART(line, E'\t|\t', 3) as species,
    SPLIT_PART(line, E'\t|\t', 4) as genus,
    SPLIT_PART(line, E'\t|\t', 5) as family,
    SPLIT_PART(line, E'\t|\t', 6) as "order",
    SPLIT_PART(line, E'\t|\t', 7) as class,
    SPLIT_PART(line, E'\t|\t', 8) as phylum,
    SPLIT_PART(line, E'\t|\t', 9) as kingdom,
    REGEXP_REPLACE(SPLIT_PART(line, E'\t|\t', 10), '\t\|$', '') as superkingdom
FROM raw_taxonomy;

COPY taxonomy TO STDOUT (FORMAT 'parquet', COMPRESSION 'gzip');
EOF
