#!/usr/bin/env bash

#Script to run Terraform configuration for Informed Delivery GCP Project

export TZ="EST"
export TF_CLI_ARGS_plan="$TF_CLI_ARGS_plan -compact-warnings"
export TF_CLI_ARGS_apply="$TF_CLI_ARGS_apply -compact-warnings"

set -e

cd ../

if test -f ./main.tf; then

    PROJECT_ID=$(gcloud config get-value project)
    
    echo "Executing 'terraform apply'..."
    echo ""
    
    terraform apply tfplan |& tee tfapply-$PROJECT_ID-output.log   
    # Removing colorized output from log file
    sed -i 's/\x1b\[[0-9;]*[mGKHF]//g' tfapply-$PROJECT_ID-output.log

    gsutil cp tfapply-$PROJECT_ID-output.log gs://$PROJECT_ID-tfstate/logs/tfapply-$PROJECT_ID-output-$(date -d "today" +"%Y-%m-%d_%H%M%S").log
     
else
    echo "main.tf file not found. Exiting without making any changes."
fi
