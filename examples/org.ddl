create table test1
(
    col1 int64,
    col2 int64,
    col3 STRING(100),
    col4 ARRAY<STRING(100)>,
    col5 float64 not null,
    col6 timestamp
) primary key (col1 desc);

create index index1 on test1 (col1);
