create database 1m;
use 1m;

source SQL/create.sql
SET autocommit=0;
source /data/sql/g1m.sql
commit;
SET autocommit=0;
source /data/sql/14.sql
commit;
SET autocommit=0;

source SQL/process.sql

Commit;

