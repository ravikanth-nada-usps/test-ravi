# [START General]
output "tf_repo_version" {
  value       = trimspace(data.local_file.tf_version.content)
  description = "Version of rmin-cloud-terraform-scripts repo"
}

# [END General]

# [START memstore]
output "rmin_mail_campaign_cache_c_read_ip" {
  value       = module.memstore.rmin_mail_campaign_cache_c_read_ip
  description = "The IP address of Redis Cache Read Replica"
}

output "rmin_mail_campaign_cache_c_ip" {
  value       = module.memstore.rmin_mail_campaign_cache_c_ip
  description = "The IP address of Redis Cache Primary Endpoint"
}

output "rmin_mail_campaign_cache_ext_c_read_ip" {
  value       = module.memstore.rmin_mail_campaign_cache_ext_c_read_ip
  description = "The IP address of Redis Cache Read Replica"
}

output "rmin_mail_campaign_cache_ext_c_ip" {
  value       = module.memstore.rmin_mail_campaign_cache_ext_c_ip
  description = "The IP address of Redis Cache Primary Endpoint"
}

output "rmin_mdn_zip11s_cache_c_read_ip" {
  value       = module.memstore.rmin_mdn_zip11s_cache_c_read_ip
  description = "The IP address of Redis Cache Read Replica"
}

output "rmin_mdn_zip11s_cache_c_ip" {
  value       = module.memstore.rmin_mdn_zip11s_cache_c_ip
  description = "The IP address of Redis Cache Primary Endpoint"
}

output "rmin_mics_locks_cache_c_read_ip" {
  value       = module.memstore.rmin_mics_locks_cache_c_read_ip
  description = "The IP address of Redis Cache Read Replica"
}

output "rmin_mics_locks_cache_c_ip" {
  value       = module.memstore.rmin_mics_locks_cache_c_ip
  description = "The IP address of Redis Cache Primary Endpoint"
}

output "rmin_package_campaign_cache_c_read_ip" {
  value       = module.memstore.rmin_package_campaign_cache_c_read_ip
  description = "The IP address of Redis Cache Read Replica"
}

output "rmin_package_campaign_cache_c_ip" {
  value       = module.memstore.rmin_package_campaign_cache_c_ip
  description = "The IP address of Redis Cache Primary Endpoint"
}

output "rmin_package_campaign_cache_ext_c_read_ip" {
  value       = module.memstore.rmin_package_campaign_cache_ext_c_read_ip
  description = "The IP address of Redis Cache Read Replica"
}

output "rmin_package_campaign_cache_ext_c_ip" {
  value       = module.memstore.rmin_package_campaign_cache_ext_c_ip
  description = "The IP address of Redis Cache Primary Endpoint"
}

output "rmin_subscriber_cache_c_read_ip" {
  value       = module.memstore.rmin_subscriber_cache_c_read_ip
  description = "The IP address of Redis Cache Read Replica"
}

output "rmin_subscriber_cache_c_ip" {
  value       = module.memstore.rmin_subscriber_cache_c_ip
  description = "The IP address of Redis Cache Primary Endpoint"
}

output "rmin_subscriber_email_cache_c_read_ip" {
  value       = module.memstore.rmin_subscriber_email_cache_c_read_ip
  description = "The IP address of Redis Cache Read Replica"
}

output "rmin_subscriber_email_cache_c_ip" {
  value       = module.memstore.rmin_subscriber_email_cache_c_ip
  description = "The IP address of Redis Cache Primary Endpoint"
}

output "rmin_flats_lock_cache_c_read_ip" {
  value       = module.memstore.rmin_flats_lock_cache_c_read_ip
  description = "The IP address of Redis Cache Read Replica"
}

output "rmin_flats_lock_cache_c_ip" {
  value       = module.memstore.rmin_flats_lock_cache_c_ip
  description = "The IP address of Redis Cache Primary Endpoint"
}

output "rmin_relay_locks_cache_c_read_ip" {
  value       = module.memstore.rmin_relay_locks_cache_c_read_ip
  description = "The IP address of Redis Cache Read Replica"
}

