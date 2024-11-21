import os, sys
import google.auth
from google.oauth2 import service_account  # type: ignore
import googleapiclient.discovery  # type: ignore
import argparse
import subprocess
import json 

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
            if line.strip().startswith(config_name):
                config_value = line.split("=")[1].replace('"', "").strip()  
                
    return config_value

def get_sql(project_id):

    try:
        sql_instances = subprocess.check_output(["gcloud sql instances list | grep -i name | cut -d ' ' -f 2"],shell=True).decode('utf-8').splitlines()
        name_suffix = getConfig(project_id, "name_suffix")
        for instance in sql_instances:

            sa = subprocess.check_output(["gcloud sql instances describe "+instance+" | grep -i serviceAccountEmailAddress  | cut -d ' ' -f 2"],shell=True).decode('utf-8').splitlines()
            sa = sa[0]

            os.system('gcloud storage buckets add-iam-policy-binding gs://rmin-template-bucket-e-000r --member="serviceAccount:'+sa+'" --role="roles/storage.objectViewer" --project=uspscio-it-rminid-4583-00r')              
            os.system('gcloud storage buckets add-iam-policy-binding gs://rmin-template-bucket-e-'+name_suffix+' --member="serviceAccount:'+sa+'" --role="roles/storage.objectViewer" --project='+project_id)            
         
    except Exception as e:
        print(e)
        sys.exit()

def main():
    
    credentials, project_id = google.auth.default()
    os.chdir(r'../')
    get_sql(project_id)

if __name__ == "__main__":
    main()
    