#!/bin/bash

		
for HOST in graphsys-n01 graphsys-n02 graphsys-n03 graphsys-n04 graphsys-n05 graphsys-n06 graphsys-n07 graphsys-n08 graphsys-n09; do
	ssh  -t  mkhalefa@$HOST " 
		rm -f /home/mkhalefa/tmp_/userlogs.tgz
 		tar -czvhf /home/mkhalefa/tmp_/userlogs.tgz /usr/local/hadoop/logs/userlogs
	"
	scp mkhalefa@$HOST:/home/mkhalefa/tmp_/userlogs.tgz /data/logs/$HOST"_userlogs.tgz"
	tar -xzvf /data/logs/$HOST"_userlogs.tgz" -C /data/logs/
done


