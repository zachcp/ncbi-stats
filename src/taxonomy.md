---
title: NCBI Taxonomy Data
toc: true
---


```js
import {DuckDBClient} from "npm:@observablehq/duckdb";
const db = await DuckDBClient.of({base: FileAttachment("data/sql/ncbi_stats.duckdb")});
```


# Species Count By Taxon

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

<!-- WHERE phot_g_mean_mag BETWEEN ${mag - 0.1} AND ${mag + 0.1} -->



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


# Taxonomy Head

First 100 Entries.

```js
view(
  Inputs.table(
    db.query(`select * from base.ncbi_taxonomy limit 100;`)));

```


## Taxnomoy Links
