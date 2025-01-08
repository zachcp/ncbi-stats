---
title: NCBI Taxonomy Data
toc: true
sql:
  taxonomy: ./data/taxonomy.parquet
---



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

```sql id=taxData
SELECT
CASE ${taxLevel}
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
FROM taxonomy
GROUP BY 1
ORDER BY count DESC
LIMIT ${minCount}
```

```js
Plot.plot({
  marginLeft: 150,
  height: 400,
  x: {label: "Count"},
  y: {label: null},
  marks: [
    Plot.barX(taxData, {
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

```sql
select * from taxonomy;
```
