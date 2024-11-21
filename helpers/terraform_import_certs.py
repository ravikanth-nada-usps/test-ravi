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

def get_certs(project_id):

    try:
        config_values = load_properties(project_id)
        env = config_values.get('environment')
        #import static ip  
        print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.certs.google_compute_region_ssl_certificate.rmin_id_cert_c projects/'+project_id+'/regions/us-central1/sslCertificates/rmin-id-'+env+'-cert-c' )
        os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.certs.google_compute_region_ssl_certificate.rmin_id_cert_c projects/'+project_id+'/regions/us-central1/sslCertificates/rmin-id-'+env+'-cert-c' )

        
    except Exception as e:
        print(e)
        sys.exit()

def main():
    
    credentials, project_id = google.auth.default()
    initTF(project_id)
    get_certs(project_id)

if __name__ == "__main__":
    main()
    