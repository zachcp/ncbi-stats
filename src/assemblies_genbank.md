---
title: NCBI Genbank Assemblies
toc: true
---


```js
import {DuckDBClient} from "npm:@observablehq/duckdb";
import {assemblies_by_year} from "./components/assemblies.js";
const db = await DuckDBClient.of({base: FileAttachment("data/sql/ncbi_stats.duckdb")});
```


## Assembly Count

```js
db.queryRow(`SELECT COUNT() as refseq_accessions FROM base.assembly_summary_genbank`)
```


```js
db.queryRow(`SELECT excluded_from_refseq, count(*) FROM base.assembly_summary_genbank GROUP BY excluded_from_refseq`)
```




## Excluded Reasons

```js
view(
  Inputs.table(db.query(`
    SELECT excluded_from_refseq, count(*) as refseq_accessions
    FROM base.assembly_summary_genbank
    GROUP BY excluded_from_refseq
    ORDER BY refseq_accessions DESC `)))
```


## Assembly Count By Year

```js
let yearly_deposit = db.query(`SELECT year, count(*) as count FROM base.assembly_summary_genbank GROUP BY year;`);
view(assemblies_by_year(yearly_deposit))
```

## Assembly Head

```js
view(
  Inputs.table(
    db.query(`select * from base.assembly_summary_genbank limit 100;`)));

```

## Submitters

### Top Submitters

```js
view(Inputs.table(db.query(`
  SELECT submitter, COUNT(*) as count
  FROM base.assembly_summary_genbank
  GROUP BY submitter
  ORDER BY count DESC;`)))
```



### All Submitters

```js
const searchTerm = view(Inputs.text({
  label: "Search submitters:",
  placeholder: "Enter submitter name"
}))
```

```js

view(Inputs.table(db.query(`
SELECT submitter, count(*) as submissioncounts
FROM base.assembly_summary_genbank
WHERE submitter LIKE '%${searchTerm}%'
GROUP BY submitter
ORDER BY submissioncounts DESC`)))
```
