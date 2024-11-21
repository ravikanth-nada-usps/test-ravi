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
            if "rmin_e_vpc_name" in line:
                rmin_e_vpc_name = line.split("=")[1].replace('"', "").strip() 
            if "rmin_e_pvt_svc_connection_name" in line:
                rmin_e_pvt_svc_connection_name = line.split("=")[1].replace('"', "").strip() 
                              

    return rmin_e_vpc_name, rmin_e_pvt_svc_connection_name

def get_vpc(project_id):

    try:
        rmin_e_vpc_name, rmin_e_pvt_svc_connection_name = getConfigs(project_id)
        
        print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.vpc.google_compute_network.rmin_e_vpc ' +project_id+'/'+rmin_e_vpc_name )
        os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.vpc.google_compute_network.rmin_e_vpc ' +project_id+'/'+rmin_e_vpc_name)

        print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.vpc.google_compute_firewall.default_dataflow_rule ' +project_id+'/default-dataflow-rule')
        os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.vpc.google_compute_firewall.default_dataflow_rule ' +project_id+'/default-dataflow-rule')
                
        print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.vpc.google_compute_global_address.rmin_e_pvt_svc_connection '+project_id+'/'+rmin_e_pvt_svc_connection_name)
        os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.vpc.google_compute_global_address.rmin_e_pvt_svc_connection '+project_id+'/'+rmin_e_pvt_svc_connection_name)

        print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.vpc.google_compute_global_address.rmin_psc_ip_cloud_sql '+project_id+'/rmin-psc-ip-cloud-sql')
        os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.vpc.google_compute_global_address.rmin_psc_ip_cloud_sql '+project_id+'/rmin-psc-ip-cloud-sql')

        print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.vpc.google_compute_global_address.rmin_psc_ip_cloud_sql_central '+project_id+'/rmin-psc-ip-cloud-sql-central')
        os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.vpc.google_compute_global_address.rmin_psc_ip_cloud_sql_central '+project_id+'/rmin-psc-ip-cloud-sql-central')

        print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.vpc.google_compute_global_address.rmin_psc_ip_redis_central '+project_id+'/rmin-psc-ip-redis-central')
        os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.vpc.google_compute_global_address.rmin_psc_ip_redis_central '+project_id+'/rmin-psc-ip-redis-central')
        
        print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.vpc.google_service_networking_connection.default '+rmin_e_vpc_name+':servicenetworking.googleapis.com')
        os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.vpc.google_service_networking_connection.default '+rmin_e_vpc_name+':servicenetworking.googleapis.com')
        
    except Exception as e:
        print(e)
        sys.exit()

def main():
    
    credentials, project_id = google.auth.default()
    initTF(project_id)
    get_vpc(project_id)

if __name__ == "__main__":
    main()
    