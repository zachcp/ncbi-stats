---
title: NCBI Refseq Assemblies
toc: true
---

```js
import {DuckDBClient} from "npm:@observablehq/duckdb";
const db = await DuckDBClient.of({base: FileAttachment("data/sql/ncbi_stats.duckdb")});
```


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
import {assemblies_by_year} from "./components/assemblies.js";
view(assemblies_by_year(yearly_deposit))
```




## Assembly Head

```js
view(
  Inputs.table(
    db.query(`select * from base.assembly_summary_refseq limit 100;`)));

```
