---
title: NCBI Data
toc: true
---


## Assemblies



- 'https://ftp.ncbi.nlm.nih.gov/genomes/ASSEMBLY_REPORTS/assembly_summary_genbank.txt',
- 'https://ftp.ncbi.nlm.nih.gov/genomes/ASSEMBLY_REPORTS/assembly_summary_refseq.txt',

```txt
################################################################################
README for the assembly_summary_genbank.txt, assembly_summary_refseq.txt and
assembly_summary.txt files found on the NCBI genomes FTP site:
  https://ftp.ncbi.nlm.nih.gov/genomes

Last updated: December 30, 2024
################################################################################

======================
ASSEMBLY SUMMARY FILES
======================

The assembly_summary files report metadata for the genome assemblies on the
NCBI genomes FTP site.

Four master files reporting data for either GenBank or RefSeq genome assemblies
are available under https://ftp.ncbi.nlm.nih.gov/genomes/ASSEMBLY_REPORTS/
assembly_summary_genbank.txt            - current GenBank genome assemblies
assembly_summary_genbank_historical.txt - replaced and suppressed GenBank genome
                                          assemblies
assembly_summary_refseq.txt             - current RefSeq genome assemblies
assembly_summary_refseq_historical.txt  - replaced and suppressed RefSeq genome
                                          assemblies

assembly_summary_genbank.txt and assembly_summary_genbank_historical.txt are
also available at:
https://ftp.ncbi.nlm.nih.gov/genomes/genbank/assembly_summary_genbank.txt
https://ftp.ncbi.nlm.nih.gov/genomes/genbank/assembly_summary_genbank_historical.txt


assembly_summary_refseq.txt and assembly_summary_refseq_historical.txt are
also available at:
https://ftp.ncbi.nlm.nih.gov/genomes/refseq/assembly_summary_refseq.txt
https://ftp.ncbi.nlm.nih.gov/genomes/refseq/assembly_summary_refseq_historical.txt

The assembly_summary.txt files in the directories named for taxonomic groups or
species contain the relevant subsets of the data from the master files.


=====================
COLUMN SPECIFICATIONS
=====================

The assembly_summary.txt files have 37 tab-delimited columns.
Header rows begin with '#".

Column  1: "assembly_accession"
   Assembly accession: the assembly accession.version reported in this field is
   a unique identifier for the set of sequences in this particular version of
   the genome assembly.

Column  2: "bioproject"
   BioProject: accession for the BioProject which produced the sequences in the
   genome assembly. A BioProject is a collection of biological data related to a
   single initiative, originating from a single organization or from a
   consortium. A BioProject record provides users a single place to find links
   to the diverse data types generated for that project. The record can be
   retrieved from the NCBI BioProject resource:
   https://www.ncbi.nlm.nih.gov/bioproject/

Column  3: "biosample"
   BioSample: accession for the BioSample from which the sequences in the genome
   assembly were obtained. A BioSample record contains a description of the
   biological source material used in experimental assays. The record can be
   retrieved from the NCBI BioSample resource:
   https://www.ncbi.nlm.nih.gov/biosample/

Column  4: "wgs_master"
   WGS-master: the GenBank Nucleotide accession and version for the master
   record of the Whole Genome Shotgun (WGS) project for the genome assembly. The
   master record can be retrieved from the NCBI Nucleotide resource:
   https://www.ncbi.nlm.nih.gov/nuccore
   Genome assemblies that are complete genomes, and those that are clone-based,
   do not have WGS-master records in which case this field will be empty.

Column  5: "refseq_category"
   RefSeq Category: whether the assembly is a reference genome in the NCBI
   Reference Sequence (RefSeq) project classification.
   Values:
           reference genome - a genome computationally or manually selected
                              as a reference for the species.
           na               - no RefSeq category assigned to this assembly
   Details of the selection of reference are at:
   https://www.ncbi.nlm.nih.gov/datasets/docs/v2/policies-annotation/genome-processing/reference-selection/

Column  6: "taxid"
   Taxonomy ID: the NCBI taxonomy identifier for the organism from which the
   genome assembly was derived. The NCBI Taxonomy Database is a curated
   classification and nomenclature for all of the organisms in the public
   sequence databases. The taxonomy record can be retrieved from the NCBI
   Taxonomy resource:
   https://www.ncbi.nlm.nih.gov/taxonomy/

Column  7: "species_taxid"
   Species taxonomy ID: the NCBI taxonomy identifier for the species from which
   the genome assembly was derived. The species taxid will differ from the
   organism taxid (column 6) only when the organism was reported at a sub-
   species or strain level.

Column  8: "organism_name"
   Organism name: the scientific name of the organism from which the sequences
   in the genome assembly were derived. This name is taken from the NCBI
   Taxonomy record for the taxid specified in column 6. Some older taxids were
   assigned at the strain level and for these the organism name will include the
   strain. Current practice is only to assign taxids at the species level; for
   these the organism name will be just the species, however, the strain name
   will be reported in the infraspecific_name field (column 9).

Column  9: "infraspecific_name"
   Infraspecific name: the strain, breed, cultivar or ecotype of the organism
   from which the sequences in the genome assembly were derived. Data are
   reported in the form tag=value, e.g. strain=AF16. Strain, breed, cultivar
   and ecotype are not expected to be used together, however, if they are then
   they will be reported in a list separated by ", /". Empty if no strain,
   breed, cultivar or ecotype is specified on the genomic sequence records.

Column 10: "isolate"
   Isolate: the individual isolate from which the sequences in the genome
   assembly were derived. Empty if no isolate is specified on the genomic
   sequence records.

Column 11: "version_status"
   Version status: the release status for the genome assembly version.
   Values:
           latest     - the most recent of all the versions for this assembly
                        chain
           replaced   - this version has been replaced by a newer version of the
                        assembly in the same chain
           suppressed - this version of the assembly has been suppressed
   An assembly chain is the collection of all versions for the same assembly
   accession.

Column 12: "assembly_level"
   Assembly level: the highest level of assembly for any object in the genome
   assembly.
   Values:
      Complete genome - all chromosomes are gapless and have no runs of 10 or
                        more ambiguous bases (Ns), there are no unplaced or
                        unlocalized scaffolds, and all the expected chromosomes
                        are present (i.e. the assembly is not noted as having
                        partial genome representation). Plasmids and organelles
                        may or may not be included in the assembly but if
                        present then the sequences are gapless.
      Chromosome      - there is sequence for one or more chromosomes. This
                        could be a completely sequenced chromosome without gaps
                        or a chromosome containing scaffolds or contigs with
                        gaps between them. There may also be unplaced or
                        unlocalized scaffolds.
      Scaffold        - some sequence contigs have been connected across gaps to
                        create scaffolds, but the scaffolds are all unplaced or
                        unlocalized.
      Contig          - nothing is assembled beyond the level of sequence
                        contigs

Column 13: "release_type"
   Release type: whether this version of the genome assembly is a major, minor
   or patch release.
   Values:
           Major - changes from the previous assembly version result in a
                   significant change to the coordinate system. The first
                   version of an assembly is always a major release. Most
                   subsequent genome assembly updates are also major releases.
           Minor - changes from the previous assembly version are limited to the
                   following changes, none of which result in a significant
                   change to the coordinate system of the primary assembly-unit:
                   - adding, removing or changing a non-nuclear assembly-unit
                   - dropping unplaced or unlocalized scaffolds
                   - adding up to 50 unplaced or unlocalized scaffolds which are
                     shorter than the current scaffold-N50 value
                   - replacing a component with a gap of the same length
           Patch - the only change is the addition or modification of a patch
                   assembly-unit.
   See the NCBI Assembly model web page (https://www.ncbi.nlm.nih.gov/assembly/
   model/#asmb_def) for definitions of assembly-units and genome patches.

Column 14: "genome_rep"
   Genome representation: whether the goal for the assembly was to represent the
   whole genome or only part of it.
   Values:
      Full    - the data used to generate the assembly was obtained from the
                whole genome, as in Whole Genome Shotgun (WGS) assemblies for
                example. There may still be gaps in the assembly.
      Partial - the data used to generate the assembly came from only part of
                the genome.
   Most assemblies have full genome representation with a minority being partial
   genome representation. See the Assembly help web page
   (https://www.ncbi.nlm.nih.gov/assembly/help/) for reasons that the genome
   representation would be set to partial.

Column 15: "seq_rel_date"
   Sequence release date: the date the sequences in the genome assembly were
   released in the International Nucleotide Sequence Database Collaboration
   (INSDC) databases, i.e. DDBJ, ENA or GenBank.

Column 16: "asm_name"
   Assembly name: the submitter's name for the genome assembly, when one was
   provided, otherwise a default name, in the form ASM#####v#, is provided by
   NCBI. Assembly names are not unique.

Column 17: "asm_submitter"
   Assembly submitter: the submitting consortium or first position if a list of
   organizations. The full submitter information is available in the NCBI
   BioProject resource: www.ncbi.nlm.nih.gov/bioproject/

Column 18: "gbrs_paired_asm"
   GenBank/RefSeq paired assembly: the accession.version of the GenBank assembly
   that is paired to the given RefSeq assembly, or vice-versa. "na" is reported
   if the assembly is unpaired.

Column 19: "paired_asm_comp"
   Paired assembly comparison: whether the paired GenBank & RefSeq assemblies
   are identical or different.
   Values:
      identical - GenBank and RefSeq assemblies are identical
      different - GenBank and RefSeq assemblies are not identical
      na        - not applicable since the assembly is unpaired

Column 20: "ftp_path"
   FTP path: the path to the directory on the NCBI genomes FTP site from which
   data for this genome assembly can be downloaded.

Column 21: "excluded_from_refseq"
   Excluded from RefSeq: reasons the assembly was excluded from the NCBI
   Reference Sequence (RefSeq) project, including any assembly anomalies. See:
   https://www.ncbi.nlm.nih.gov/assembly/help/anomnotrefseq/

Column 22: "relation_to_type_material"
   Relation to type material: contains a value if the sequences in the genome
   assembly were derived from type material.
   Values:
      assembly from type material - the sequences in the genome assembly were
         derived from type material
      assembly from synonym type material - the sequences in the genome assembly
         were derived from synonym type material
      assembly from pathotype material - the sequences in the genome assembly
         were derived from pathovar material
      assembly designated as neotype - the sequences in the genome assembly
         were derived from neotype material
      assembly designated as reftype - the sequences in the genome assembly
         were derived from reference material where type material never was
         available and is not likely to ever be available
      ICTV species exemplar - the International Committee on Taxonomy of Viruses
         (ICTV) designated the genome assembly as the exemplar for the virus
         species
      ICTV additional isolate - the International Committee on Taxonomy of
         Viruses (ICTV) designated the genome assembly an additional isolate for
         the virus species

Column 23: "asm_not_live_date"
	Assembly no longer live date: the date the assembly transitioned from
	version_status latest to either replaced or suppressed. When the assembly is
	in status latest, "na" is reported.

Column 24: "assembly_type"
	Assembly type: the type of assembly, including haploid, haploid-with-alt,
	diploid, unresolved-diploid, alternate-pseudohaplotype

Column 25: "group"
	Taxonomy Group: commonly used organism groups:
		Eukaryota: Animals, Fungi, Plants, Protists;
        Prokaryota: group corresponds to phylum;
        Viruses: groups defined as the first level (not ranked)
                     below the kingdom of Viruses

Column 26: "genome_size"
	Genome Size: total length of all top-level sequences in the primary
	assembly

Column 27: "genome_size_ungapped"
	Genome Size - Ungapped length: total length of all top-level sequences
	in the primary assembly ignoring gaps. Any stretch of 10 or more Ns in a
	sequence is treated like a gap

Column 28: "gc_percent"
	GC%: Percent of nitrogenous bases (guanine or cytosine) in DNA submitted
	for the assembly, rounded to the nearest 0.5%

Column 29: "replicon_count"
	Replicon count:  total number of chromosomes, organelle genomes, and
	plasmids in the primary assembly

Column 30: "scaffold_count"
	Scaffold count: number of scaffolds including placed, unlocalized,
	unplaced, alternate loci and patch scaffolds in the primary assembly

Column 31: "contig_count"
	Contig count: number of contigs in the primary assembly

Column 32: "annotation_provider"
	Annotation provider: the group that provided the annotation on the assembly

Column 33: "annotation_name"
	Annotation name: the name of the annotation that is on the assembly

Column 34: "annotation_date"
	Annotation date: the date that the assembly was annotated

Column 35: "total_gene_count"
	Total gene count: the total number of genes that are annotated on the
	assembly. If an assembly has no genes, or is lacking a gene count, it will
	display "na". If an assembly has no features but is annotated, then it will
	show 0.

Column 36: "protein_coding_gene_count"
	Protein coding gene count: the total number of protein coding genes on the
	assembly

Column 37: "non_coding_gene_count"
	Non-coding gene count: the total number of non-coding genes on the assembly

Column 38: "pubmed_id"
	PubMed ID: The PubMed ID(s) that are associated with the assembly,
	separated by commas



=====================================
HOW TO USE THE ASSEMBLY SUMMARY FILES
=====================================

The metadata provided in the assembly_summary.txt files can be used to identify
assemblies of interest for subsequent download.

The Genomes FTP FAQ provides examples of how to use the assembly_summary.txt
files to download sets of assemblies. See:

How can I download only the current version of each assembly?
https://www.ncbi.nlm.nih.gov/genome/doc/ftpfaq/#current

How can I download RefSeq data for all complete bacterial genomes?
https://www.ncbi.nlm.nih.gov/genome/doc/ftpfaq/#allcomplete

Other sets of assemblies of interest can be downloaded using variations on
these instructions.

________________________________________________________________________________
National Center for Biotechnology Information (NCBI)
National Library of Medicine
National Institutes of Health
8600 Rockville Pike
Bethesda, MD 20894, USA
tel: (301) 496-2475
fax: (301) 480-9241
e-mail: info@ncbi.nlm.nih.gov
________________________________________________________________________________
```



