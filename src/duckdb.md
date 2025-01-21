---
title: DUCKDB NCBI Stats
toc: true
---




```js
import * as duckdb from "npm:@duckdb/duckdb-wasm";
import {DuckDBClient} from "npm:@observablehq/duckdb";

const db = await DuckDBClient.of({base: FileAttachment("data/sql/ncbi_stats.duckdb")});
```


```js
db.queryRow(`SELECT COUNT() as taxa FROM base.ncbi_taxonomy`)
```


```js
db.queryRow(`SELECT COUNT() as genbank_accessions FROM base.assembly_summary_genbank`)
```


```js
db.queryRow(`SELECT COUNT() as refseq_accessions FROM base.assembly_summary_refseq`)
```
