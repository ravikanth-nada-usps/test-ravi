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


def getSuffixConfig(project_id):
    with open('env_configs/'+project_id+'/terraform.tfvars') as file:
        for line in file:
            if "name_suffix" in line:
                name = line.split("=")[1].replace('"', "").strip()       

    return name

def printTfImportFunction(project_id, region, function, module):
    
    function_name = function.split(",")[0]
    function_version = function.split(",")[1]
    module_name = module
    google_module = ""
    if function_version == "1st gen":
        google_module = "google_cloudfunctions_function"
    if function_version == "2nd gen":
        google_module = "google_cloudfunctions2_function"
    
    print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.cloud_function.'+google_module+'.'+module_name+' '+project_id+'/'+region+'/'+function_name)
    
    os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.cloud_function.'+google_module+'.'+module_name+' '+project_id+'/'+region+'/'+function_name)

def getNamesList():
    names = []
    with open("modules/cloud_function/main.tf") as file:
        for line in file:
            if "google_cloudfunctions_function" in line or "google_cloudfunctions2_function" in line:
                name = line.split(" ")[2].strip()
                name = name.replace('"','')
                names.append(name)
    # print(names)
    return names

def getTFState(project_id):
    os.system('gsutil cp gs://'+project_id+'-tfstate/terraform/state/default.tfstate .')
    with open("default.tfstate") as file:
        contents = file.read()
    #print(contents)
    return contents

def get_functions(project_id):

    try:
        regions = ['us-east4', 'us-central1']
        modules = getNamesList()
        # env_suffix = getSuffixConfig(project_id)
        # modules = []
        for region in regions:
        
            functions = subprocess.check_output(["gcloud functions list --regions="+region+' --format="csv(name,generation():label=ENVIRONMENT)[separator=\',\']"'],shell=True).decode('utf-8').splitlines()
            # print(functions)
        
        
            for function in functions:
                function_name = function.split(",")[0]
                for module in modules:
                    if module == function_name.replace("-", "_"):
                        print(module, function)
                        printTfImportFunction(project_id, region, function, module)
                    elif "redischeck" in function_name:
                        if module == function_name[:-5].replace("-", "_"):
                            print(module, function)
                            printTfImportFunction(project_id, region, function, module)
                    
                    elif "image-dimension" in function_name:
                        if module == function_name[:-5].replace("-", "_"):
                            print(module, function)   
                            printTfImportFunction(project_id, region, function, module)


    except Exception as e:
        print(e)
        sys.exit()

def main():
    
    credentials, project_id = google.auth.default()
    initTF(project_id)
    get_functions(project_id)

if __name__ == "__main__":
    main()