## Taxonomy

- https://ftp.ncbi.nih.gov/pub/taxonomy/

```txt

This directory contains the following NCBI Taxonomy database dump files:

   new_taxdump.zip
   new_taxdump.tar.Z
   new_taxdump.tar.gz

All these files containes exactly the same information and are arranged so
for the convenience of unpacking them on various operating environments.
In addition there are files:

   new_taxdump.zip.md5
   new_taxdump.tar.Z.md5
   new_taxdump.tar.gz.md5

which contain MD5 sums for the corresponding archive files. These files
might be used to check correctness of the download of corresponding
archive file.

new_taxdump.zip
---------------

Is intended for zip-capable utilities such as pkunzip, unzip, and WinZip.
These utilities are widely available in almost all operating environments.
To unpack it command-line pkunzip and unzip:

        pkunzip new_taxdump.zip
or
        unzip new_taxdump.zip

Note: pkunzip and/or unzip executables must be in the executable search path
and new_taxdump.zip must be in the current directory. Files will be unzipped into
current directory. For desired dump files placement and more please refer to
the manual and/or option descriptions of pkunzip and unzip utilities.

new_taxdump.tar.Z
-----------------

This file is to be unpacked by uncompress utility and subsequent tar
archiver. These utilities are usually used in UNIX-like environment.
Unpacking instructions follows:

           uncompress -c new_taxdump.tar.Z | tar xf -

new_taxdump.tar.gz
------------------

This file is to be unpacked by GNU unzip utility and subsequent tar
archiver. These utilities are usually used in UNIX-like environment.
Unpacking instructions follows:

           gunzip -c new_taxdump.tar.gz | tar xf -

The content of the archive
--------------------------

It may look like this:

citations.dmp
delnodes.dmp
division.dmp
gencode.dmp
typeoftype.dmp
merged.dmp
names.dmp
nodes.dmp
host.dmp
typematerial.dmp
rankedlineage.dmp
fullnamelineage.dmp
taxidlineage.dmp
excludedfromtype.dmp
images.dmp
readme.txt

The readme.txt file gives a brief description of *.dmp files. These files
contain taxonomic information and are briefly described below. Each of the
files store one record in the single line that are delimited by "\t|\n"
(tab, vertical bar, and newline) characters. Each record consists of one
or more fields delimited by "\t|\t" (tab, vertical bar, and tab) characters.
The brief description of field position and meaning for each file follows.

nodes.dmp
---------
This file represents taxonomy nodes. The description for each node includes
the following fields:

	tax_id					-- node id in GenBank taxonomy database
 	parent tax_id				-- parent node id in GenBank taxonomy database
 	rank					-- rank of this node (superkingdom, kingdom, ...)
 	embl code				-- locus-name prefix; not unique
 	division id				-- see division.dmp file
 	inherited div flag  (1 or 0)		-- 1 if node inherits division from parent
 	genetic code id				-- see gencode.dmp file
 	inherited GC  flag  (1 or 0)		-- 1 if node inherits genetic code from parent
 	mitochondrial genetic code id		-- see gencode.dmp file
 	inherited MGC flag  (1 or 0)		-- 1 if node inherits mitochondrial gencode from parent
 	GenBank hidden flag (1 or 0)            -- 1 if name is suppressed in GenBank entry lineage
 	hidden subtree root flag (1 or 0)       -- 1 if this subtree has no sequence data yet
 	comments				-- free-text comments and citations
        plastid genetic code id                 -- see gencode.dmp file
        inherited PGC flag  (1 or 0)            -- 1 if node inherits plastid gencode from parent
	specified_species			-- 1 if species in the node's lineage has formal name
        hydrogenosome genetic code id           -- see gencode.dmp file
        inherited HGC flag  (1 or 0)            -- 1 if node inherits hydrogenosome gencode from parent

names.dmp
---------
Taxonomy names file has these fields:

	tax_id					-- the id of node associated with this name
	name_txt				-- name itself
	unique name				-- the unique variant of this name if name not unique
	name class				-- (synonym, common name, ...)

division.dmp
------------
Divisions file has these fields:
	division id				-- taxonomy database division id
	division cde				-- GenBank division code (three characters)
	division name				-- e.g. BCT, PLN, VRT, MAM, PRI...
	comments

gencode.dmp
-----------
Genetic codes file:

	genetic code id				-- GenBank genetic code id
	abbreviation				-- genetic code name abbreviation
	name					-- genetic code name
	cde					-- translation table for this genetic code
	starts					-- start codons for this genetic code

delnodes.dmp
------------
Deleted nodes (nodes that existed but were deleted) file field:

	tax_id					-- deleted node id

merged.dmp
----------
Merged nodes file fields:

	old_tax_id                              -- id of nodes which has been merged
	new_tax_id                              -- id of nodes which is result of merging

citations.dmp
-------------
Citations file fields:

	cit_id					-- the unique id of citation
	cit_key					-- citation key
        medline_id                              -- unique id in MedLine database (0 if not in MedLine)
	pubmed_id				-- unique id in PubMed database (0 if not in PubMed)
	url					-- URL associated with citation
	text					-- any text (usually article name and authors)
						-- The following characters are escaped in this text by a backslash:
						-- newline (appear as "\n"),
						-- tab character ("\t"),
						-- double quotes ('\"'),
						-- backslash character ("\\").
	taxid_list				-- list of node ids separated by a single space

typeoftype.dmp
--------------
Type material types file fields:

	type_name				-- name of type material type
	synonyms				-- alternative names for type material type
	nomenclature				-- Taxonomic Code of Nomenclature coded by a single letter:
						-- B - International Code for algae, fungi and plants (ICN), previously Botanical Code,
						-- P - International Code of Nomenclature of Prokaryotes (ICNP),
						-- Z - International Code of Zoological Nomenclature (ICZN),
						-- V - International Committee on Taxonomy of Viruses (ICTV) virus classification.
	description				-- descriptive text

host.dmp
--------
Theoretical host for organism file fields:

	tax_id					-- node id
	potential_hosts				-- theoretical host list separated by comma ','

typematerial.dmp
----------------
Type material information file fields:

	tax_id					-- node id
	tax_name				-- organism name type material is assigned to
	type					-- type material type (see typeoftype.dmp)
	identifier				-- identifier in type material collection

rankedlineage.dmp
-----------------
Select ancestor names for well-established taxonomic ranks (species, genus, family, order, class, phylum, kingdom, superkingdom) file fields:

        tax_id                                  -- node id
        tax_name                                -- scientific name of the organism
        species                                 -- name of a species (coincide with organism name for species-level nodes)
	genus					-- genus name when available
	family					-- family name when available
	order					-- order name when available
	class					-- class name when available
	phylum					-- phylum name when available
	kingdom					-- kingdom name when available
	superkingdom				-- superkingdom (domain) name when available

fullnamelineage.dmp
----------------
Full name lineage file fields:

        tax_id                                  -- node id
        tax_name                                -- scientific name of the organism
        lineage                                 -- sequence of sncestor names separated by semicolon ';' denoting nodes' ancestors starting from the most distant one and ending with the immediate one

taxidlineage.dmp
----------------
Taxonomy id lineage file fields:

        tax_id                                  -- node id
        lineage                                 -- sequence of node ids separated by space denoting nodes' ancestors starting from the most distant one and ending with the immediate one

excludedfromtype.dmp
--------------------
A set of strains or vouchers determined not be from type material:

	tax_id					-- node id
	tax_name				-- organism name type material is assigned to
	property				-- "not considered type" for strains/vouchers determined to be wrongly assigned
						-- "not verified as type" for strains/vouchers of uncertain provenance
	voucher_strain				-- strain or voucher id string

Organism images file (images.dmp):
        image_id                                -- the unique id of image
        image_key                               -- image key
        url                                     -- image URL associated with citation
        license                                 -- image license
        attribution                             -- image attribution
        source                                  -- source of the image
        properties                              -- various image properties separated by semicolon
        taxid_list                              -- list of node ids separated by a single space

```
