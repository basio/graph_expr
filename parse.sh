#!/bin/bash

#echo "$1"
JD="$1"
DIR="/data/logs"
find "$DIR" -type d -name "job*$JD" -exec grep startSuperstep -r {} \;|grep Ready|awk  '{ gsub(":"," ",$1); print $1,$2,$12}'|sed -e 's/\(.*\)job_\(.*\)_\(.*\)\/\(.*\)m_\(.*\)_0\/syslog/job \3 attempt \5/'| awk '{ gsub(",",".",$6); print "insert into start_superstep values(",$2,",",$4,",\"",$5,$6,"\",",$7,");"}'|sed 's/\" /\"/g'|sed 's/ \"/\"/g'
find "$DIR" -type d -name "job*$JD" -exec grep finishSuperstep -r {} \;|grep BASIO|awk  '{ gsub(":"," ",$1); print $1,$2,$9}'|sed -e 's/\(.*\)job_\(.*\)_\(.*\)\/\(.*\)m_\(.*\)_0\/syslog/job \3 attempt \5/'|awk '{ gsub(",",".",$6); print "insert into finish_superstep values(",$2,",",$4,",\"",$5,$6,"\",",$7,");"}'|sed 's/\" /\"/g'|sed 's/ \"/\"/g'
find "$DIR" -type d -name "job*$JD" -exec grep "BASIO start vertex" -r {} \;|awk  '{ gsub(":"," ",$1); gsub("-",";",$8); print $1,$2,$8,$12}'|sed -e 's/\(.*\)job_\(.*\)_\(.*\)\/\(.*\)m_\(.*\)_0\/syslog/job \3 attempt \5/' |   awk -F'[ ;]' '{gsub(",",".",$6);gsub(" ","",$2); print "insert into start_vertex values (",$2, ",", $4,",\"",$5,$6,"\",",$8,",",$9,");";}' |sed 's/\" /\"/g'|sed 's/ \"/\"/g'
find "$DIR" -type d -name "job*$JD" -exec grep "BASIO end vertex" -r {} \;|awk  '{ gsub(":"," ",$1); gsub("-",";",$8); print $1,$2,$8,$12}'|sed -e 's/\(.*\)job_\(.*\)_\(.*\)\/\(.*\)m_\(.*\)_0\/syslog/job \3 attempt \5/' |   awk -F'[ ;]' '{gsub(",",".",$6);gsub(" ","",$2); print "insert into finish_vertex values (",$2, ",", $4,",\"",$5,$6,"\",",$8,",",$9,");";}' |sed 's/\" /\"/g'|sed 's/ \"/\"/g'
find "$DIR" -type d -name "job*$JD" -exec grep "BASIO halt vertex" -r {} \;|awk  '{ gsub(":"," ",$1); gsub("-",";",$8); print $1,$2,$8,$12}'|sed -e 's/\(.*\)job_\(.*\)_\(.*\)\/\(.*\)m_\(.*\)_0\/syslog/job \3 attempt \5/' |awk -F'[ ;]' '{gsub(",",".",$6);gsub(" ","",$2); print "insert into halt_vertex values (",$2, ",", $4,",\"",$5,$6,"\",",$8,",",$9,");";}' |sed 's/\" /\"/g'|sed 's/ \"/\"/g'

