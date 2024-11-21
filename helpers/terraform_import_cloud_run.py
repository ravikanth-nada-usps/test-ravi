#!/usr/bin/env python3

import os, sys
import google.auth
from google.oauth2 import service_account  # type: ignore
import googleapiclient.discovery  # type: ignore
import argparse
import subprocess

def initTF(project_id):
    os.chdir(r'../')
    #os.system('pwd')
    os.system('terraform init -reconfigure --backend-config="env_configs/'+project_id+'/backend.conf"')


def get_cloud_run(project_id):

    try:
        print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.cloud_run.google_cloud_run_v2_service.rmin_cloud_subscriber_api '+project_id+'/us-central1/rmin-cloud-subscriber-api')      
        os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.cloud_run.google_cloud_run_v2_service.rmin_cloud_subscriber_api '+project_id+'/us-central1/rmin-cloud-subscriber-api')

        print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.cloud_run.google_cloud_run_v2_service.rmin_cloud_dashboard_event_processor_run '+project_id+'/us-central1/rmin-cloud-dashboard-event-processor-run')        
        os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.cloud_run.google_cloud_run_v2_service.rmin_cloud_dashboard_event_processor_run '+project_id+'/us-central1/rmin-cloud-dashboard-event-processor-run')

        print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.cloud_run.google_cloud_run_v2_service.rmin_cloud_dashboard_api '+project_id+'/us-central1/rmin-cloud-dashboard-api')       
        os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.cloud_run.google_cloud_run_v2_service.rmin_cloud_dashboard_api '+project_id+'/us-central1/rmin-cloud-dashboard-api')

        print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.cloud_run.google_cloud_run_v2_service.rmin_cloud_dashboard_api_internal '+project_id+'/us-central1/rmin-cloud-dashboard-api-internal')       
        os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.cloud_run.google_cloud_run_v2_service.rmin_cloud_dashboard_api_internal '+project_id+'/us-central1/rmin-cloud-dashboard-api-internal')
        
        print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.cloud_run.google_cloud_run_v2_service.rmin_cloud_subscriber_event '+project_id+'/us-central1/rmin-cloud-subscriber-event')       
        os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.cloud_run.google_cloud_run_v2_service.rmin_cloud_subscriber_event '+project_id+'/us-central1/rmin-cloud-subscriber-event')
        
        print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.cloud_run.google_cloud_run_v2_service.rmin_mics_subscriber_extract '+project_id+'/us-central1/rmin-mics-subscriber-extract')     
        os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.cloud_run.google_cloud_run_v2_service.rmin_mics_subscriber_extract '+project_id+'/us-central1/rmin-mics-subscriber-extract')

        print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.cloud_run.google_cloud_run_v2_service.rmin_cloud_image_api '+project_id+'/us-central1/rmin-cloud-image-api')     
        os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.cloud_run.google_cloud_run_v2_service.rmin_cloud_image_api '+project_id+'/us-central1/rmin-cloud-image-api')

        print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.cloud_run.google_cloud_run_v2_service.rmin_cloud_mc_report_service '+project_id+'/us-central1/rmin-cloud-mc-report-service')     
        os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.cloud_run.google_cloud_run_v2_service.rmin_cloud_mc_report_service '+project_id+'/us-central1/rmin-cloud-mc-report-service')
        
        print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.cloud_run.google_cloud_run_v2_service.rmin_cloud_qr_code_service[0] '+project_id+'/us-central1/rmin-cloud-qr-code-service')     
        os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.cloud_run.google_cloud_run_v2_service.rmin_cloud_qr_code_service[0] '+project_id+'/us-central1/rmin-cloud-qr-code-service')

        print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.cloud_run.google_cloud_run_v2_service.rmin_cloud_consumer_portal_frontend[0] '+project_id+'/us-central1/rmin-cloud-consumer-portal-frontend')
        os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.cloud_run.google_cloud_run_v2_service.rmin_cloud_consumer_portal_frontend[0] '+project_id+'/us-central1/rmin-cloud-consumer-portal-frontend')

        print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.cloud_run.google_cloud_run_v2_service.rmin_cloud_digest_tracking[0] '+project_id+'/us-central1/rmin-cloud-digest-tracking')
        os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.cloud_run.google_cloud_run_v2_service.rmin_cloud_digest_tracking[0] '+project_id+'/us-central1/rmin-cloud-digest-tracking')

    except Exception as e:
        print(e)
        sys.exit()

def main():
    
    credentials, project_id = google.auth.default()
    initTF(project_id)
    get_cloud_run(project_id)

if __name__ == "__main__":
    main()
