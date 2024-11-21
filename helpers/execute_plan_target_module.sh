#!/usr/bin/env bash

#Script to run Terraform configuration for Informed Delivery GCP Project

export TZ="EST"
export TF_CLI_ARGS_plan="$TF_CLI_ARGS_plan -compact-warnings"
export TF_CLI_ARGS_apply="$TF_CLI_ARGS_apply -compact-warnings"

set -e

cd ../

function usage {
  echo "No module name was passed in."
  echo "usage: $0 [module.module_name]"
  echo "e.g.: $0 [module.pubsub]"
}

if [[ -n "$1" ]]; then
    :
else
    usage
    exit
fi

if test -f ./main.tf; then

    PROJECT_ID=$(gcloud config get-value project)

    gcloud config set project $PROJECT_ID

    terraform init -reconfigure --backend-config="env_configs/$PROJECT_ID/backend.conf"
    if test -f ./tfplan; then
        echo "Removing tfplan file."
        echo ""
        rm -f tfplan
    fi
    
    echo "Executing 'terraform plan'..."
    echo ""
    terraform plan -target="$1" --var-file="env_configs/$PROJECT_ID/terraform.tfvars" -out tfplan |& tee tfplan-$PROJECT_ID-output.log
    # Removing colorized output from log file
    sed -i 's/\x1b\[[0-9;]*[mGKHF]//g' tfplan-$PROJECT_ID-output.log
    
    gsutil cp tfplan-$PROJECT_ID-output.log gs://$PROJECT_ID-tfstate/logs/tfplan-$PROJECT_ID-output-$(date -d "today" +"%Y-%m-%d_%H%M%S").log
    
else
    echo "main.tf file not found. Exiting without making any changes."
fi
