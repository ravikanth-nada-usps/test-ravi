#!/usr/bin/env python3

import os, sys
import argparse
import subprocess


def add_permissions(service_accounts_list, sa, role):
    matches = [] 
    for account in service_accounts_list:
        if sa in account:
            matches.append(account)
        
    for sa_match in matches:
        print('gcloud run services add-iam-policy-binding rmin-cloud-subscriber-api --region="us-central1" --member="serviceAccount:'+sa_match+'" --role="'+role+'"')  
        os.system('gcloud run services add-iam-policy-binding rmin-cloud-subscriber-api --region="us-central1" --member="serviceAccount:'+sa_match+'" --role="'+role+'"')             

        print('gcloud run services add-iam-policy-binding rmin-cloud-image-api --region="us-central1" --member="serviceAccount:'+sa_match+'" --role="'+role+'"')  
        os.system('gcloud run services add-iam-policy-binding rmin-cloud-image-api --region="us-central1" --member="serviceAccount:'+sa_match+'" --role="'+role+'"')              
            
        print('gcloud run services add-iam-policy-binding rmin-cloud-dashboard-api --region="us-central1" --member="serviceAccount:'+sa_match+'" --role="'+role+'"')
        os.system('gcloud run services add-iam-policy-binding rmin-cloud-dashboard-api --region="us-central1" --member="serviceAccount:'+sa_match+'" --role="'+role+'"')
            
        print('gcloud run services add-iam-policy-binding rmin-cloud-package-api --region="us-central1" --member="serviceAccount:'+sa_match+'" --role="'+role+'"')
        os.system('gcloud run services add-iam-policy-binding rmin-cloud-package-api --region="us-central1" --member="serviceAccount:'+sa_match+'" --role="'+role+'"')

        print('gcloud run services add-iam-policy-binding rmin-cloud-login-api  --region="us-central1" --member="serviceAccount:'+sa_match+'" --role="'+role+'"')
        os.system('gcloud run services add-iam-policy-binding rmin-cloud-login-api  --region="us-central1" --member="serviceAccount:'+sa_match+'" --role="'+role+'"')
      
    return matches    
    

def get_sa():

    try:
        
        service_accounts = subprocess.check_output(["gcloud iam service-accounts list | grep -i email: | cut -d ' ' -f 2"],shell=True).decode('utf-8').splitlines()
        service_accounts = list(set(service_accounts))
 
        add_permissions(service_accounts, "apigee", "roles/run.invoker")
            
    except Exception as e:
        print(e)
        sys.exit()

def main():
    
    get_sa()

if __name__ == "__main__":
    main()