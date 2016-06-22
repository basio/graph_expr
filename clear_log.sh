#!/bin/bash
		sudo rm -f /usr/local/hadoop/logs/*
		sudo rm -rf /usr/local/hadoop/logs/userlogs/* 

		
for HOST in graphsys-n01 graphsys-n02 graphsys-n03 graphsys-n04 graphsys-n05 graphsys-n06 graphsys-n07 graphsys-n08 graphsys-n09; do
	ssh  -t  mkhalefa@$HOST " 
		sudo rm -f /usr/local/hadoop/logs/*
		sudo rm -rf /usr/local/hadoop/logs/userlogs/* 
 	"
done


