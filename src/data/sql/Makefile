SHELL := /bin/bash

## Data Files ------------------------------------------------------------------------
assembly_summary_genbank.txt:
	wget https://ftp.ncbi.nlm.nih.gov/genomes/ASSEMBLY_REPORTS/assembly_summary_genbank.txt

assembly_summary_refseq.txt:
	wget https://ftp.ncbi.nlm.nih.gov/genomes/ASSEMBLY_REPORTS/assembly_summary_refseq.txt

rankedlineage.dmp:
	wget ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/new_taxdump/new_taxdump.zip
	unzip new_taxdump.zip rankedlineage.dmp


## Create DDB via sql --------------------------------------------------------------
ncbi_stats.duckdb: assembly_summary_genbank.txt assembly_summary_refseq.txt rankedlineage.dmp
	# load  ncbi_assemblies_{genbnk,refseq}
	duckdb ncbi_stats.duckdb  < enums.sql
	duckdb ncbi_stats.duckdb  < load_assembly_genbank.sql
	duckdb ncbi_stats.duckdb  < load_assembly_refseq.sql
	#load the taxonomy data
	duckdb ncbi_stats.duckdb < load_taxonomy.sql


duck: ncbi_stats.duckdb
