-- process_assembly.sql
DROP TABLE IF EXISTS assembly_summary_refseq;

CREATE TABLE assembly_summary_refseq AS
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
FROM
    read_csv_auto (
        'assembly_summary_refseq.txt',
        sep = '\t',
        header = false,
        skip = 2
    );
