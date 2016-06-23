#!/bin/bash

filename="$1"
graphid="$2"

awk '{if ($1=="a") print $2,$3}' $filename |awk -v gid="${graphid}" '{ print "insert ignore into graph values (",gid,",",$1,",",$2,");"}'
