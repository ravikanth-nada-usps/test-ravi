#!/bin/bash

#Script to remove existing schedules in preperation for terraform import
 
REGIONS=( us-east4 us-central1 )

PROJECT=$(gcloud config get-value project)

for REGION in "${REGIONS[@]}"
    do
		gcloud config set project $PROJECT
	
	    SCHEDULES=( $(gcloud scheduler jobs list --location=$REGION | grep -i id | cut -d ' ' -f 2) )
		for i in "${SCHEDULES[@]}"
			do
				gcloud scheduler jobs delete $i --location=$REGION	--quiet	
		done        
done