output "rmin_relay_locks_cache_c_ip" {
  value       = module.memstore.rmin_relay_locks_cache_c_ip
  description = "The IP address of Redis Cache Primary Endpoint"
}

output "rmin_saturation_data_cache_e_read_ip" {
  value       = module.memstore.rmin_saturation_data_cache_e_read_ip
  description = "The IP address of Redis Cache Read Replica"
}

output "rmin_saturation_data_cache_e_ip" {
  value       = module.memstore.rmin_saturation_data_cache_e_ip
  description = "The IP address of Redis Cache Primary Endpoint"
}

output "rmin_zip5_initiatives_sync_cache_c" {
  value       = module.memstore.rmin_zip5_initiatives_sync_cache_c_ip
  description = "The IP address of Redis Cache Primary Endpoint"
}

# [END memstore]

# [START pub_sub]

output "rmin_99m_barcode_submission_topic_e_topic_id" {
  value       = module.pub_sub.rmin_99m_barcode_submission_topic_e_topic_id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_alerts_topic_e_topic_id" {
  value       = module.pub_sub.rmin_alerts_topic_e_topic_id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_campaign_topic_e_topic_id" {
  value       = module.pub_sub.rmin_campaign_topic_e_topic_id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_container_scan_topic_e_topic_id" {
  value       = module.pub_sub.rmin_container_scan_topic_e_topic_id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_dashboard_api_logs_dlt_c_topic_id" {
  value       = module.pub_sub.rmin_dashboard_api_logs_dlt_c_topic_id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_dashboard_api_logs_c_topic_id" {
  value       = module.pub_sub.rmin_dashboard_api_logs_c_topic_id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_dashboard_event_topic_e_topic_id" {
  value       = module.pub_sub.rmin_dashboard_event_topic_e_topic_id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_digest_event_topic_c_topic_id" {
  value       = module.pub_sub.rmin_digest_event_topic_c_topic_id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_dn_email_topic_e_topic_id" {
  value       = module.pub_sub.rmin_dn_email_topic_e_topic_id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_dn_logs_topic_e_topic_id" {
  value       = module.pub_sub.rmin_dn_logs_topic_e_topic_id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_errors_e_topic_id" {
  value       = module.pub_sub.rmin_errors_e_topic_id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_flats_topic_e_topic_id" {
  value       = module.pub_sub.rmin_flats_topic_e_topic_id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_image_api_logs_dlt_c_topic_id" {
  value       = module.pub_sub.rmin_image_api_logs_dlt_c_topic_id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_image_api_logs_c_topic_id" {
  value       = module.pub_sub.rmin_image_api_logs_c_topic_id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_lde_zip11_topic_e_topic_id" {
  value       = module.pub_sub.rmin_lde_zip11_topic_e_topic_id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_locale_key_submission_topic_e_topic_id" {
  value       = module.pub_sub.rmin_locale_key_submission_topic_e_topic_id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_mail_campaign_reporting_topic_c_topic_id" {
  value       = module.pub_sub.rmin_mail_campaign_reporting_topic_c_topic_id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_packages_topic_e_topic_id" {
  value       = module.pub_sub.rmin_packages_topic_e_topic_id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_psg_topic_e_topic_id" {
  value       = module.pub_sub.rmin_psg_topic_e_topic_id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_qr_code_service_topic_c_topic_id" {
  value       = module.pub_sub.rmin_qr_code_service_topic_c_topic_id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_rawfile_topic_e_topic_id" {
  value       = module.pub_sub.rmin_rawfile_topic_e_topic_id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_redischeck_campaign_e_topic_id" {
  value       = module.pub_sub.rmin_redischeck_campaign_e_topic_id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_redischeck_relay_lock_c_id" {
  value       = module.pub_sub.rmin_redischeck_relay_lock_c_id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_redischeck_flats_lock_c_id" {
  value       = module.pub_sub.rmin_redischeck_flats_lock_c_id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_redischeck_locks_cache_e_topic_id" {
  value       = module.pub_sub.rmin_redischeck_locks_cache_e_topic_id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_redischeck_locks_cache_e_2_topic_id" {
  value       = module.pub_sub.rmin_redischeck_locks_cache_e_2_topic_id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_redischeck_mailCampaign_c_topic_id" {
  value       = module.pub_sub.rmin_redischeck_mailCampaign_c_topic_id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_redischeck_mdnzip11s_cache_c_topic_id" {
  value       = module.pub_sub.rmin_redischeck_mdnzip11s_cache_c_topic_id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_redischeck_mics_locks_c_topic_id" {
  value       = module.pub_sub.rmin_redischeck_mics_locks_c_topic_id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_redischeck_packageCampaign_c_topic_id" {
  value       = module.pub_sub.rmin_redischeck_packageCampaign_c_topic_id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_redischeck_saturation_data_cache_e_topic_id" {
  value       = module.pub_sub.rmin_redischeck_saturation_data_cache_e_topic_id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_redischeck_subscriber_2_e_topic_id" {
  value       = module.pub_sub.rmin_redischeck_subscriber_2_e_topic_id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_redischeck_subscriber_c_topic_id" {
  value       = module.pub_sub.rmin_redischeck_subscriber_c_topic_id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_redischeck_subscriber_e_topic_id" {
  value       = module.pub_sub.rmin_redischeck_subscriber_e_topic_id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_redischeck_subscriber_email_cache_c_topic_id" {
  value       = module.pub_sub.rmin_redischeck_subscriber_email_cache_c_topic_id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_reportingsync_dlt_e_topic_id" {
  value       = module.pub_sub.rmin_reportingsync_dlt_e_topic_id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_subscriber_topic_2_e_topic_id" {
  value       = module.pub_sub.rmin_subscriber_topic_2_e_topic_id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_zip5_done_topic_c_topic_name" {
  value       = module.pub_sub.rmin_zip5_done_topic_c_name
  description = "Name of Topic"
}

