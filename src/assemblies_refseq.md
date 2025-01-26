---
title: NCBI Refseq Assemblies
toc: true
---

```js
import {DuckDBClient} from "npm:@observablehq/duckdb";
import {assemblies_by_year} from "./components/assemblies.js";
const db = await DuckDBClient.of({base: FileAttachment("data/sql/ncbi_stats.duckdb")});
```


## Assembly Count

```js
db.queryRow(`SELECT COUNT() as refseq_accessions FROM base.assembly_summary_refseq`)
```

</br>

## Excluded Reasons

Only high quality, representative assemblies are intended for inclusion in Refseq. Of the various assemblies in Genbank, here are the
reasons that some of those are not included within refseq.



```js
view(
  Inputs.table(db.query(`
    SELECT excluded_from_refseq, count(*) as refseq_accessions
    FROM base.assembly_summary_refseq
    GROUP BY excluded_from_refseq
    ORDER BY refseq_accessions DESC `)))
```


</br>

## Assembly Count By Year

```js
let yearly_deposit = db.query(`SELECT year, count(*) as count FROM base.assembly_summary_refseq GROUP BY year;`);
// view(Inputs.table(yearly_deposit));
```

```js
view(assemblies_by_year(yearly_deposit))
```



## Assembly Head

```js
view(
  Inputs.table(
    db.query(`select * from base.assembly_summary_refseq limit 100;`)));

```



## Submitters


### Top Submitters

```js
view(Inputs.table(db.query(`
  SELECT submitter, COUNT(*) as count
  FROM base.assembly_refseq
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
FROM base.assembly_summary_refseq
WHERE submitter LIKE '%${searchTerm}%'
GROUP BY submitter
ORDER BY submissioncounts DESC`)))
```
