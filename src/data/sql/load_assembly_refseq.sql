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
    "column19" as ftp_path,
    "column20" as excluded_from_refseq,
    "column21" as relation_to_type_material, -- enum
    "column22" as asm_not_live_date,
    "column23" as assembly_type, -- enum
    "column24" as group, -- very useful for sorting.
    "column25" AS INTEGER as genome_size, -- int
    "column26" as genome_size_ungapped, -- int
    "column27" as gc_percent, --f32
    "column28" as replicon_count, -- smallint
    "column29" as scaffold_count, -- small int
    "column30" as contig_count, -- small int
    "column31" as annotation_provider, -- str
    "column32" as annotation_name,
    "column33" as annotation_date,
    TRY_CAST ("column34" AS BIGINT) as total_gene_count, -- int
    "column35" as protein_coding_gene_count, --int
    "column36" as non_coding_gene_count, --int
    "column37" as pubmed_id -- comma separated IDs
FROM
    read_csv_auto (
        'assembly_summary_refseq.txt',
        sep = '\t',
        header = false,
        skip = 2
    );
