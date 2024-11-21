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


def getSuffixConfig(project_id):
    with open('env_configs/'+project_id+'/terraform.tfvars') as file:
        for line in file:
            if "name_suffix" in line:
                name = line.split("=")[1].replace('"', "").strip()       

    return name


def printTfImportRedis(project_id, cache):
    module_name = cache
    module_name = module_name.split("/")
    module_name = module_name[-1]
    module_name = module_name[:-5]
    module_name = module_name.replace("-", "_")

    print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.memstore.google_redis_instance.'+module_name+' '+cache)
    os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.memstore.google_redis_instance.'+module_name+' '+cache)

def getNamesList():
    names = []
    with open("modules/memstore/main.tf") as file:
        for line in file:
            if "google_redis_instance" in line:
                name = line.split(" ")[2].strip()
                name = name.replace('"','')
                names.append(name)
                # print(name)
    # print(names)
    return names

def getTFState(project_id):
    os.system('gsutil cp gs://'+project_id+'-tfstate/terraform/state/default.tfstate .')
    with open("default.tfstate") as file:
        contents = file.read()
    # print(contents)
    return contents

def get_redis(project_id):

    try:
        regions = ['us-east4', 'us-central1']
        # print(regions)
        modules = getNamesList()
        # print(modules)
        for region in regions:
            caches = subprocess.check_output(["gcloud redis instances list --region="+region+" | grep -i INSTANCE_NAME | cut -d ' ' -f 2"],shell=True).decode('utf-8').splitlines()
            print("Importing from Region: " + region)
            for cache in caches:
                for module in modules:
                    if module.replace("_", "-") in cache:  
                        print("Cache: " + cache)
                        cache_info = subprocess.check_output(["gcloud redis instances describe "+cache+" --region="+region+" --format=json"],shell=True).decode('utf-8')
                        json_data = json.loads(cache_info)
                        # print(json_data)
                        cache_name = json_data['name']
                        printTfImportRedis(project_id, cache_name)

                        
    except Exception as e:
        print(e)
        sys.exit()

def main():
    
    credentials, project_id = google.auth.default()
    initTF(project_id)
    get_redis(project_id)

if __name__ == "__main__":
    main()
    