#grep startSuperstep -r "$1"|grep Ready|awk  '{ gsub(":"," ",$1); print $1,$2,$11}'|sed -e 's/\(.*\)job_\(.*\)_\(.*\)\/\(.*\)m_\(.*\)_0\/syslog/job \3 attempt \5/'| awk '{ gsub(",",".",$6); print "insert into start_superstep values(",$2,",",$4,",\"",$5,$6,"\",",$7,");"}'|sed 's/\" /\"/g'|sed 's/ \"/\"/g'
#grep finishSuperStep -r "$1"|grep BASIO|awk  '{ gsub(":"," ",$1); print $1,$2,$8}'|sed -e 's/\(.*\)job_\(.*\)_\(.*\)\/\(.*\)m_\(.*\)_0\/syslog/job \3 attempt \5/'|awk '{ gsub(",",".",$6); print "insert into finish_superstep values(",$2,",",$4,",\"",$5,$6,"\",",$7,");"}'|sed 's/\" /\"/g'|sed 's/ \"/\"/g'
#grep "BASIO start vertex" -r "$1"|awk  '{ gsub(":"," ",$1); gsub("-",";",$8); print $1,$2,$8,$12}'|sed -e 's/\(.*\)job_\(.*\)_\(.*\)\/\(.*\)m_\(.*\)_0\/syslog/job \3 attempt \5/' |   awk -F'[ ;]' '{gsub(",",".",$6);gsub(" ","",$2); print "insert into start_vertex values (",$2, ",", $4,",\"",$5,$6,"\",",$8,",",$9,");";}' |sed 's/\" /\"/g'|sed 's/ \"/\"/g'
#grep "BASIO end vertex" -r "$1"|awk  '{ gsub(":"," ",$1); gsub("-",";",$8); print $1,$2,$8,$12}'|sed -e 's/\(.*\)job_\(.*\)_\(.*\)\/\(.*\)m_\(.*\)_0\/syslog/job \3 attempt \5/' |   awk -F'[ ;]' '{gsub(",",".",$6);gsub(" ","",$2); print "insert into finish_vertex values (",$2, ",", $4,",\"",$5,$6,"\",",$8,",",$9,");";}' |sed 's/\" /\"/g'|sed 's/ \"/\"/g'
#grep "BASIO halt vertex" -r "$1"|awk  '{ gsub(":"," ",$1); gsub("-",";",$8); print $1,$2,$8,$12}'|sed -e 's/\(.*\)job_\(.*\)_\(.*\)\/\(.*\)m_\(.*\)_0\/syslog/job \3 attempt \5/' |awk -F'[ ;]' '{gsub(",",".",$6);gsub(" ","",$2); print "insert into halt_vertex values (",$2, ",", $4,",\"",$5,$6,"\",",$8,",",$9,");";}' |sed 's/\" /\"/g'|sed 's/ \"/\"/g'

#grep startSuperstep -r "$1"|grep Ready|awk  '{ gsub(":"," ",$1); print $1,$2,$11}'|sed -e 's/\(.*\)job_\(.*\)_\(.*\)\/\(.*\)m_\(.*\)_0\/syslog/job \2_\3 attempt \5/'| awk '{ gsub(",",".",$6); print "insert into start_superstep values(\"",$2,"\",",$4,",\"",$5,$6,"\",",$7,");"}'|sed 's/\" /\"/g'|sed 's/ \"/\"/g'
#grep finishSuperStep -r "$1"|grep BASIO|awk  '{ gsub(":"," ",$1); print $1,$2,$8}'|sed -e 's/\(.*\)job_\(.*\)_\(.*\)\/\(.*\)m_\(.*\)_0\/syslog/job \2_\3 attempt \5/'|awk '{ gsub(",",".",$6); print "insert into finish_superstep values(\"",$2,"\",",$4,",\"",$5,$6,"\",",$7,");"}'|sed 's/\" /\"/g'|sed 's/ \"/\"/g'
#grep "BASIO start vertex" -r "$1"|awk  '{ gsub(":"," ",$1); gsub("-",";",$8); print $1,$2,$8,$12}'|sed -e 's/\(.*\)job_\(.*\)_\(.*\)\/\(.*\)m_\(.*\)_0\/syslog/job \2_\3 attempt \5/' |   awk -F'[ ;]' '{gsub(",",".",$6);gsub(" ","",$2); print "insert into start_vertex values (\"",$2, "\",", $4,",\"",$5,$6,"\",",$8,",",$9,")";}' |sed 's/\" /\"/g'|sed 's/ \"/\"/g'
#grep "BASIO end vertex" -r "$1"|awk  '{ gsub(":"," ",$1); gsub("-",";",$8); print $1,$2,$8,$12}'|sed -e 's/\(.*\)job_\(.*\)_\(.*\)\/\(.*\)m_\(.*\)_0\/syslog/job \2_\3 attempt \5/' |   awk -F'[ ;]' '{gsub(",",".",$6);gsub(" ","",$2); print "insert into end_vertex values (\"",$2, "\",", $4,",\"",$5,$6,"\",",$8,",",$9,")";}' |sed 's/\" /\"/g'|sed 's/ \"/\"/g'
#grep "BASIO halt vertex" -r "$1"|awk  '{ gsub(":"," ",$1); gsub("-",";",$8); print $1,$2,$8,$12}'|sed -e 's/\(.*\)job_\(.*\)_\(.*\)\/\(.*\)m_\(.*\)_0\/syslog/job \2_\3 attempt \5/' |awk -F'[ ;]' '{gsub(",",".",$6);gsub(" ","",$2); print "insert into halt_vertex values (\"",$2, "\",", $4,",\"",$5,$6,"\",",$8,",",$9,")";}' |sed 's/\" /\"/g'|sed 's/ \"/\"/g'




#sed -e 's/\(.*\)job_\(.*\)_\(.*\)\/\(.*\)m_\(.*\)_0\/syslog/job \2_\3 attempt \5/'







