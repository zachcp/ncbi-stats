-- process_assembly.sql
DROP TABLE IF EXISTS assembly_summary_refseq;

CREATE TABLE assembly_summary_refseq AS
SELECT
    "column00" as assembly_accession,
    "column01" as bioproject,
    "column02" as biosample,
    "column03" as wgs_master,
    "column04" as refseq_category,
    CAST("column05" AS INTEGER) as tax_id, -- int
    CAST("column06" AS INTEGER) as species_taxid, -- int
    "column07" as organism_name,
    "column08" as infraspecific_name,
    "column09" as isolate,
    "column10" as version_status,
    "column11" as assembly_level,
    "column12" as release_type,
    "column13" as genome_rep,
    CAST("column14" AS DATE) as seq_rel_date,
    EXTRACT(
        YEAR
        FROM
            CAST("column14" AS DATE)
    ) as year,
    EXTRACT(
        MONTH
        FROM
            CAST("column14" AS DATE)
    ) as month,
    "column15" as asm_name,
    "column16" as submitter,
    "column17" as gbrs_paired_asm,
    "column18" as paired_asm_comp,
    REPLACE("column19", 'https://ftp.ncbi.nlm.nih.gov/genomes/all/', '') as ftp_path,
    "column20" as excluded_from_refseq,
    CAST("column21" AS relation_to_type_material_enum) as relation_to_type_material, -- enum
    "column22" as asm_not_live_date,
    CAST("column23" AS assembly_type_enum) as assembly_type, -- enum
    "column24" as group, -- very useful for sorting.
    CAST("column25" AS BIGINT) as genome_size, -- int
    "column26" as genome_size_ungapped, -- int
    "column27" as gc_percent, --f32
    "column28" as replicon_count, -- smallint
    "column29" as scaffold_count, -- small int
    "column30" as contig_count, -- small int
    "column31" as annotation_provider, -- str
    "column32" as annotation_name,
    "column33" as annotation_date,
    -- col 34 has a few `na` values with break inputs
    TRY_CAST (NULLIF("column34", 'na') AS BIGINT) as total_gene_count,
    TRY_CAST (NULLIF("column35", 'na') AS BIGINT) as protein_coding_gene_count,
    TRY_CAST (NULLIF("column36", 'na') AS BIGINT) as non_coding_gene_count,
    "column37" as pubmed_id -- comma separated IDs
FROM
    read_csv_auto (
        'assembly_summary_refseq.txt',
        sep = '\t',
        header = false,
        skip = 2,
        types = {'column34': 'VARCHAR', 'column35': 'VARCHAR', 'column36': 'VARCHAR'}
    );
