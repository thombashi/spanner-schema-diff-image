# spanner-schema-diff-image

Docker images for [spanner-schema-diff-tool](https://github.com/cloudspannerecosystem/spanner-schema-diff-tool)

## Usage

```
docker pull ghcr.io/thombashi/spanner-ddl-diff
```

```
docker run --rm \
    -u $(id -u):$(id -g) \
    --mount type=bind,source="$(pwd)"/examples,target=/work \
    thombashi/spanner-ddl-diff:$TAG \
    --allowDropStatements \
    --allowRecreateConstraints \
    --allowRecreateIndexes \
    --originalDdlFile /work/org.ddl \
    --newDdlFile /work/new.ddl \
    --outputDdlFile /work/diff.ddl
```

```sql
$ cat examples/diff.ddl
DROP INDEX index1;

ALTER TABLE test1 DROP COLUMN col6;

ALTER TABLE test1 ADD COLUMN newcol7 BYTES(100);

ALTER TABLE test1 ALTER COLUMN col2 INT64 NOT NULL;

ALTER TABLE test1 ALTER COLUMN col3 STRING(MAX);

ALTER TABLE test1 ALTER COLUMN col4 ARRAY<STRING(200)>;

CREATE INDEX index1 ON test1 (col2 ASC);
```
