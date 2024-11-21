import os, sys
import argparse
import hcl2
           
def get_env_configs(project_id):
    separator = os.sep
    with open('../env_configs/'+project_id+'/terraform.tfvars', 'r') as file:
        dict = hcl2.load(file)
    # print(dict)
    return dict
    
def str_to_bool(s):
    if s.lower() == 'true':
        return True
    elif s.lower() == 'false':
        return False
    else:
        raise ValueError("Cannot covert {} to a bool".format(s))
    
def update_configs(configs, override_vars):
    for var in override_vars:
        key = var.split('=')[0]
        value = var.split('=')[1]
        if key in configs:
            var_type = type(configs[key])
            # print(var_type)          
            if var_type == bool:
                configs[key] = str_to_bool(value)
            elif var_type == int:
                configs[key] = int(value)
            elif var_type == float:
                configs[key] = float(value)                
            elif var_type == str:
                configs[key] = str(value)            
            else:
                configs[key] = str(value)             
            print("Setting ", key , " to ", configs[key])
    return configs

def replace_tfvar_file(project_id, configs):
    with open('../env_configs/'+project_id+'/terraform.tfvars', 'w') as file:    
        for k, v in configs.items():
            var_type = type(v)
            if var_type == bool:
                file.write(k + ' = ' + str(v).lower() +"\n")
            elif var_type == int:
                file.write(k + ' = ' +  str(v) +"\n")
            elif var_type == float:
                file.write(k + ' = ' +  str(v) +"\n")                
            elif var_type == str:
                file.write(k+ ' = ' +  '"'+v+'"' +"\n")
            else:
                file.write(k+ ' = ' +  '"'+str(v)+'"' +"\n")                
        file.close()
    
    print()
    print('../env_configs/'+project_id+'/terraform.tfvars has been updated.')
        
def main():

    parser = argparse.ArgumentParser(description='Update configs for terraform tfvars')      
    parser.add_argument('-p', '--project', metavar='project_id', help='GCP Project ID', required=False)
    parser.add_argument('-o', '--override-vars',  nargs='*', metavar='variable_name=override_value', help='Override Config Values', required=False)
    parser.add_argument( '--execute', action='store_true', help='Run commands', required=False)  
    args = parser.parse_args()

    project_id = ""
    if  args.project is not None:
        project_id = args.project
    else:
        credentials, project_id = google.auth.default()

    dry_run = True

    if args.execute == True:
        dry_run = False
    else:
        print("")
        print("Dry Run has been enabled. No updates will be run.")
        print("")
        

    override = False
    override_vars = []
    if  args.override_vars is not None:
        override = True
        override_vars = args.override_vars
        for var in override_vars:
            if not "=" in var:
                print("Override Variable is missing value.")
                print(var)
                sys.exit(1)
    print("")
    configs = get_env_configs(project_id)
    updated_configs = update_configs(configs, override_vars)
    
    if dry_run == False:
        replace_tfvar_file(project_id,updated_configs)


if __name__ == "__main__":
    main()
