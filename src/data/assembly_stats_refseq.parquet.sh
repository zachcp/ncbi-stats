#
#
# Note: I rmeoved 09:FTP path as its a big string column.
# https://observablehq.observablehq.cloud/framework-example-loader-duckdb/
FNAME="assembly_summary_refseq.txt"
ASSEMBLY_URL="https://ftp.ncbi.nlm.nih.gov/genomes/ASSEMBLY_REPORTS/$FNAME"

# Use the data loader cache directory to store the downloaded data.
TMPDIR="src/.observablehq/cache"

# Download the data (if it’s not already in the cache).
if [ ! -f "$TMPDIR/$FNAME" ]; then
    # echo "$ASSEMBLY_URL"
    # echo "$TMPDIR/$FNAME"
    curl -f "$ASSEMBLY_URL" -o "$TMPDIR/$FNAME"
fi

# Generate a Parquet file using DuckDB.
duckdb :memory: << EOF
COPY (
    SELECT
        "column00" as assembly_accession,
        "column01" as bioproject,
        "column02" as biosample,
        "column03" as wgs_master,
        CAST("column05" AS INTEGER) as tax_id,
        CAST("column06" AS INTEGER) as species_taxid,
        "column06" as species_taxid,
        "column07" as organism_name,
        "column08" as infraspecific_name,
        "column09" as isolate,
        "column10" as version_status,
        "column11" as assembly_level,
        "column12" as release_type,
        "column13" as genome_rep,
        CAST("column14" AS DATE) as seq_rel_date,
        EXTRACT(YEAR FROM CAST("column14" AS DATE)) as year,
        EXTRACT(MONTH FROM CAST("column14" AS DATE)) as month,
        "column15" as asm_name,
        "column16" as submitter,
        "column17" as gbrs_paired_asm,
        "column18" as paired_asm_comp,
        "column20" as excluded_from_refseq,
        "column21" as relation_to_type_material
    FROM read_csv_auto (
            '$TMPDIR/$FNAME',
            sep = '\t',
            header = false,
            skip = 2
    )
) TO STDOUT (FORMAT 'parquet', COMPRESSION 'gzip');
EOF
