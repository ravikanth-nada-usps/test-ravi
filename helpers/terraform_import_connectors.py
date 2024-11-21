import os, sys
import google.auth
from google.oauth2 import service_account  # type: ignore
import googleapiclient.discovery  # type: ignore
import argparse
import subprocess
import json 

def initTF(project_id):
    os.chdir(r'../')
    #os.system('pwd')
    os.system('terraform init -reconfigure --backend-config="env_configs/'+project_id+'/backend.conf"')


def getConfig(project_id, config_name):
    with open('env_configs/'+project_id+'/terraform.tfvars') as file:
        for line in file:
            if config_name in line:
                config_value = line.split("=")[1].replace('"', "").strip()  

    return config_value

def get_connectors(project_id):

    connector_map = {
        "rmin_dashboard_conn": "dashboard_serverless_conn_name",
        "rmin_peripheral_conn": "peripheral_serverless_conn_name",
        "rmin_email_conn": "email_serverless_conn_name",
        "rmin_serverless_conn": "rmin_serverless_conn_name",
        "idc_email_serverless": "idc_email_serverless_name",
        "rmin_e_servless_email": "rmin_e_servless_email_name",
        "rmin_api_conn": "rmin_api_conn_name"
    }
    try:
        regions = ['us-east4', 'us-central1']
        for region in regions:
            connectors = subprocess.check_output(["gcloud compute networks vpc-access connectors list --region="+region+" | grep -i CONNECTOR_ID | cut -d ' ' -f 2"],shell=True).decode('utf-8').splitlines()

            for key, value in connector_map.items():
                config_value = getConfig(project_id, value)   
                #print(key, "->", value, "->", config_value)
                for connector in connectors:                
                    if config_value == connector:
                        print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.connectors.google_vpc_access_connector.'+key +' ' +project_id+'/'+region+'/' +config_value)
                        os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.connectors.google_vpc_access_connector.'+key +' ' +project_id+'/'+region+'/' +config_value)
        
        
    except Exception as e:
        print(e)
        sys.exit()

def main():
    
    credentials, project_id = google.auth.default()
    initTF(project_id)
    get_connectors(project_id)

if __name__ == "__main__":
    main()
    