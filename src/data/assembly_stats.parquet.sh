# https://observablehq.observablehq.cloud/framework-example-loader-duckdb/
FNAME="assembly_summary_genbank.txt"
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
        "column04" as refseq_category,
        "column05" as tax_id,
        "column06" as species_taxid,
        "column07" as organism_name,
        "column08" as infraspecific_name,
        "column09" as isolate,
        "column10" as version_status,
        "column11" as assembly_level,
        "column12" as release_type,
        "column13" as genome_rep,
        "column14" as seq_rel_date,
        "column15" as asm_name,
        "column16" as submitter,
        "column17" as gbrs_paired_asm,
        "column18" as paired_asm_comp,
        "column19" as ftp_path,
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
