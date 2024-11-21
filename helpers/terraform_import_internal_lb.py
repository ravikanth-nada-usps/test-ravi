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


def getConfig(project_id, config_name):
    with open('env_configs/'+project_id+'/terraform.tfvars') as file:
        for line in file:
            if line.strip().startswith(config_name):
                config_value = line.split("=")[1].replace('"', "").strip()  
                
    return config_value

def get_lb(project_id):

    try:

  
        #import static ip  
        print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.internal_lb.google_compute_address.rmin_lb_ip_int_c projects/'+project_id+'/regions/us-central1/addresses/rmin-lb-ip-int-c')
        os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.internal_lb.google_compute_address.rmin_lb_ip_int_c projects/'+project_id+'/regions/us-central1/addresses/rmin-lb-ip-int-c')   

        #import google_compute_forwarding_rule 
        print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.internal_lb.google_compute_forwarding_rule.rmin_int_lb_http_fe_c projects/'+project_id+'/regions/us-central1/forwardingRules/rmin-int-lb-http-fe-c')
        os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.internal_lb.google_compute_forwarding_rule.rmin_int_lb_http_fe_c projects/'+project_id+'/regions/us-central1/forwardingRules/rmin-int-lb-http-fe-c')

        print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.internal_lb.google_compute_forwarding_rule.rmin_int_lb_https_fe_c projects/'+project_id+'/regions/us-central1/forwardingRules/rmin-int-lb-https-fe-c')
        os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.internal_lb.google_compute_forwarding_rule.rmin_int_lb_https_fe_c projects/'+project_id+'/regions/us-central1/forwardingRules/rmin-int-lb-https-fe-c')
        
        #import google_compute_region_backend_service 
        print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.internal_lb.google_compute_region_backend_service.rmin_int_lb_cp_be_c projects/'+project_id+'/regions/us-central1/backendServices/rmin-int-lb-cp-be-c')
        os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.internal_lb.google_compute_region_backend_service.rmin_int_lb_cp_be_c projects/'+project_id+'/regions/us-central1/backendServices/rmin-int-lb-cp-be-c')            

        print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.internal_lb.google_compute_region_backend_service.rmin_int_lb_mdn_track_be_c projects/'+project_id+'/regions/us-central1/backendServices/rmin-int-lb-mdn-track-be-c')
        os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.internal_lb.google_compute_region_backend_service.rmin_int_lb_mdn_track_be_c projects/'+project_id+'/regions/us-central1/backendServices/rmin-int-lb-mdn-track-be-c')  
        
        print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.internal_lb.google_compute_region_backend_service.rmin_int_lb_digest_track_be_c projects/'+project_id+'/regions/us-central1/backendServices/rmin-int-lb-digest-track-be-c')
        os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.internal_lb.google_compute_region_backend_service.rmin_int_lb_digest_track_be_c projects/'+project_id+'/regions/us-central1/backendServices/rmin-int-lb-digest-track-be-c')  
        
        #import google_compute_region_network_endpoint_group 
        print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.internal_lb.google_compute_region_network_endpoint_group.rmin_int_lb_cp_neg_c projects/'+project_id+'/regions/us-central1/networkEndpointGroups/rmin-int-lb-cp-neg-c')
        os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.internal_lb.google_compute_region_network_endpoint_group.rmin_int_lb_cp_neg_c projects/'+project_id+'/regions/us-central1/networkEndpointGroups/rmin-int-lb-cp-neg-c') 

        print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.internal_lb.google_compute_region_network_endpoint_group.rmin_int_lb_mdn_track_neg_c projects/'+project_id+'/regions/us-central1/networkEndpointGroups/rmin-int-lb-mdn-track-neg-c')
        os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.internal_lb.google_compute_region_network_endpoint_group.rmin_int_lb_mdn_track_neg_c projects/'+project_id+'/regions/us-central1/networkEndpointGroups/rmin-int-lb-mdn-track-neg-c') 
        
        print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.internal_lb.google_compute_region_network_endpoint_group.rmin_int_lb_digest_track_neg_c projects/'+project_id+'/regions/us-central1/networkEndpointGroups/rmin-int-lb-digest-track-neg-c')
        os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.internal_lb.google_compute_region_network_endpoint_group.rmin_int_lb_digest_track_neg_c projects/'+project_id+'/regions/us-central1/networkEndpointGroups/rmin-int-lb-digest-track-neg-c')         

        #import google_compute_region_security_policy        
        
        print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.internal_lb.google_compute_region_security_policy.rmin_int_lb_digest_track_sec_pol_c projects/'+project_id+'/regions/us-central1/securityPolicies/rmin-int-lb-digest-track-sec-pol-c')
        os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.internal_lb.google_compute_region_security_policy.rmin_int_lb_digest_track_sec_pol_c projects/'+project_id+'/regions/us-central1/securityPolicies/rmin-int-lb-digest-track-sec-pol-c') 

        print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.internal_lb.google_compute_region_security_policy.rmin_int_lb_mdn_track_sec_pol_c projects/'+project_id+'/regions/us-central1/securityPolicies/rmin-int-lb-mdn-track-sec-pol-c')
        os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.internal_lb.google_compute_region_security_policy.rmin_int_lb_mdn_track_sec_pol_c projects/'+project_id+'/regions/us-central1/securityPolicies/rmin-int-lb-mdn-track-sec-pol-c') 
        
        #import google_compute_region_security_policy_rule        
        
        print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.internal_lb.google_compute_region_security_policy_rule.rmin_int_lb_digest_track_sec_pol_rule_c projects/'+project_id+'/regions/us-central1/securityPolicies/rmin-int-lb-digest-track-sec-pol-c/priority/2147483646')
        os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.internal_lb.google_compute_region_security_policy_rule.rmin_int_lb_digest_track_sec_pol_rule_c projects/'+project_id+'/regions/us-central1/securityPolicies/rmin-int-lb-digest-track-sec-pol-c/priority/2147483646') 

        print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.internal_lb.google_compute_region_security_policy_rule.rmin_int_lb_mdn_track_sec_pol_rule_c projects/'+project_id+'/regions/us-central1/securityPolicies/rmin-int-lb-mdn-track-sec-pol-c/priority/2147483646')
        os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.internal_lb.google_compute_region_security_policy_rule.rmin_int_lb_mdn_track_sec_pol_rule_c projects/'+project_id+'/regions/us-central1/securityPolicies/rmin-int-lb-mdn-track-sec-pol-c/priority/2147483646') 

        #import google_compute_region_target_http_proxy        
        
        print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.internal_lb.google_compute_region_target_http_proxy.rmin_int_lb_http_proxy_c projects/'+project_id+'/regions/us-central1/targetHttpProxies/rmin-int-lb-http-proxy-c')
        os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.internal_lb.google_compute_region_target_http_proxy.rmin_int_lb_http_proxy_c projects/'+project_id+'/regions/us-central1/targetHttpProxies/rmin-int-lb-http-proxy-c')        

        #import google_compute_region_target_https_proxy        
        
        print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.internal_lb.google_compute_region_target_https_proxy.rmin_int_lb_https_proxy_c projects/'+project_id+'/regions/us-central1/targetHttpsProxies/rmin-int-lb-https-proxy-c')
        os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.internal_lb.google_compute_region_target_https_proxy.rmin_int_lb_https_proxy_c projects/'+project_id+'/regions/us-central1/targetHttpsProxies/rmin-int-lb-https-proxy-c')  

        #import google_compute_region_url_map        
        
        print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.internal_lb.google_compute_region_url_map.rmin_internal_lb_c projects/'+project_id+'/regions/us-central1/urlMaps/rmin-internal-lb-c')
        os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.internal_lb.google_compute_region_url_map.rmin_internal_lb_c projects/'+project_id+'/regions/us-central1/urlMaps/rmin-internal-lb-c')   

        print('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.internal_lb.google_compute_region_url_map.rmin_internal_lb_http_c projects/'+project_id+'/regions/us-central1/urlMaps/rmin-internal-lb-http-c')
        os.system('terraform import --var-file="env_configs/'+project_id+'/terraform.tfvars" module.internal_lb.google_compute_region_url_map.rmin_internal_lb_http_c projects/'+project_id+'/regions/us-central1/urlMaps/rmin-internal-lb-http-c')  
        
    except Exception as e:
        print(e)
        sys.exit()

def main():
    
    credentials, project_id = google.auth.default()
    initTF(project_id)
    get_lb(project_id)

if __name__ == "__main__":
    main()
    