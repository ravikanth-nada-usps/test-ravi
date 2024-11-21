#!/bin/bash

PROJECT=$(gcloud config get-value project)
PROJECT_NUM=$(gcloud projects describe $PROJECT --format="value(projectNumber)")
BUCKET=$(gcloud storage buckets list | grep -i name | grep -i rmin-template-bucket | cut -d ' ' -f 2)
SUFFIX=${PROJECT:0-3}

if [[ -n "$1" ]]; then
    gsutil -m cp ../modules/dataflow_jobconfigs/jsons/"$1"-config-${SUFFIX}-*.json gs://$BUCKET/jobconfigs/
else
    gsutil -m cp ../modules/dataflow_jobconfigs/jsons/*-${SUFFIX}-*.json gs://$BUCKET/jobconfigs/
fi

