---
title: NCBI Genbank Assemblies (RefSeq)
toc: true
sql:
  assembly_stats_refseq: ./data/assembly_stats_refseq.parquet
---


## Assembly Count

```sql
SELECT count(*) FROM assembly_stats_refseq;
```

```sql
SELECT excluded_from_refseq, count(*) FROM assembly_stats_refseq GROUP BY excluded_from_refseq;
```


```sql
SELECT *
FROM assembly_stats_refseq
WHERE excluded_from_refseq = 'from large multi-isolate project';
```

## Assembly Count By Year

```sql  id=by_year
SELECT year, count(*) as count FROM assembly_stats_refseq GROUP BY year;
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
SELECT * FROM assembly_stats_refseq LIMIT 10;
```
