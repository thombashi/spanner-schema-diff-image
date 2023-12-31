# spanner-schema-diff-image

[![Build and publish Docker images](https://github.com/thombashi/spanner-schema-diff-image/actions/workflows/build_and_release.yml/badge.svg)](https://github.com/thombashi/spanner-schema-diff-image/actions/workflows/build_and_release.yml)

Docker images for [spanner-schema-diff-tool](https://github.com/cloudspannerecosystem/spanner-schema-diff-tool)

## Usage

```
docker pull ghcr.io/thombashi/spanner-ddl-diff:2e77d45
```

The image tag represents the short commit hash of the [spanner-schema-diff-tool](https://github.com/cloudspannerecosystem/spanner-schema-diff-tool) repository.

```
$ docker run --rm \
    -u $(id -u):$(id -g) \
    --mount type=bind,source="$(pwd)"/examples,target=/work \
    ghcr.io/thombashi/spanner-ddl-diff:$TAG \
    --allowDropStatements \
    --allowRecreateConstraints \
    --allowRecreateIndexes \
    --originalDdlFile /work/org.ddl \
    --newDdlFile /work/new.ddl \
    --outputDdlFile /work/diff.ddl
$ cat examples/diff.ddl
```

```sql
DROP INDEX index1;

ALTER TABLE test1 DROP COLUMN col6;

ALTER TABLE test1 ADD COLUMN newcol7 BYTES(100);

ALTER TABLE test1 ALTER COLUMN col2 INT64 NOT NULL;

ALTER TABLE test1 ALTER COLUMN col3 STRING(MAX);

ALTER TABLE test1 ALTER COLUMN col4 ARRAY<STRING(200)>;

CREATE INDEX index1 ON test1 (col2 ASC);
```
