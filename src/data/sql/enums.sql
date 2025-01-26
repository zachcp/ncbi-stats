CREATE TYPE assembly_type_enum AS ENUM (
    'haploid',
    'haploid-with-alt',
    'haploid-with-alt-loci',
    'diploid',
    'unresolved-diploid',
    'alternate-pseudohaplotype'
);

-- Relation to type material
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
