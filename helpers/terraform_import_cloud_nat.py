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


def getConfigs(project_id):
    with open('env_configs/'+project_id+'/terraform.tfvars') as file:
        for line in file:
            if "cloud_nat_name" in line:
                cloud_nat_name = line.split("=")[1].replace('"', "").strip() 
            if "external_nat_ip_name" in line:
                external_nat_ip_name = line.split("=")[1].replace('"', "").strip() 
            if "router_name" in line:
                router_name = line.split("=")[1].replace('"', "").strip()                                

    return cloud_nat_name, external_nat_ip_name , router_name

def get_nat(project_id):

    try:
        cloud_nat_name, external_nat_ip_name , router_name = getConfigs(project_id)
        
        print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.cloud_nat.google_compute_address.external_nat_ip '  +project_id+'/us-east4/'+external_nat_ip_name )
        os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.cloud_nat.google_compute_address.external_nat_ip '  +project_id+'/us-east4/'+external_nat_ip_name )

        print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.cloud_nat.google_compute_router.router ' +project_id+'/us-east4/'+router_name)
        os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.cloud_nat.google_compute_router.router ' +project_id+'/us-east4/'+router_name)
                
        print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.cloud_nat.google_compute_router_nat.cloud_nat us-east4/'+router_name+'/'+cloud_nat_name)
        os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.cloud_nat.google_compute_router_nat.cloud_nat us-east4/'+router_name+'/'+cloud_nat_name)
                        
    except Exception as e:
        print(e)
        sys.exit()

def main():
    
    credentials, project_id = google.auth.default()
    initTF(project_id)
    get_nat(project_id)

if __name__ == "__main__":
    main()
    