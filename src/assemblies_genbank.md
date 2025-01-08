---
title: NCBI Genbank Assemblies (Genbank)
toc: true
sql:
  assembly_stats_genbank: ./data/assembly_stats_genbank.parquet
---


## Assembly Count

```sql
SELECT count(*) FROM assembly_stats_genbank;
```

```sql
SELECT excluded_from_refseq, count(*) FROM assembly_stats_genbank GROUP BY excluded_from_refseq;
```


```sql
SELECT *
FROM assembly_stats_genbank
WHERE excluded_from_refseq = 'from large multi-isolate project';
```

## Assembly Count By Year

```sql  id=by_year
SELECT year, count(*) as count FROM assembly_stats_genbank GROUP BY year;
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
SELECT * FROM assembly_stats_genbank LIMIT 10;
```


## Contributors

### Top Contributors

```sql
select * from histogram(assembly_stats_genbank, submitter);
```

### All Contributors

```js
const searchTerm = view(Inputs.text({
  label: "Search submitters:",
  placeholder: "Enter submitter name"
}))
```

```sql
SELECT submitter, count(*) as submissioncounts
FROM assembly_stats_genbank
WHERE submitter LIKE ${'%' + searchTerm + '%'}
GROUP BY submitter
ORDER BY submissioncounts DESC
```
