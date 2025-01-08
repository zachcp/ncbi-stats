---
title: NCBI Stats
toc: true
sql:
  assembly_stats: ./data/assembly_stats.parquet
  taxonomy: ./data/taxonomy.parquet
---


## Assembly Count

```sql
SELECT count(*) FROM assembly_stats;
```

```sql
SELECT excluded_from_refseq, count(*) FROM assembly_stats GROUP BY excluded_from_refseq;
```


```sql
SELECT *
FROM assembly_stats
WHERE excluded_from_refseq = 'from large multi-isolate project';
```

## Assembly Count By Year

```sql  id=by_year
SELECT year, count(*) as count FROM assembly_stats GROUP BY year;
```

```js
Plot.plot({
  marks: [
    Plot.line(by_year, {
      x: "year",
      y: "count"
    }),
    Plot.dot(by_year, {
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

```sql
SELECT * FROM assembly_stats LIMIT 10;
```


## Taxonomy Head

```sql
SELECT * FROM taxonomy LIMIT 10;
```
