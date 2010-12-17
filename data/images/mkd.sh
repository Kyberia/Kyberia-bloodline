#!/bin/bash

for ((i=0;i<10;i=i+1)); do
	mkdir "$i";
	cd "$i";
	for ((j=0;j<10;j=j+1)); do
		mkdir "$j";
	done
	cd ..;
done
