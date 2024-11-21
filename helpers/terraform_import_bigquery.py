import os, sys
import google.auth
from google.oauth2 import service_account  # type: ignore
import googleapiclient.discovery  # type: ignore
import argparse
from google.cloud import bigquery

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

def printTfImportDataset(project_id, module_name, dataset_id):
    
    print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.big_query.google_bigquery_dataset.'+module_name+' '+project_id+'/'+dataset_id)
    os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.big_query.google_bigquery_dataset.'+module_name+' '+project_id+'/'+dataset_id)

def printTfImportBqTable(project_id, module_name, dataset_id, table_id):
    
    print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.big_query.google_bigquery_table.'+module_name+' '+project_id+'/'+dataset_id+'/'+table_id)
    os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.big_query.google_bigquery_table.'+module_name+' '+project_id+'/'+dataset_id+'/'+table_id)


def getTFState(project_id):
    os.system('gsutil cp gs://'+project_id+'-tfstate/terraform/state/default.tfstate .')
    with open("default.tfstate") as file:
        contents = file.read()
    #print(contents)
    return contents

def get_dataset(project_id, dataset_id: str) -> None:
    # [START bigquery_get_dataset]

    # Construct a BigQuery client object.
    client = bigquery.Client()

    # TODO(developer): Set dataset_id to the ID of the dataset to fetch.
    


    try:
        dataset_prefix = dataset_id
        suffix = getSuffixConfig(project_id)
        dataset_id = dataset_id+"_"+suffix        
        dataset = client.get_dataset(dataset_id)  # Make an API request.
        full_dataset_id = "{}.{}".format(dataset.project, dataset.dataset_id)
        friendly_name = dataset.friendly_name
        print("Dataset: " + dataset.dataset_id)
        printTfImportDataset(project_id, dataset_prefix, dataset_id)

        # View tables in dataset.
        print("Tables:")
        tables = list(client.list_tables(dataset))  # Make an API request(s).
        if tables:
            for table in tables:
                print("\t{}".format(table.table_id))
                module_name = dataset_prefix+"_"+table.table_id
                printTfImportBqTable(project_id, module_name, dataset_id, table.table_id)

        else:
            print("\tThis dataset does not contain any tables.")        
    except Exception as e:
        print("Dataset does not exist: ",e)
        sys.exit()

def main():
    
    credentials, project_id = google.auth.default()
    initTF(project_id)
    get_dataset(project_id, "rmin_operationaldata_bigquery_e")

if __name__ == "__main__":
    main()