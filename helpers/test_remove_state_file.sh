#!/usr/bin/env bash

function usage {
  echo "No string passed in to search for."
  echo "usage: $0 [string]"
}

if [[ -n "$1" ]]; then
    :
else
    usage
fi

set -e

cd ../

if test -f ./main.tf; then

    PROJECT_ID=$(gcloud config get-value project)

    gcloud config set project $PROJECT_ID

    terraform init -reconfigure --backend-config="env_configs/$PROJECT_ID/backend.conf"

    if [[ $(terraform state list | grep "$1" | wc -l) > 0 ]] ; then 
        terraform state rm -dry-run $(terraform state list | grep "$1")
    fi 
    
else
    echo "main.tf file not found. Exiting without making any changes."
fi
