#!/usr/bin/env python3

# Script to import existing service accounts into terraform

import os
import sys
from jproperties import Properties

def init():
    os.chdir(r'../')

def get_config_keys(file):
    configs = Properties()
    with open(file, 'rb') as config_file:
        configs.load(config_file)

    items_view = configs.items()
    list_keys = []

    for item in items_view:
        list_keys.append(item[0])
    
    return list_keys

def validate(a, b, file_name):
    if set(a) == set(b):
        print(file_name + " has passed validation.")
        print()
        value = 0
    else:
        print(file_name + " is missing the following variables:")
        missing_vars = set(a).difference(b)
        for var in missing_vars:
            print("Missing variable: " + var)
        
        print()
        value = 1        
    
    return value

def exit_status(validate_code):
    if validate_code == 1:
        print ("One or more terraform.tfvars files is missing variables. Please update to ensure all tfvars files have all variables needed.")
        sys.exit(1)

    
def main():
    
    init()
    
    all_keys = []
    
    varfile_00s = "./env_configs/uspscio-it-idc-9060-00s/terraform.tfvars"
    varfile_01s = "./env_configs/uspscio-idc-9060-01s/terraform.tfvars"
    varfile_02s = "./env_configs/uspscio-it-idc-9060-02s/terraform.tfvars"
    varfile_00c = "./env_configs/uspscio-it-idc-9060-00c/terraform.tfvars"
    varfile_01c = "./env_configs/uspscio-it-idc-9060-01c/terraform.tfvars"
    varfile_00p = "./env_configs/uspscio-it-idc-9060-00p/terraform.tfvars"
    varfile_00d = "./env_configs/uspscio-it-idc-9060-00d/terraform.tfvars"
    varfile_01d = "./env_configs/uspscio-idc-9060-01d/terraform.tfvars"
    varfile_02d = "./env_configs/uspscio-idc-9060-02d/terraform.tfvars"
    varfile_03d = "./env_configs/upscio-it-idc-9060-03d/terraform.tfvars"
  
    
    keys_00s = get_config_keys(varfile_00s)
    keys_01s = get_config_keys(varfile_01s)
    keys_02s = get_config_keys(varfile_02s)
    keys_00c = get_config_keys(varfile_00c)
    keys_01c = get_config_keys(varfile_01c)
    keys_00p = get_config_keys(varfile_00p)
    keys_00d = get_config_keys(varfile_00d)
    keys_01d = get_config_keys(varfile_01d)
    keys_02d = get_config_keys(varfile_02d)
    keys_03d = get_config_keys(varfile_03d)

    all_keys.extend(keys_00s)
    all_keys.extend(keys_01s)
    all_keys.extend(keys_02s)
    all_keys.extend(keys_00c)
    all_keys.extend(keys_01c)
    all_keys.extend(keys_00p)
    all_keys.extend(keys_00d)
    all_keys.extend(keys_01d)
    all_keys.extend(keys_02d)
    all_keys.extend(keys_03d)
    
    all_keys = list(set(all_keys))
    # print(all_keys)
    
    
    code_00d = validate(all_keys, keys_00d, varfile_00d)
    code_01d = validate(all_keys, keys_01d, varfile_01d)
    code_02d = validate(all_keys, keys_02d, varfile_02d)
    code_03d = validate(all_keys, keys_03d, varfile_03d)
    code_00s = validate(all_keys, keys_00s, varfile_00s)
    code_01s = validate(all_keys, keys_01s, varfile_01s)
    code_02s = validate(all_keys, keys_02s, varfile_02s)
    code_00c = validate(all_keys, keys_00c, varfile_00c)
    code_01c = validate(all_keys, keys_01c, varfile_01c)
    code_00p = validate(all_keys, keys_00p, varfile_00p)
 
   
    exit_status(code_00d)
    exit_status(code_01d)
    exit_status(code_02d)
    exit_status(code_03d)
    exit_status(code_00s)
    exit_status(code_01s)
    exit_status(code_02s)
    exit_status(code_00c)
    exit_status(code_01c)
    exit_status(code_00p)
    
    print("All terraform.tfvars passed validation.")
   
if __name__ == "__main__":
    main()
