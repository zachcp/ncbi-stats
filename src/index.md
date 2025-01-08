---
title: NCBI Stats
toc: true
sql:
  assembly_stats: ./data/assembly_stats.parquet
  taxonomy: ./data/taxonomy.parquet
---


```sql
SELECT count(*) FROM assembly_stats;
```


```sql
SELECT * FROM assembly_stats LIMIT 10;
```
