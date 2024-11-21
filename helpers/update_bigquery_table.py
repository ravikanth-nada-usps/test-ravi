import os, sys
import argparse
import google.auth

def validate_input(bq_table):
    path = "../modules/big_query/table_schemas/" + bq_table + ".json"
    file_exists = os.path.isfile(path)
    return file_exists

def execute_update_command(project_id, bq_table, dry_run=False):
    
    path = "../modules/big_query/table_schemas/" + bq_table + ".json"
    suffix = getSuffixConfig(project_id)
    dataset = "rmin_operationaldata_bigquery_e_"+suffix     
    if dry_run:
        print("Dry Run enabled. No commands will be executed. Output of command is given below.")
        print()
        print("bq update "+project_id+":"+dataset+"."+bq_table+ " " + path)
        
    else:
        print("bq update "+project_id+":"+dataset+"."+bq_table+ " " + path)
        os.system("bq update "+project_id+":"+dataset+"."+bq_table+ " " + path)
 

def getSuffixConfig(project_id):
    with open('../env_configs/'+project_id+'/terraform.tfvars') as file:
        for line in file:
            if "name_suffix" in line:
                name = line.split("=")[1].replace('"', "").strip()       

    return name
    
def main():

    parser = argparse.ArgumentParser(description='Update Big Table Schema')      
    parser.add_argument('-p', '--project', metavar='project_id', help='GCP Project ID', required=False)
    parser.add_argument('-t', '--table', metavar='project_id', help='Name of BigQuery Table', required=True)
    parser.add_argument( '--execute', action='store_true', help='Run commands', required=False)  
    args = parser.parse_args()
    
    print()
    
    project_id = ""
    if  args.project is not None:
        project_id = args.project
    else:
        credentials, project_id = google.auth.default()

    dry_run = True

    if args.execute == True:
        dry_run = False

    bq_table = args.table
    file_exists = validate_input(bq_table)
    
    if file_exists:
        execute_update_command(project_id, bq_table, dry_run)
    else:
        print(bq_table + " BigQuery Table does not exist.")
        sys.exit(1)

if __name__ == "__main__":
    main()
