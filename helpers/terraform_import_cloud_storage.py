#!/usr/bin/env python3

# Script to import existing service accounts into terraform

import os
import google.auth
from google.oauth2 import service_account  # type: ignore
import googleapiclient.discovery  # type: ignore
import argparse
from google.cloud import storage
import subprocess


def initTF(project_id):
    os.chdir(r'../')
    #os.system('pwd')
    os.system('terraform init -reconfigure --backend-config="env_configs/'+project_id+'/backend.conf"')

def getNamesList():
    names = []
    with open("modules/cloud_storage/main.tf") as file:
        for line in file:
            if "google_storage_bucket" in line:
                name = line.split(" ")[2].replace("{", "").replace('"', "").strip()
                #print(name)
                name = name.replace("[","").replace("]","").replace('"','')
                names.append(name)
    #print(names)
    return names

def getSuffixConfig(project_id):
    with open('env_configs/'+project_id+'/terraform.tfvars') as file:
        for line in file:
            if "name_suffix" in line:
                name = line.split("=")[1].replace('"', "").strip()
               # print(name)             

    return name

def getTFState(project_id):
    os.system('gsutil cp gs://'+project_id+'-tfstate/terraform/state/default.tfstate .')
    with open("default.tfstate") as file:
        contents = file.read()
    #print(contents)
    return contents


def printTfImportBucket(project_id, bucket):

    module_name = bucket[:-5]
    module_name = module_name.replace("-","_")
    print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.cloud_storage.google_storage_bucket.'+module_name+' '+project_id+'/'+bucket)
    os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.cloud_storage.google_storage_bucket.'+module_name+' '+project_id+'/'+bucket)

def printTfImportBucketNotif(project_id, bucket, notif_id):

    module_name = bucket[:-5]+"-notification"
    module_name = module_name.replace("-","_")
    print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.cloud_storage.google_storage_notification.'+module_name+' '+bucket+'/notificationConfigs/'+notif_id)
    os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.cloud_storage.google_storage_notification.'+module_name+' '+bucket+'/notificationConfigs/'+notif_id)

def list_buckets(project_id):
    """Lists all buckets."""
    buckets = subprocess.check_output(["gcloud storage buckets list | grep -i name | grep rmin | cut -d ' ' -f 2"],shell=True).decode('utf-8').splitlines()
    tf_buckets = getNamesList()
    # print(tf_buckets)
    #state_file = getTFState(project_id)
    for bucket in buckets:
        bucket_name = bucket
        # print(bucket_name, bucket_name[:-5])
        #if bucket_name not in state_file:
        if bucket_name[:-5].replace("-","_") in tf_buckets:
            printTfImportBucket(project_id, bucket_name)
               
    #print(all_buckets)
    return buckets  

def list_bucket_notifications(bucket_name,project_id):
    """Lists notification configurations for a bucket."""
    # The ID of your GCS bucket

    try:
        suffix = getSuffixConfig(project_id)
        bucket_name = bucket_name+'-'+suffix
        print (bucket_name)
        storage_client = storage.Client()
        bucket = storage_client.bucket(bucket_name)
        notifications = bucket.list_notifications()
        
        for notification in notifications:
            notif_id = notification.notification_id
            printTfImportBucketNotif(project_id, bucket_name, notif_id)
            #print(f"Notification ID: {notification.notification_id}")
    except:
        pass

        
def main():
    
    credentials, project_id = google.auth.default()
    initTF(project_id)
    list_buckets(project_id)
    list_bucket_notifications("rmin-campaign-bucket-e",project_id)
    list_bucket_notifications("rmin-rawfile-bucket-e",project_id)
    list_bucket_notifications("rmin-subscriber-bucket-2-e", project_id)
    list_bucket_notifications("rmin-subscriber-bucket-e", project_id)
    

if __name__ == "__main__":
    main()
