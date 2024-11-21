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
               
        env = getConfig(project_id, "environment")
        digest_db_user = getConfig(project_id, "rmin_digest_db_user_name")
        mdn_db_user = getConfig(project_id, "rmin_mdn_db_user_name")
        name_suffix = getConfig(project_id, "name_suffix")
        
        # Get password for db secrets in Cloud 
        mdn_secret_version = subprocess.check_output(["gcloud secrets versions list  rmin-mail-delivery-notification-"+mdn_db_user+"-key-c --filter=state='ENABLED' --limit=1 --format='csv[no-heading](name)' "],shell=True).decode('utf-8').splitlines()
        mdn_secret_version = mdn_secret_version[0]

        digest_secret_version = subprocess.check_output(["gcloud secrets versions list  rmin-digest-"+digest_db_user+"-key --filter=state='ENABLED' --limit=1 --format='csv[no-heading](name)' "],shell=True).decode('utf-8').splitlines()        
        digest_secret_version = digest_secret_version[0]
        
        mdn_db_pass = subprocess.check_output(["gcloud secrets versions access "+mdn_secret_version+" --secret=rmin-mail-delivery-notification-"+mdn_db_user+"-key-c "],shell=True).decode('utf-8').splitlines()       
        mdn_db_pass = mdn_db_pass[0]
        digest_db_pass = subprocess.check_output(["gcloud secrets versions access "+digest_secret_version+" --secret=rmin-digest-"+digest_db_user+"-key "],shell=True).decode('utf-8').splitlines()       
        digest_db_pass = digest_db_pass[0] 
        
        
        #  Get State File
        os.system('gsutil cp gs://'+project_id+'-tfstate/terraform/state/default.tfstate .')
        
        # Retrieve JSON data from the file
        with open("default.tfstate", "r") as file:
            data = json.load(file)
        file.close()

        # Update JSON data        
        for i in range(len(data["resources"])):
            if 'module' in data["resources"][i].keys():
                if data["resources"][i]["module"] == "module.cloudsql_mdn":
                    # print(data["resources"][i])
                    if data["resources"][i]["type"] == "google_bigquery_connection":
                        curr_pass_value = data["resources"][i]["instances"][0]["attributes"]["cloud_sql"][0]["credential"][0]["password"]
                        curr_user_value = data["resources"][i]["instances"][0]["attributes"]["cloud_sql"][0]["credential"][0]["username"]                       
                        if curr_pass_value == "":
                           data["resources"][i]["instances"][0]["attributes"]["cloud_sql"][0]["credential"][0]["password"] = mdn_db_pass  
                        if curr_user_value == "":
                           data["resources"][i]["instances"][0]["attributes"]["cloud_sql"][0]["credential"][0]["username"] = mdn_db_user 
                    
                    if data["resources"][i]["name"] == "rmin_mdn_db_user_secret_latest":
                        curr_pass_value = data["resources"][i]["instances"][0]["attributes"]["secret_data"]                        
                        if curr_pass_value == "":
                           data["resources"][i]["instances"][0]["attributes"]["secret_data"] = mdn_db_pass 
                    
                    if data["resources"][i]["type"] == "google_sql_user":
                        curr_pass_value = data["resources"][i]["instances"][0]["attributes"]["password"]    
                        curr_user_value = data["resources"][i]["instances"][0]["attributes"]["name"]

                        if curr_pass_value == "":
                           data["resources"][i]["instances"][0]["attributes"]["password"] = mdn_db_pass 
                        if curr_user_value == "":
                           data["resources"][i]["instances"][0]["attributes"]["name"] = mdn_db_user
                                                                         
                if  data["resources"][i]["module"] == "module.cloudsql_digest":

                    if data["resources"][i]["type"] == "google_bigquery_connection":
                        curr_pass_value = data["resources"][i]["instances"][0]["attributes"]["cloud_sql"][0]["credential"][0]["password"]
                        curr_user_value = data["resources"][i]["instances"][0]["attributes"]["cloud_sql"][0]["credential"][0]["username"]                       
                        if curr_pass_value == "":
                           data["resources"][i]["instances"][0]["attributes"]["cloud_sql"][0]["credential"][0]["password"] = digest_db_pass 
                        if curr_user_value == "":
                           data["resources"][i]["instances"][0]["attributes"]["cloud_sql"][0]["credential"][0]["username"] = digest_db_user
                    
                    if data["resources"][i]["name"] == "rmin_digest_db_user_secret_latest":
                        curr_pass_value = data["resources"][i]["instances"][0]["attributes"]["secret_data"]                        
                        if curr_pass_value == "":
                           data["resources"][i]["instances"][0]["attributes"]["secret_data"] = digest_db_pass 
                    
                    if data["resources"][i]["type"] == "google_sql_user":
                        curr_pass_value = data["resources"][i]["instances"][0]["attributes"]["password"]    
                        curr_user_value = data["resources"][i]["instances"][0]["attributes"]["name"]

                        if curr_pass_value == "":
                           data["resources"][i]["instances"][0]["attributes"]["password"] = digest_db_pass  
                        if curr_user_value == "":
                           data["resources"][i]["instances"][0]["attributes"]["name"] = digest_db_user
        
        # Replace data in file 
        with open('default.tfstate', 'w') as f:
            print(json.dumps(data, indent=2), file=f)          
         
        # Upload back to Bucket 
        os.system('gsutil cp default.tfstate gs://'+project_id+'-tfstate/terraform/state/default.tfstate')  
         
        # Remove File 
        os.remove('default.tfstate')          
         
    except Exception as e:
        print(e)
        sys.exit()

def main():
    
    credentials, project_id = google.auth.default()
    initTF(project_id)
    get_sql(project_id)

if __name__ == "__main__":
    main()
    