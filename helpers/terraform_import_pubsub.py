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

def printTfImportSchema(project_id, schema):
    
    module_name = schema.replace("-", "_")
    print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.pub_sub.google_pubsub_schema.'+module_name+' '+project_id+'/'+schema)
    os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.pub_sub.google_pubsub_schema.'+module_name+' '+project_id+'/'+schema)

def printTfImportTopic(project_id, topic):
    module_name = topic
    module_name = module_name.split("/")
    module_name = module_name[-1]
    module_name = module_name[:-5]
    module_name = module_name.replace("-", "_")
    print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.pub_sub.google_pubsub_topic.'+module_name+' '+topic)
    os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.pub_sub.google_pubsub_topic.'+module_name+' '+topic)

def printTfImportSub(project_id, subscription):
    module_name = subscription
    module_name = module_name.split("/")
    module_name = module_name[-1]
    module_name = module_name[:-5]
    module_name = module_name.replace("-", "_")

    print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.pub_sub.google_pubsub_subscription.'+module_name+' '+subscription)
    os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.pub_sub.google_pubsub_subscription.'+module_name+' '+subscription)

def getNamesList():
    names = []
    with open("modules/pub_sub/main.tf") as file:
        for line in file:
            if "google_pubsub_schema" in line or "google_pubsub_topic" in line or "google_pubsub_subscription" in line:
                name = line.split(" ", 1)[2].strip()
                name = name.replace('"','')
                names.append(name)
    #print(names)
    return names

def getTFState(project_id):
    os.system('gsutil cp gs://'+project_id+'-tfstate/terraform/state/default.tfstate .')
    with open("default.tfstate") as file:
        contents = file.read()
    #print(contents)
    return contents

def get_pubsub(project_id):

    try:

        schemas = subprocess.check_output(["gcloud pubsub schemas list | grep -i name | cut -d ' ' -f 2"],shell=True).decode('utf-8').splitlines()
        # print(schemas)

        for schema in schemas:
            printTfImportSchema(project_id, schema)

        topics = subprocess.check_output(["gcloud pubsub topics list | grep -i name | cut -d ' ' -f 2"],shell=True).decode('utf-8').splitlines()
        topics = [ x for x in topics if "eventarc" not in x ]
        topics = [ x for x in topics if "gcf" not in x ]
        # print(topics)

        for topic in topics:
           printTfImportTopic(project_id, topic) 
    
        subscriptions = subprocess.check_output(["gcloud pubsub subscriptions list | grep -i name | cut -d ' ' -f 2"],shell=True).decode('utf-8').splitlines()
        subscriptions = [ x for x in subscriptions if "eventarc" not in x ]
        subscriptions = [ x for x in subscriptions if "gcf" not in x ]
        # print(subscriptions)       

        for subscription in subscriptions:
           printTfImportSub(project_id, subscription)
    except Exception as e:
        print(e)
        sys.exit()

def main():
    
    credentials, project_id = google.auth.default()
    initTF(project_id)
    get_pubsub(project_id)

if __name__ == "__main__":
    main()