#!/usr/bin/env bash

#Script to run Terraform configuration for Informed Delivery GCP Project

set -e

cd ../

if test -f ./main.tf; then

    PROJECT_ID=$(gcloud config get-value project)

    gcloud config set project $PROJECT_ID

    terraform init -reconfigure --backend-config="env_configs/$PROJECT_ID/backend.conf"

    if [[ $(terraform state list | grep google_bigquery_table.dashboard | wc -l) > 0 ]] ; then 
        terraform state rm -dry-run $(terraform state list | grep google_bigquery_table.dashboard)
    fi 
     
else
    echo "main.tf file not found. Exiting without making any changes."
fi