# [END pub_sub]

# [START cloud_function]
output "rmin_cloud_image_dimension_func_c_url" {
  value       = module.cloud_function.rmin_cloud_image_dimension_func_c_url
  description = "The URL address of the Function"
}

output "rmin_redischeck_subscriber_cache_c_url" {
  value       = module.cloud_function.rmin_redischeck_subscriber_cache_c_url
  description = "The URL address of the Function"
}

output "rmin_redischeck_mail_campaign_cache_c_url" {
  value       = module.cloud_function.rmin_redischeck_mail_campaign_cache_c_url
  description = "The URL address of the Function"
}

output "rmin_redischeck_package_campaign_cache_c_url" {
  value       = module.cloud_function.rmin_redischeck_package_campaign_cache_c_url
  description = "The URL address of the Function"
}

output "rmin_redischeck_mics_locks_cache_c_url" {
  value       = module.cloud_function.rmin_redischeck_mics_locks_cache_c_url
  description = "The URL address of the Function"
}

output "rmin_cloud_zip5_timezone_func_c_url" {
  value       = module.cloud_function.rmin_cloud_zip5_timezone_func_c_url
  description = "The URL address of the Function"
}

output "rmin_cloudsql_runpartman_digest_url" {
  value       = module.cloud_function.rmin_cloudsql_runpartman_digest_url
  description = "The URL address of the Function"
}

output "rmin_cloudsql_runpartman_c_url" {
  value       = module.cloud_function.rmin_cloudsql_runpartman_c_url
  description = "The URL address of the Function"
}
output "rmin_cloud_zip5_initiatives_sync_function_c_url" {
  value       = module.cloud_function.rmin_cloud_zip5_initiatives_sync_function_c_url
  description = "The URL address of the Function"

}
# [END cloud_function]


# [START vpc]

output "rmin_e_vpc_id" {
  value       = module.vpc.rmin_e_vpc_id
  description = "The ID of VPC with format projects/{{project}}/global/networks/{{name}}"
}

output "rmin_e_vpc_url" {
  value       = module.vpc.rmin_e_vpc_url
  description = "The URI of the VPC"
}

# [END vpc]

# [START subnetwork]
output "rmin_peripheral_id" {
  value       = module.subnetwork.rmin_peripheral_id
  description = "the ID of the resource with format projects/{{project}}/regions/{{region}}/subnetworks/{{name}}"
}

# [END subnetwork]
