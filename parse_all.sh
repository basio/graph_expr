#!/bin/bash


./parse.sh 10 |grep -v ",  ," >/data/sql/10.sql
./parse.sh 13 |grep -v ",  ," >/data/sql/13.sql
# ./parse.sh 14 |grep -v ",  ," >/data/sql/14.sql




