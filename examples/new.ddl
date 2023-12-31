create table test1
(
    col1    int64,
    col2    int64   NOT NULL,
    col3    STRING( MAX),
    col4    ARRAY<STRING(200)>,
    col5    float64 not null,
    newcol7 BYTES(100)
) primary key (col1 desc);

create index index1 on test1 (col2);
