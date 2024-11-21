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
            if line.strip().startswith(config_name):
                config_value = line.split("=")[1].replace('"', "").strip()  
                
    return config_value

def get_sql(project_id):

    try:

        sql_instances = subprocess.check_output(["gcloud sql instances list | grep -i name | cut -d ' ' -f 2"],shell=True).decode('utf-8').splitlines()
        
        terraform_module = "cloudsql_digest"
        instance_module_name = "digest_db_instance"
        db_module_name ="rmin_digest_db"
        db_name = "rmin_digest_db" 
        db_user_module_name = "rmin_digest_db_user"        
        db_user_secret_module_name = "rmin_digest_db_user_secret" 
        db_root_secret_module_name = "digest_db_instance_root_serect"  
        db_user_secret_ver_module_name = "rmin_digest_db_user_secret_latest" 
        db_root_secret_ver_module_name = "digest_db_instance_root_serect_latest" 
        bq_conn_module_name = "rmin_digest_db_external_connection"        
        env = getConfig(project_id, "environment")
        instance_name = "idc-"+env+"-rmin-digest"
        db_user = getConfig(project_id, "rmin_digest_db_user_name")
        db_user_secret_id = "rmin-digest-"+db_user+"-key"
        root_secret_id = "rmin-digest-postgres-key"
        bq_location = "us-central1"
        bq_connection_id = "rmin_digest_db_connection"
        
        if instance_name in sql_instances:
            #import instance 
            print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.'+terraform_module+'.google_sql_database_instance.'+instance_module_name+' projects/'+project_id+'/instances/'+instance_name)
            os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.'+terraform_module+'.google_sql_database_instance.'+instance_module_name+' projects/'+project_id+'/instances/'+instance_name)   

            #import database 
            print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.'+terraform_module+'.google_sql_database.'+db_module_name+' projects/'+project_id+'/instances/'+instance_name+'/databases/'+db_name)
            os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.'+terraform_module+'.google_sql_database.'+db_module_name+' projects/'+project_id+'/instances/'+instance_name+'/databases/'+db_name)

            #import user 
            print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.'+terraform_module+'.google_sql_user.'+db_user_module_name+' ' +project_id+'/'+instance_name+'/'+db_user)
            os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.'+terraform_module+'.google_sql_user.'+db_user_module_name+' ' +project_id+'/'+instance_name+'/'+db_user)            
            #import secrets 
            print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.'+terraform_module+'.google_secret_manager_secret.'+db_user_secret_module_name+' projects/'+project_id+'/secrets/'+db_user_secret_id)
            os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.'+terraform_module+'.google_secret_manager_secret.'+db_user_secret_module_name+' projects/'+project_id+'/secrets/'+db_user_secret_id) 
 
            print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.'+terraform_module+'.google_secret_manager_secret.'+db_root_secret_module_name+' projects/'+project_id+'/secrets/'+root_secret_id)
            os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.'+terraform_module+'.google_secret_manager_secret.'+db_root_secret_module_name+' projects/'+project_id+'/secrets/'+root_secret_id) 

            #import secrets version          
            user_secret_version = subprocess.check_output(["gcloud secrets versions list "+db_user_secret_id+" --limit=1 --sort-by=name | grep -i name  | cut -d ' ' -f 2"],shell=True).decode('utf-8')
            
            root_secret_version = subprocess.check_output(["gcloud secrets versions list "+root_secret_id+" --limit=1 --sort-by=name | grep -i name  | cut -d ' ' -f 2"],shell=True).decode('utf-8')
            
            print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.'+terraform_module+'.google_secret_manager_secret_version.'+db_user_secret_ver_module_name+' projects/'+project_id+'/secrets/'+db_user_secret_id+'/versions/'+user_secret_version)
            os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.'+terraform_module+'.google_secret_manager_secret_version.'+db_user_secret_ver_module_name+' projects/'+project_id+'/secrets/'+db_user_secret_id+'/versions/'+user_secret_version) 
 
            print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.'+terraform_module+'.google_secret_manager_secret_version.'+db_root_secret_ver_module_name+' projects/'+project_id+'/secrets/'+root_secret_id+'/versions/'+root_secret_version)
            os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.'+terraform_module+'.google_secret_manager_secret_version.'+db_root_secret_ver_module_name+' projects/'+project_id+'/secrets/'+root_secret_id+'/versions/'+root_secret_version)
            
            #import bq connection 
            print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.'+terraform_module+'.google_bigquery_connection.'+bq_conn_module_name+' projects/'+project_id+'/locations/'+bq_location+'/connections/'+bq_connection_id)
            os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.'+terraform_module+'.google_bigquery_connection.'+bq_conn_module_name+' projects/'+project_id+'/locations/'+bq_location+'/connections/'+bq_connection_id)
            
    except Exception as e:
        print(e)
        sys.exit()

def main():
    
    credentials, project_id = google.auth.default()
    initTF(project_id)
    get_sql(project_id)

if __name__ == "__main__":
    main()
    