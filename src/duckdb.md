---
title: DUCKDB NCBI Stats
toc: true
---

```js
import {DuckDBClient} from "npm:@observablehq/duckdb";
const db = await DuckDBClient.of({base: FileAttachment("data/sql/ncbi_stats.duckdb")});

// Example Querys
// db.queryRow(`SELECT COUNT() as taxa FROM base.ncbi_taxonomy`)
// db.queryRow(`SELECT COUNT() as genbank_accessions FROM base.assembly_summary_genbank`)
// db.queryRow(`SELECT COUNT() as refseq_accessions FROM base.assembly_summary_refseq`)
```



# Taxonomy

## Species Count By Taxon

```js
const taxLevel = view(Inputs.radio(
  ["superkingdom","kingdom","phylum", "class", "order", "family", "genus", "species"],
  {label: "Taxonomy Level:", value: "phylum"}
))

const minCount = view(Inputs.range(
  [1, 100],
  {label: "Minimum Count:", value: 10, step: 1}
))
```

## Taxtab

```js

let tax_query = `SELECT
  CASE '${taxLevel}'
      WHEN 'superkingdom' THEN superkingdom
      WHEN 'kingdom' THEN kingdom
      WHEN 'phylum' THEN phylum
      WHEN 'class' THEN class
      WHEN 'order' THEN "order"
      WHEN 'family' THEN family
      WHEN 'genus' THEN genus
      WHEN 'species' THEN species
  END as taxa,
  COUNT(*) as count
  FROM base.ncbi_taxonomy
  GROUP BY taxa
  ORDER BY count DESC
  LIMIT ${minCount}`

let tax_tab =  db.query(tax_query)
view(Inputs.table(tax_tab))

```

## Taxa Plot

```js
Plot.plot({
  marginLeft: 150,
  height: 400,
  x: {label: "Count"},
  y: {label: null},
  marks: [
    Plot.barX(tax_tab, {
      y: "taxa",
      x: "count",
      sort: {y: "x", reverse: true},
      fill: "steelblue"
    }),
    Plot.ruleX([0])
  ]
})
```

</br>


## Taxonomy Head

First 100 Entries.

```js
view(
  Inputs.table(
    db.query(`select * from base.ncbi_taxonomy limit 100;`)));

```


# Assemblies Refseq


## Assembly Count

```js
db.queryRow(`SELECT COUNT() as refseq_accessions FROM base.assembly_summary_refseq`)
```

## Excluded Reasons
```js
view(
  Inputs.table(db.query(`
    SELECT excluded_from_refseq, count(*) as refseq_accessions
    FROM base.assembly_summary_refseq
    GROUP BY excluded_from_refseq
    ORDER BY refseq_accessions DESC `)))
```


## Assembly Count By Year

```js

let yearly_deposit = db.query(`SELECT year, count(*) as count FROM base.assembly_summary_refseq GROUP BY year;`);
view(Inputs.table(yearly_deposit));

```

```js
Plot.plot({
  marks: [
    Plot.line(yearly_deposit, {
      x: "year",
      y: "count"
    }),
    Plot.dot(yearly_deposit, {
      x: "year",
      y: "count"
    })
  ],
  grid: true,
  y: {
    label: "Number of Assemblies"
  },
  x: {
    label: "Year"
  }
})
```



## Assembly Head

```js
view(
  Inputs.table(
    db.query(`select * from base.assembly_summary_refseq limit 100;`)));

```
