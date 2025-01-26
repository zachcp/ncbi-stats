CREATE TYPE assembly_level_enum AS ENUM (
    'Complete Genome',
    'Chromosome',
    'Scaffold',
    'Contig'
);

CREATE TYPE assembly_type_enum AS ENUM (
    'haploid',
    'haploid-with-alt',
    'haploid-with-alt-loci',
    'diploid',
    'unresolved-diploid',
    'alternate-pseudohaplotype'
);

CREATE TYPE genome_rep_enum AS ENUM ('Full', 'Partial');

CREATE TYPE relation_to_type_material_enum AS ENUM (
    'assembly from type material',
    'assembly from synonym type material',
    'assembly from pathotype material',
    'assembly designated as clade exemplar',
    'assembly designated as neotype',
    'assembly designated as reftype',
    'ICTV species exemplar',
    'ICTV additional isolate',
    'na'
);

CREATE TYPE release_type_enum AS ENUM ('Major', 'Minor', 'Patch');

CREATE TYPE version_status_enum AS ENUM ('latest', 'replaced', 'suppressed');
