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


def load_properties(project_id, sep='=', comment_char='#'):
    """
    Read the file passed as parameter as a properties file.
    """
    props = {}
    with open('env_configs/'+project_id+'/terraform.tfvars') as f:
        for line in f:
            l = line.strip()
            if l and not l.startswith(comment_char):
                key_value = l.split(sep)
                key = key_value[0].strip()
                value = sep.join(key_value[1:]).strip().strip('"') 
                props[key] = value 
    return props
    
def getConfig(project_id, config_name):
    with open('env_configs/'+project_id+'/terraform.tfvars') as file:
        for line in file:
            if config_name in line:
                config_value = line.split("=")[1].replace('"', "").strip()  

    return config_value

def get_subnetwork(project_id):

    subnetwork_map = {
    "rmin_dashboard_serverless": "rmin_dashboard_serverless_vpc_name",
    "rmin_peripheral": "rmin_peripheral_vpc_name",
    "rmin_email_serverless": "rmin_email_serverless_vpc_name",
    "rmin_peripheral_serverless": "rmin_peripheral_serverless_vpc_name",
    "rmin_e_dataflow_peripheral": "rmin_e_dataflow_peripheral_name",
    "rmin_e_dataflow_email": "rmin_e_dataflow_email_name",
    "rmin_e_serverless_connector": "rmin_e_serverless_connector_name",
    "rmin_e_serverless_email": "rmin_e_serverless_email_name",
    "idc_cloudrun_email_serverless": "idc_cloudrun_email_serverless_name",
    "rmin_api_serverless": "rmin_api_serverless_name"
    }
    try:
        regions = ['us-east4', 'us-central1']
        config_values = load_properties(project_id)
        for region in regions:
            subnetworks = subprocess.check_output(["gcloud compute networks subnets list --regions="+region+" | grep -i name | cut -d ' ' -f 2"],shell=True).decode('utf-8').splitlines()

            for key, value in subnetwork_map.items():
                config_value = getConfig(project_id, value) 
                #print(key, "->", value, "->", config_value)
                for subnet in subnetworks:            
                    if config_value == subnet:
                        print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.subnetwork.google_compute_subnetwork.'+key +' ' +project_id+'/'+region+'/' +config_value)
                        os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.subnetwork.google_compute_subnetwork.'+key +' ' +project_id+'/'+region+'/' +config_value)

        env = config_values.get('environment')
        proxy_name = "rmin-"+env+"-proxy"
        print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.subnetwork.google_compute_subnetwork.rmin_proxy' +' ' +project_id+'/'+region+'/' +proxy_name)
        os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.subnetwork.google_compute_subnetwork.rmin_proxy' +' ' +project_id+'/'+region+'/' +proxy_name)  
        
    except Exception as e:
        print(e)
        sys.exit()

def main():

    credentials, project_id = google.auth.default()
    initTF(project_id)
    get_subnetwork(project_id)

if __name__ == "__main__":
    main()
    
