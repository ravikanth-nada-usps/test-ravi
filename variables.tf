# [START Toggle Variables]

variable "toggle_4583_1111_subscriber_services" {
  type = bool
}

variable "toggle_4583_5673_myusps_migration" {
  type = bool
}

variable "toggle_4583_5668_price_change" {
  type = bool
}

variable "toggle_4583_5666_redesign_phase2" {
  type = bool
}

variable "toggle_4583_5681_consumer_portal" {
  type = bool
}

variable "toggle_4583_xxxx_mc_reporting" {
  type = bool
}

variable "toggle_4583_5690_ptr2" {
  type = bool
}

variable "toggle_4583_5680_frontend" {
  type = bool
}
variable "toggle_4583_5708_mdn_to_eng" {
  type = bool
}

variable "toggle_4583_5710_apigee_hybrid" {
  type = bool
}

variable "toggle_4583_5717_rmin_backup" {
  type    = bool
  default = false
}

variable "toggle_4583_xxxx_ext_caches" {
  type    = bool
  default = false
}

# [END Toggle Variables]

# [START General Variables]
variable "project_id" {
  type = string
}

variable "name_suffix" {
  type = string
}

variable "environment" {
  type = string
}

variable "spring_profile" {
  type = string
}

variable "pitr_enablement" {
  type = string
}

variable "id_env_url" {
  type = string
}

variable "informeddelivery_env_url" {
  type = string
}

variable "private_key_filename" {
  type = string
}

variable "certificate_filename" {
  type = string
}

variable "int_lb_subnetwork" {
  type = string
}

# [END General Variables]

# [START cloud_run Variables]

variable "dashboard_event_image_location" {
  type = string
}

variable "dashboard_api_image_location" {
  type = string
}

variable "image_api_image_location" {
  type = string
}

variable "subscriber_api_image_location" {
  type = string
}

variable "subscriber_event_image_location" {
  type = string
}

variable "dashboard_event_version" {
  type = string
}

variable "dashboard_api_version" {
  type = string
}

variable "dashboard_api_internal_version" {
  type = string
}

variable "image_api_version" {
  type = string
}

variable "subscriber_api_version" {
  type = string
}

variable "subscriber_event_version" {
  type = string
}

variable "dashboard_event_service_account" {
  type = string
}

variable "dashboard_api_service_account" {
  type = string
}

variable "image_api_service_account" {
  type = string
}

variable "subscriber_api_service_account" {
  type = string
}

variable "subscriber_event_service_account" {
  type = string
}

variable "firestore_expiry_days" {
  type = number
}

variable "dashboard_event_max_instance_count" {
  type = number
}

variable "dashboard_event_min_instance_count" {
  type = number
}

variable "dashboard_event_execution_environment" {
  type = string
}

variable "dashboard_event_max_instance_request_concurrency" {
  type = number
}

variable "dashboard_event_timeout" {
  type = string
}

variable "dashboard_event_cpu_value" {
  type = string
}

variable "dashboard_event_memory_value" {
  type = string
}

variable "dashboard_event_trace_ratio" {
  type = string
}

variable "dashboard_event_trace_sample" {
  type = string
}

variable "dashboard_toggle_parcel_locker" {
  type = string
}

variable "dashboard_toggle_send_to_locker_and_inbound" {
  type = string
}

variable "dashboard_toggle_usps_possession_ind" {
  type = string
}

variable "dashboard_api_max_instance_count" {
  type = number
}

variable "dashboard_api_min_instance_count" {
  type = number
}

variable "dashboard_api_execution_environment" {
  type = string
}

variable "dashboard_api_max_instance_request_concurrency" {
  type = number
}

variable "dashboard_api_timeout" {
  type = string
}

variable "dashboard_api_cpu_value" {
  type = string
}

variable "dashboard_api_memory_value" {
  type = string
}

variable "dashboard_api_decryptionKey" {
  type = string
}

variable "dashboard_api_toggle_mail_tracking_cloud_url" {
  type = string
}

variable "dashboard_api_toggle_fraud_logic_external" {
  type = string
}

variable "dashboard_api_toggle_parcel_logic_external" {
  type = string
}

variable "dashboard_api_toggle_fraud_logic_internal" {
  type = string
}

variable "dashboard_api_toggle_parcel_logic_internal" {
  type = string
}

variable "dashboard_api_toggle_ecrypt_prem_digest_campaign_clicks" {
  type = string
}

variable "dashboard_api_internal_min_instance_count" {
  type = string
}

variable "dashboard_api_internal_max_instance_request_concurrency" {
  type = string
}

variable "dashboard_api_internal_max_instance_count" {
  type = string
}

variable "dashboard_api_internal_timeout" {
  type = string
}

variable "dashboard_api_internal_cpu_value" {
  type = string
}

variable "dashboard_api_internal_memory_value" {
  type = string
}

variable "eagan_proxy_max_instance_count" {
  type = number
}

variable "eagan_proxy_min_instance_count" {
  type = number
}

variable "eagan_proxy_execution_environment" {
  type = string
}

variable "eagan_proxy_max_instance_request_concurrency" {
  type = number
}

variable "eagan_proxy_service_account" {
  type = string
}

variable "eagan_proxy_timeout" {
  type = string
}

variable "eagan_proxy_version" {
  type = string
}

variable "eagan_proxy_image_location" {
  type = string
}

variable "eagan_proxy_cpu_value" {
  type = string
}

variable "eagan_proxy_memory_value" {
  type = string
}

variable "image_api_max_instance_count" {
  type = number
}

variable "image_api_min_instance_count" {
  type = number
}

variable "image_api_execution_environment" {
  type = string
}

variable "image_api_max_instance_request_concurrency" {
  type = number
}

variable "image_api_timeout" {
  type = string
}

variable "image_api_cpu_value" {
  type = string
}

variable "image_api_memory_value" {
  type = string
}

variable "image_api_external_url" {
  type = string
}

variable "login_api_max_instance_count" {
  type = number
}

variable "login_api_min_instance_count" {
  type = number
}

variable "login_api_execution_environment" {
  type = string
}

variable "login_api_max_instance_request_concurrency" {
  type = number
}

variable "login_api_service_account" {
  type = string
}

variable "login_api_timeout" {
  type = string
}

variable "login_api_version" {
  type = string
}

variable "login_api_image_location" {
  type = string
}

variable "login_api_cpu_value" {
  type = string
}

variable "login_api_memory_value" {
  type = string
}

variable "subscriber_api_max_instance_count" {
  type = number
}

variable "subscriber_api_min_instance_count" {
  type = number
}

variable "subscriber_api_execution_environment" {
  type = string
}

variable "subscriber_api_max_instance_request_concurrency" {
  type = number
}

variable "subscriber_api_timeout" {
  type = string
}

variable "subscriber_api_cpu_value" {
  type = string
}

variable "subscriber_api_memory_value" {
  type = string
}

variable "subscriber_event_max_instance_count" {
  type = number
}

variable "subscriber_event_min_instance_count" {
  type = number
}

variable "subscriber_event_execution_environment" {
  type = string
}

variable "subscriber_event_max_instance_request_concurrency" {
  type = number
}

variable "subscriber_event_timeout" {
  type = string
}

variable "subscriber_event_cpu_value" {
  type = string
}

variable "subscriber_event_memory_value" {
  type = string
}

variable "firestore_subscriber_expiry_days" {
  type = number
}

variable "mics_subscriber_max_instance_count" {
  type = number
}

variable "mics_subscriber_min_instance_count" {
  type = number
}

variable "mics_subscriber_service_account" {
  type = string
}

variable "mics_subscriber_max_instance_request_concurrency" {
  type = number
}

variable "mics_subscriber_timeout" {
  type = string
}

variable "mics_subscriber_cpu_value" {
  type = string
}

variable "mics_subscriber_memory_value" {
  type = string
}

variable "mics_subscriber_version" {
  type = string
}

variable "mics_subscriber_execution_environment" {
  type = string
}

variable "mics_subscriber_image_location" {
  type = string
}

variable "package_api_max_instance_count" {
  type = number
}

variable "package_api_min_instance_count" {
  type = number
}

variable "package_api_execution_environment" {
  type = string
}

variable "package_api_max_instance_request_concurrency" {
  type = number
}

variable "package_api_service_account" {
  type = string
}

variable "package_api_timeout" {
  type = string
}

variable "package_api_version" {
  type = string
}

variable "package_api_image_location" {
  type = string
}

variable "package_api_cpu_value" {
  type = string
}

variable "package_api_memory_value" {
  type = string
}

variable "package_api_usps_base_url" {
  type = string
}

variable "package_event_max_instance_count" {
  type = number
}

variable "package_event_min_instance_count" {
  type = number
}

variable "package_event_execution_environment" {
  type = string
}

variable "package_event_max_instance_request_concurrency" {
  type = number
}

variable "package_event_service_account" {
  type = string
}

variable "package_event_timeout" {
  type = string
}

variable "package_event_version" {
  type = string
}

variable "package_event_image_location" {
  type = string
}

variable "package_event_cpu_value" {
  type = string
}

variable "package_event_memory_value" {
  type = string
}

variable "package_notification_max_instance_count" {
  type = number
}

variable "package_notification_min_instance_count" {
  type = number
}

variable "package_notification_execution_environment" {
  type = string
}

variable "package_notification_max_instance_request_concurrency" {
  type = number
}

variable "package_notification_service_account" {
  type = string
}

variable "package_notification_timeout" {
  type = string
}

variable "package_notification_version" {
  type = string
}

variable "package_notification_image_location" {
  type = string
}

variable "package_notification_cpu_value" {
  type = string
}

variable "package_notification_memory_value" {
  type = string
}

variable "package_notification_sms_max_instance_count" {
  type = number
}

variable "package_notification_sms_min_instance_count" {
  type = number
}

variable "package_notification_sms_execution_environment" {
  type = string
}

variable "package_notification_sms_max_instance_request_concurrency" {
  type = number
}

variable "package_notification_sms_timeout" {
  type = string
}

variable "package_notification_sms_cpu_value" {
  type = string
}

variable "package_notification_sms_memory_value" {
  type = string
}

variable "package_notification_update_max_instance_count" {
  type = number
}

variable "package_notification_update_min_instance_count" {
  type = number
}

variable "package_notification_update_execution_environment" {
  type = string
}

variable "package_notification_update_max_instance_request_concurrency" {
  type = number
}

variable "package_notification_update_service_account" {
  type = string
}

variable "package_notification_update_timeout" {
  type = string
}

variable "package_notification_update_version" {
  type = string
}

variable "package_notification_update_image_location" {
  type = string
}

variable "package_notification_update_cpu_value" {
  type = string
}

variable "package_notification_update_memory_value" {
  type = string
}

variable "mc_report_max_instance_count" {
  type = number
}

variable "mc_report_min_instance_count" {
  type = number
}

variable "mc_report_service_account" {
  type = string
}

variable "mc_report_execution_environment" {
  type = string
}

variable "mc_report_max_instance_request_concurrency" {
  type = number
}

variable "mc_report_timeout" {
  type = string
}

variable "mc_report_image_location" {
  type = string
}

variable "mc_report_version" {
  type = string
}

variable "mc_report_cpu_value" {
  type = string
}

variable "mc_report_memory_value" {
  type = string
}

variable "mc_api_max_instance_count" {
  type = number
}

variable "mc_api_min_instance_count" {
  type = number
}

variable "mc_api_service_account" {
  type = string
}

variable "mc_api_execution_environment" {
  type = string
}

variable "mc_api_max_instance_request_concurrency" {
  type = number
}

variable "mc_api_timeout" {
  type = string
}

variable "mc_api_image_location" {
  type = string
}

variable "mc_api_version" {
  type = string
}

variable "mc_api_cpu_value" {
  type = string
}

variable "mc_api_memory_value" {
  type = string
}

variable "mc_api_toggle_summary_by_detail" {
  type    = bool
  default = false
}

variable "qr_code_max_instance_count" {
  type = number
}

variable "qr_code_min_instance_count" {
  type = number
}

variable "qr_code_service_account" {
  type = string
}

variable "qr_code_execution_environment" {
  type = string
}

variable "qr_code_max_instance_request_concurrency" {
  type = number
}

variable "qr_code_timeout" {
  type = string
}

variable "qr_code_image_location" {
  type = string
}

variable "qr_code_version" {
  type = string
}

variable "qr_code_cpu_value" {
  type = string
}

variable "qr_code_memory_value" {
  type = string
}

variable "qr_code_rest_endpoint" {
  type = string
}

variable "qr_code_toggle_retry" {
  type = string
}

variable "qr_code_toggle_usps_possession_ind" {
  type = string
}

variable "digest_tracking_max_instance_count" {
  type = number
}

variable "digest_tracking_min_instance_count" {
  type = number
}

variable "digest_tracking_service_account" {
  type = string
}

variable "digest_tracking_execution_environment" {
  type = string
}

variable "digest_tracking_max_instance_request_concurrency" {
  type = number
}

variable "digest_tracking_timeout" {
  type = string
}

variable "digest_tracking_image_location" {
  type = string
}

variable "digest_tracking_version" {
  type = string
}

variable "digest_tracking_cpu_value" {
  type = string
}

variable "digest_tracking_memory_value" {
  type = string
}

variable "digest_tracking_redirect_https_env_url" {
  type = string
}

variable "digest_tracking_cloud_url_encrypted_toggle" {
  type = string
}

variable "digest_tracking_base_url_ridealong_click" {
  type = string
}

variable "digest_tracking_base_url_click_track" {
  type = string
}

variable "consumer_portal_max_instance_count" {
  type = number
}

variable "consumer_portal_min_instance_count" {
  type = number
}

variable "consumer_portal_service_account" {
  type = string
}

variable "consumer_portal_max_instance_request_concurrency" {
  type = number
}

variable "consumer_portal_timeout" {
  type = string
}

variable "consumer_portal_cpu_value" {
  type = string
}

variable "consumer_portal_memory_value" {
  type = string
}

variable "consumer_portal_version" {
  type = string
}

variable "consumer_portal_execution_environment" {
  type = string
}

variable "consumer_portal_image_location" {
  type = string
}

variable "dashboard_event_cpu_idle" {
  type    = string
  default = "false"
}

variable "subscriber_api_cpu_idle" {
  type    = string
  default = "false"
}

variable "subscriber_event_cpu_idle" {
  type    = string
  default = "false"
}

variable "dashboard_api_cpu_idle" {
  type    = string
  default = "false"
}

variable "dashboard_api_internal_cpu_idle" {
  type    = string
  default = "false"
}

variable "eagan_proxy_cpu_idle" {
  type    = string
  default = "false"
}


variable "image_api_cpu_idle" {
  type    = string
  default = "false"
}

variable "login_api_cpu_idle" {
  type    = string
  default = "false"
}

variable "mics_subscriber_cpu_idle" {
  type    = string
  default = "false"
}

variable "package_api_cpu_idle" {
  type    = string
  default = "false"
}

variable "package_event_cpu_idle" {
  type    = string
  default = "false"
}

variable "package_notification_cpu_idle" {
  type    = string
  default = "false"
}

variable "mc_report_cpu_idle" {
  type    = string
  default = "false"
}

variable "mc_api_cpu_idle" {
  type    = string
  default = "false"
}

variable "qr_code_cpu_idle" {
  type    = string
  default = "false"
}

variable "digest_tracking_cpu_idle" {
  type    = string
  default = "false"
}

variable "consumer_portal_cpu_idle" {
  type    = string
  default = "false"
}


# [END cloud_run Variables]

# [START pub_sub Variables]

variable "dashboard_subscription_ack_deadline_seconds" {
  type = string
}

variable "dashboard_subscription_retain_acked_messages" {
  type = string
}

variable "dashboard_subscription_enable_message_ordering" {
  type = string
}

variable "dashboard_subscription_message_retention_duration" {
  type = string
}

variable "dashboard_subscription_ttl" {
  type = string
}

variable "dashboard_subscription_min_backoff" {
  type = string
}

variable "dashboard_subscription_max_backoff" {
  type = string
}

variable "dashboard_event_sub_service_account_email" {
  type = string
}

variable "email_topic_sub_service_account_email" {
  type = string
}

variable "email_relay_cutover_url" {
  type = string
}

variable "mc_report_sub_service_account_email" {
  type = string
}

variable "mc_report_cloud_sub_push_endpoint" {
  type = string
}

variable "subscriber_event_service_account_email" {
  type = string
}

variable "qr_code_service_sub_service_account_email" {
  type = string
}

variable "qr_code_service_sub_push_endpoint" {
  type = string
}

# [END pub_sub Variables]

# [START big_query Variables]
variable "partition_expiration_ms" {
  type = number
}
# [END big_query Variables]

# [START cloud_function Variables]

variable "image_dimension_cpu" {
  type = number
}

variable "image_dimension_function_name" {
  type = string
}

variable "image_dimension_max_concurrency" {
  type = number
}

variable "image_dimension_max_instance" {
  type = number
}

variable "image_dimension_memory" {
  type = string
}

variable "image_dimension_min_instance" {
  type = number
}

variable "image_dimension_service_account" {
  type = string
}

variable "image_dimension_timeout" {
  type = number
}

variable "image_dimension_zip_file_name" {
  type = string
}

variable "redischeck_mail_campaign_cpu" {
  type = number
}

variable "redischeck_mail_campaign_function_name" {
  type = string
}

variable "redischeck_mail_campaign_max_concurrency" {
  type = number
}

variable "redischeck_mail_campaign_max_instance" {
  type = number
}

variable "redischeck_mail_campaign_memory" {
  type = string
}

variable "redischeck_mail_campaign_min_instance" {
  type = number
}

variable "redischeck_mail_campaign_timeout" {
  type = number
}

variable "redischeck_mics_locks_c_cpu" {
  type = number
}

variable "redischeck_mics_locks_c_function_name" {
  type = string
}

variable "redischeck_mics_locks_c_max_concurrency" {
  type = number
}

variable "redischeck_mics_locks_c_max_instance" {
  type = number
}

variable "redischeck_mics_locks_c_memory" {
  type = string
}

variable "redischeck_mics_locks_c_min_instance" {
  type = number
}

variable "redischeck_mics_locks_c_timeout" {
  type = number
}

variable "redischeck_mics_locks_c_topic" {
  type = string
}

variable "redischeck_package_campaign_cpu" {
  type = number
}

variable "redischeck_package_campaign_function_name" {
  type = string
}

variable "redischeck_package_campaign_max_concurrency" {
  type = number
}

variable "redischeck_package_campaign_max_instance" {
  type = number
}

variable "redischeck_package_campaign_memory" {
  type = string
}

variable "redischeck_package_campaign_min_instance" {
  type = number
}

variable "redischeck_package_campaign_timeout" {
  type = number
}

variable "redischeck_service_account" {
  type = string
}

variable "redischeck_source_bucket" {
  type = string
}

variable "redischeck_subscriber_cache_c_cpu" {
  type = number
}

variable "redischeck_subscriber_cache_c_function_name" {
  type = string
}

variable "redischeck_subscriber_cache_c_max_concurrency" {
  type = number
}

variable "redischeck_subscriber_cache_c_max_instance" {
  type = number
}

variable "redischeck_subscriber_cache_c_memory" {
  type = string
}

variable "redischeck_subscriber_cache_c_min_instance" {
  type = number
}

variable "redischeck_subscriber_cache_c_timeout" {
  type = number
}

variable "redischeck_subscriber_cache_c_topic" {
  type = string
}

variable "redischeck_zip_file_name" {
  type = string
}

variable "rmin_alerts_e_avail_mem_mb" {
  type = number
}

variable "rmin_alerts_e_domain_name" {
  type = string
}

variable "rmin_alerts_e_from_email" {
  type = string
}

variable "rmin_alerts_e_max_instances" {
  type = number
}

variable "rmin_alerts_e_sa_email" {
  type = string
}

variable "rmin_alerts_e_secret" {
  type = string
}

variable "rmin_alerts_e_secret_version" {
  type = string
}

variable "rmin_alerts_e_timeout" {
  type = number
}

variable "rmin_alerts_e_to_email" {
  type = string
}

variable "rmin_alerts_e_vpc_connector" {
  type = string
}

variable "rmin_cloud_zip5_timezone_func_c_bigquery_table" {
  type = string
}

variable "rmin_cloud_zip5_timezone_func_c_available_cpu" {
  type = number
}

variable "rmin_cloud_zip5_timezone_func_c_max_concurrency" {
  type = number
}

variable "rmin_cloud_zip5_timezone_func_c_max_instance" {
  type = number
}

variable "rmin_cloud_zip5_timezone_func_c_memory" {
  type = string
}

variable "rmin_cloud_zip5_timezone_func_c_min_instance" {
  type = number
}

variable "rmin_cloud_zip5_timezone_func_c_sa_email" {
  type = string
}

variable "rmin_cloud_zip5_timezone_func_c_timeout" {
  type = number
}

variable "rmin_cloud_zip5_timezone_func_c_vpc_connector" {
  type = string
}

variable "rmin_redischeck_flats_cache_c_avail_mem_mb" {
  type = number
}

variable "rmin_redischeck_flats_cache_c_max_instances" {
  type = number
}

variable "rmin_redischeck_flats_cache_c_sa_email" {
  type = string
}

variable "rmin_redischeck_flats_cache_c_timeout" {
  type = number
}

variable "rmin_redischeck_flats_cache_c_vpc_connector" {
  type = string
}

variable "rmin_redischeck_relay_cache_c_avail_mem_mb" {
  type = number
}

variable "rmin_redischeck_relay_cache_c_max_instances" {
  type = number
}

variable "rmin_redischeck_relay_cache_c_sa_email" {
  type = string
}

variable "rmin_redischeck_relay_cache_c_timeout" {
  type = number
}

variable "rmin_redischeck_relay_cache_c_vpc_connector" {
  type = string
}

variable "rmin_redischeck_mdnzip11s_cache_c_avail_mem_mb" {
  type = number
}

variable "rmin_redischeck_mdnzip11s_cache_c_max_instances" {
  type = number
}

variable "rmin_redischeck_mdnzip11s_cache_c_sa_email" {
  type = string
}

variable "rmin_redischeck_mdnzip11s_cache_c_timeout" {
  type = number
}

variable "rmin_redischeck_mdnzip11s_cache_c_vpc_connector" {
  type = string
}

variable "rmin_redischeck_saturation_data_cache_e_avail_mem_mb" {
  type = number
}

variable "rmin_redischeck_saturation_data_cache_e_max_instances" {
  type = number
}

variable "rmin_redischeck_saturation_data_cache_e_sa_email" {
  type = string
}

variable "rmin_redischeck_saturation_data_cache_e_timeout" {
  type = number
}

variable "rmin_redischeck_saturation_data_cache_e_vpc_connector" {
  type = string
}

variable "rmin_redischeck_fs_subscriber_cache_memory" {
  type = string
}

variable "rmin_redischeck_fs_subscriber_email_cache_memory" {
  type = string
}

variable "rmin_mics_extract_avail_mem_mb" {
  type = string
}

variable "rmin_mics_extract_max_instances" {
  type = number
}

variable "rmin_mics_extract_sa_email" {
  type = string
}

variable "rmin_mics_extract_timeout" {
  type = number
}

variable "rmin_mics_extract_cpu" {
  type = string
}

variable "rmin_mics_extract_max_concurrency" {
  type = number
}

variable "rmin_mics_extract_max_retry" {
  type = number
}

variable "rmin_mics_extract_queue_id" {
  type = string
}

variable "rmin_mics_extract_location_id" {
  type = string
}

variable "rmin_redischeck_subscriber_email_cache_c_avail_mem_mb" {
  type = number
}

variable "rmin_redischeck_subscriber_email_cache_c_max_instances" {
  type = number
}

variable "rmin_redischeck_subscriber_email_cache_c_sa_email" {
  type = string
}

variable "rmin_redischeck_subscriber_email_cache_c_timeout" {
  type = number
}

variable "rmin_redischeck_subscriber_email_cache_c_vpc_connector" {
  type = string
}

variable "rmin_cloudsql_runpartman_c_db_host" {
  type = string
}

variable "rmin_cloudsql_runpartman_digest_db_host" {
  type = string
}

variable "rmin_cloudsql_runpartman_c_db_name" {
  type = string
}

variable "rmin_cloudsql_runpartman_digest_db_name" {
  type = string
}

variable "rmin_cloudsql_runpartman_c_db_port" {
  type = string
}

variable "rmin_cloudsql_runpartman_digest_db_port" {
  type = string
}

variable "rmin_cloudsql_runpartman_digest_db_user" {
  type = string
}

variable "rmin_cloudsql_runpartman_c_db_user" {
  type = string
}

variable "rmin_cloudsql_runpartman_digest_mount_path" {
  type = string
}

variable "rmin_cloudsql_runpartman_c_mount_path" {
  type = string
}

variable "rmin_cloudsql_runpartman_digest_secret" {
  type = string
}

variable "rmin_cloudsql_runpartman_c_secret" {
  type = string
}

variable "rmin_cloudsql_runpartman_c_available_cpu" {
  type = number
}

variable "rmin_cloudsql_runpartman_digest_available_cpu" {
  type = number
}

variable "rmin_cloudsql_runpartman_c_memory" {
  type = string
}

variable "rmin_cloudsql_runpartman_digest_memory" {
  type = string
}

variable "rmin_cloudsql_runpartman_c_max_instance" {
  type = number
}

variable "rmin_cloudsql_runpartman_digest_max_instance" {
  type = number
}

variable "rmin_cloudsql_runpartman_c_max_concurrency" {
  type = number
}

variable "rmin_cloudsql_runpartman_digest_max_concurrency" {
  type = number
}

variable "rmin_cloudsql_runpartman_c_min_instance" {
  type = number
}

variable "rmin_cloudsql_runpartman_digest_min_instance" {
  type = number
}

variable "rmin_cloudsql_runpartman_c_sa_email" {
  type = string
}

variable "rmin_cloudsql_runpartman_digest_sa_email" {
  type = string
}

variable "rmin_cloudsql_runpartman_c_timeout" {
  type = number
}

variable "rmin_cloudsql_runpartman_digest_timeout" {
  type = number
}

variable "rmin_cloudsql_runpartman_c_vpc_connector" {
  type = string
}

variable "rmin_cloudsql_runpartman_digest_vpc_connector" {
  type = string
}

variable "subscriber_update_function_cpu" {
  type = number
}

variable "subscriber_update_function_max_concurrency" {
  type = number
}

variable "subscriber_update_function_max_instance" {
  type = number
}

variable "subscriber_update_function_memory" {
  type = string
}

variable "subscriber_update_function_min_instance" {
  type = number
}

variable "subscriber_update_function_name" {
  type = string
}

variable "subscriber_update_function_service_account" {
  type = string
}

variable "subscriber_update_function_timeout" {
  type = string
}

variable "subscriber_update_function_zip_file_name" {
  type = string
}

variable "package_notification_trigger_function_cpu" {
  type = number
}

variable "package_notification_trigger_function_max_concurrency" {
  type = number
}

variable "package_notification_trigger_function_max_instance" {
  type = number
}

variable "package_notification_trigger_function_memory" {
  type = string
}

variable "package_notification_trigger_function_min_instance" {
  type = number
}

variable "package_notification_trigger_function_name" {
  type = string
}

variable "package_notification_trigger_function_service_account" {
  type = string
}

variable "package_notification_trigger_function_timeout" {
  type = string
}

variable "package_notification_trigger_function_zip_file_name" {
  type = string
}

variable "package_notification_trigger_mp_toggle" {
  type = bool
}

variable "rmin_cloud_zip5_initiatives_sync_function_c_available_cpu" {
  type = number
}

variable "rmin_cloud_zip5_initiatives_sync_function_c_max_concurrency" {
  type = number
}

variable "rmin_cloud_zip5_initiatives_sync_function_c_max_instance" {
  type = number
}

variable "rmin_cloud_zip5_initiatives_sync_function_c_memory" {
  type = string
}

variable "rmin_cloud_zip5_initiatives_sync_function_c_min_instance" {
  type = number
}

variable "rmin_cloud_zip5_initiatives_sync_function_c_sa_email" {
  type = string
}

variable "rmin_cloud_zip5_initiatives_sync_function_c_timeout" {
  type = number
}


variable "inbound_package_sync_trigger_function_name" {
  type = string
}

variable "inbound_package_sync_trigger_function_zip_file_name" {
  type = string
}

variable "inbound_package_sync_trigger_function_min_instance" {
  type = string
}

variable "inbound_package_sync_trigger_function_max_instance" {
  type = string
}

variable "inbound_package_sync_trigger_function_memory" {
  type = string
}

variable "inbound_package_sync_trigger_function_timeout" {
  type = string
}

variable "inbound_package_sync_trigger_function_max_concurrency" {
  type = string
}

variable "inbound_package_sync_trigger_function_cpu" {
  type = string
}

variable "inbound_package_sync_trigger_function_service_account" {
  type = string
}

variable "inbound_package_sync_trigger_function_partitions" {
  type = string
}

variable "process_failed_package_notif_function_c_available_cpu" {
  type = number
}

variable "process_failed_package_notif_function_c_max_concurrency" {
  type = number
}

variable "process_failed_package_notif_function_c_max_instance" {
  type = number
}

variable "process_failed_package_notif_function_c_memory" {
  type = string
}

variable "process_failed_package_notif_function_c_min_instance" {
  type = number
}

variable "process_failed_package_notif_function_c_sa_email" {
  type = string
}

variable "process_failed_package_notif_function_c_timeout" {
  type = number
}

variable "mdn_eng_feed_function_min_instance" {
  type = string
}

variable "mdn_eng_feed_function_max_instance" {
  type = string
}

variable "mdn_eng_feed_function_memory" {
  type = string
}

variable "mdn_eng_feed_function_timeout" {
  type = string
}

variable "mdn_eng_feed_function_max_concurrency" {
  type = string
}

variable "mdn_eng_feed_function_cpu" {
  type = string
}

variable "mdn_eng_feed_function_service_account" {
  type = string
}

variable "mdn_eng_feed_function_connector" {
  type = string
}

variable "mdn_eng_feed_function_name" {
  type = string
}

variable "mdn_eng_feed_function_eng_toggle" {
  type = string
}

variable "mdn_eng_feed_function_azure_acct" {
  type = string
}

variable "mdn_eng_feed_function_azure_cntr" {
  type = string
}

variable "mdn_eng_feed_function_azure_file" {
  type = string
}

variable "mdn_eng_feed_function_mount_path" {
  type = string
}

variable "mdn_eng_feed_function_secret" {
  type = string
}

# [END cloud_function Variables] 

# [START memstore Variables]

variable "rmin_flats_lock_cache_c_memory_size_gb" {
  type = string
}

variable "rmin_flats_lock_cache_c_replica_count" {
  type = string
}

variable "rmin_flats_lock_cache_c_replica_enabled" {
  type = bool
}

variable "rmin_mail_campaign_cache_c_memory_size_gb" {
  type = string
}

variable "rmin_mail_campaign_cache_c_replica_count" {
  type = string
}

variable "rmin_mail_campaign_cache_c_replica_enabled" {
  type = bool
}

variable "rmin_mail_campaign_cache_ext_c_memory_size_gb" {
  type = string
}

variable "rmin_mail_campaign_cache_ext_c_replica_count" {
  type = string
}

variable "rmin_mail_campaign_cache_ext_c_replica_enabled" {
  type = bool
}

variable "rmin_mdn_zip11s_cache_c_memory_size_gb" {
  type = string
}

variable "rmin_mdn_zip11s_cache_c_replica_count" {
  type = string
}

variable "rmin_mdn_zip11s_cache_c_replica_enabled" {
  type = bool
}

variable "rmin_mics_locks_cache_c_memory_size_gb" {
  type = string
}

variable "rmin_mics_locks_cache_c_replica_count" {
  type = string
}

variable "rmin_mics_locks_cache_c_replica_enabled" {
  type = bool
}

variable "rmin_package_campaign_cache_c_memory_size_gb" {
  type = string
}

variable "rmin_package_campaign_cache_c_replica_count" {
  type = string
}

variable "rmin_package_campaign_cache_c_replica_enabled" {
  type = bool
}

variable "rmin_package_campaign_cache_ext_c_memory_size_gb" {
  type = string
}

variable "rmin_package_campaign_cache_ext_c_replica_count" {
  type = string
}

variable "rmin_package_campaign_cache_ext_c_replica_enabled" {
  type = bool
}

variable "rmin_relay_locks_cache_c_memory_size_gb" {
  type = string
}

variable "rmin_relay_locks_cache_c_replica_enabled" {
  type = bool
}

variable "rmin_saturation_data_cache_e_memory_size_gb" {
  type = string
}

variable "rmin_saturation_data_cache_e_replica_count" {
  type = string
}

variable "rmin_saturation_data_cache_e_replica_enabled" {
  type = bool
}

variable "rmin_subscriber_cache_c_memory_size_gb" {
  type = string
}

variable "rmin_subscriber_cache_c_replica_count" {
  type = string
}

variable "rmin_subscriber_cache_c_replica_enabled" {
  type = bool
}

variable "rmin_subscriber_email_cache_c_memory_size_gb" {
  type = string
}

variable "rmin_subscriber_email_cache_c_replica_count" {
  type = string
}

variable "rmin_subscriber_email_cache_c_replica_enabled" {
  type = bool
}

variable "rmin_fs_subscriber_cache_memory_size_gb" {
  type = string
}

variable "rmin_fs_subscriber_cache_replica_count" {
  type = string
}

variable "rmin_fs_subscriber_cache_replica_enabled" {
  type = bool
}

variable "rmin_fs_subscriber_email_cache_memory_size_gb" {
  type = string
}

variable "rmin_fs_subscriber_email_cache_replica_count" {
  type = string
}

variable "rmin_fs_subscriber_email_cache_replica_enabled" {
  type = bool
}

variable "rmin_zip5_initiatives_cache_c_memory_size_gb" {
  type = string
}
variable "rmin_zip5_initiatives_cache_c_replica_enabled" {
  type = bool
}

variable "rmin_zip5_initiatives_cache_c_replica_count" {
  type = string
}

# [END memstore Variables] 

# [START subnetwork Variables] 

variable "idc_cloudrun_email_serverless_ip_cidr_range" {
  type = string
}

variable "idc_cloudrun_email_serverless_name" {
  type = string
}

variable "rmin_dashboard_serverless_ip_cidr_range" {
  type = string
}

variable "rmin_dashboard_serverless_vpc_name" {
  type = string
}

variable "rmin_e_dataflow_email_ip_cidr_range" {
  type = string
}

variable "rmin_e_dataflow_email_name" {
  type = string
}

variable "rmin_e_dataflow_peripheral_ip_cidr_range" {
  type = string
}

variable "rmin_e_dataflow_peripheral_name" {
  type = string
}

variable "rmin_e_serverless_connector_name" {
  type = string
}

variable "rmin_e_serverless_connector_ip_cidr_range" {
  type = string
}

variable "rmin_e_serverless_email_ip_cidr_range" {
  type = string
}

variable "rmin_e_serverless_email_name" {
  type = string
}

variable "rmin_email_serverless_ip_cidr_range" {
  type = string
}

variable "rmin_email_serverless_vpc_name" {
  type = string
}

variable "rmin_peripheral_ip_cidr_range" {
  type = string
}

variable "rmin_peripheral_serverless_ip_cidr_range" {
  type = string
}

variable "rmin_peripheral_serverless_vpc_name" {
  type = string
}

variable "rmin_peripheral_vpc_name" {
  type = string
}

variable "rmin_subscriber_serverless_vpc_name" {
  type = string
}

variable "rmin_subscriber_serverless_ip_cidr_range" {
  type = string
}

variable "rmin_subscriber_peripheral_name" {
  type = string
}

variable "rmin_subscriber_peripheral_ip_cidr_range" {
  type = string
}

variable "rmin_api_serverless_name" {
  type = string
}
# [END subnetwork Variables] 

# [START connectors Variables] 

variable "dashboard_serverless_connector_machine_type" {
  type = string
}

variable "dashboard_serverless_connector_min_instances" {
  type = number
}

variable "dashboard_serverless_connector_max_instances" {
  type = number
}

variable "dashboard_serverless_conn_name" {
  type = string
}

variable "peripheral_serverless_connector_machine_type" {
  type = string
}

variable "peripheral_serverless_connector_min_instances" {
  type = number
}

variable "peripheral_serverless_connector_max_instances" {
  type = number
}

variable "peripheral_serverless_conn_name" {
  type = string
}

variable "email_serverless_connector_machine_type" {
  type = string
}

variable "email_serverless_connector_min_instances" {
  type = number
}

variable "email_serverless_connector_max_instances" {
  type = number
}

variable "email_serverless_conn_name" {
  type = string
}

variable "rmin_serverless_conn_name" {
  type = string
}

variable "idc_email_serverless_name" {
  type = string
}

variable "rmin_e_servless_email_name" {
  type = string
}

variable "subscriber_serverless_connector_machine_type" {
  type = string
}

variable "subscriber_serverless_connector_min_instances" {
  type = number
}

variable "subscriber_serverless_connector_max_instances" {
  type = number
}

variable "subscriber_serverless_conn_name" {
  type = string
}

variable "rmin_api_conn_name" {
  type = string
}

variable "package_serverless_conn_name" {
  type = string
}

variable "package_serverless_connector_machine_type" {
  type = string
}

variable "package_serverless_connector_max_instances" {
  type = number
}

variable "package_serverless_connector_min_instances" {
  type = number
}

# [END connectors Variables] 

# [START cloud_scheduler Variables]

variable "mdn_eng_feed_version" {
  type    = string
  default = "1.0.9"

}

variable "mdn_eng_feed_sa_email" {
  type = string
}

variable "mdn_eng_feed_schedule" {
  type = string
}

variable "mdn_eng_feed_workers" {
  type = number
}

variable "mdn_eng_feed_subnetwork" {
  type = string
}

variable "mdn_eng_feed_num_shard" {
  type = string
}

variable "rmin_gcr_pruner_attempt_deadline" {
  type = string
}

variable "rmin_gcr_pruner_cloud_run_url" {
  type = string
}

variable "rmin_gcr_pruner_paused" {
  type = string
}

variable "rmin_gcr_pruner_sa_email" {
  type = string
}

variable "rmin_gcr_pruner_schedule" {
  type = string
}

variable "rmin_report_email_completion_tz_cloud_run_url" {
  type = string
}

variable "rmin_report_email_completion_tz_sa_email" {
  type = string
}

variable "rmin_report_email_completion_tz_schedule" {
  type = string
}

variable "rmin_report_email_sla_timezone_sunday_cloud_run_url" {
  type = string
}

variable "rmin_report_email_sla_timezone_sunday_sa_email" {
  type = string
}

variable "rmin_report_email_sla_timezone_sunday_schedule" {
  type = string
}

variable "rmin_report_file_and_email_sla_timezone_cloud_run_url" {
  type = string
}

variable "rmin_report_file_and_email_sla_timezone_sa_email" {
  type = string
}

variable "rmin_report_file_and_email_sla_timezone_schedule" {
  type = string
}

variable "rmin_report_missing_emails_cloud_run_url" {
  type = string
}

variable "rmin_report_missing_emails_sa_email" {
  type = string
}

variable "rmin_report_missing_emails_schedule" {
  type = string
}

variable "rmin_report_processing_volumes_cloud_run_url" {
  type = string
}

variable "rmin_report_processing_volumes_sa_email" {
  type = string
}

variable "rmin_report_processing_volumes_schedule" {
  type = string
}

variable "rmin_report_zip5_email_processing_time_cloud_run_url" {
  type = string
}

variable "rmin_report_zip5_email_processing_time_sa_email" {
  type = string
}

variable "rmin_report_zip5_email_processing_time_schedule" {
  type = string
}

variable "rmin_zip5_initiatives_sync_sa_email" {
  type = string
}

variable "run_partman_c_attempt_deadline" {
  type = string
}

variable "run_partman_c_func_url" {
  type = string
}

variable "run_partman_c_sa_email" {
  type = string
}

variable "run_partman_c_schedule" {
  type = string
}

variable "run_partman_digest_attempt_deadline" {
  type = string
}

variable "run_partman_digest_func_url" {
  type = string
}

variable "run_partman_digest_sa_email" {
  type = string
}

variable "run_partman_digest_schedule" {
  type = string
}

variable "run_zip5_timezone_c_attempt_deadline" {
  type = string
}

variable "run_zip5_timezone_c_func_url" {
  type = string
}

variable "run_zip5_timezone_c_sa_email" {
  type = string
}

variable "run_zip5_timezone_c_schedule" {
  type = string
}

variable "sunday_digest_cloud_run_version_central" {
  type = string
}

variable "sunday_digest_error_topic" {
  type = string
}

variable "sunday_digest_max_workers" {
  type = number
}

variable "sunday_digest_redis_max_conn" {
  type = string
}

variable "sunday_digest_redis_max_idle" {
  type = string
}

variable "sunday_digest_redis_min_idle" {
  type = string
}

variable "sunday_digest_database" {
  type = string
}

variable "sunday_digest_sa_email" {
  type = string
}

variable "sunday_digest_logging_table" {
  type = string
}

variable "sunday_digest_schedule" {
  type = string
}

variable "sunday_digest_sdk_log_level" {
  type = string
}

variable "sunday_digest_sub_drop_bucket" {
  type = string
}

variable "sunday_digest_subnetwork" {
  type = string
}

variable "sunday_digest_toggle_dedupe_sunday_email" {
  type = string
}

variable "sunday_digest_toggle_email_cache_lookup" {
  type = string
}

variable "sunday_digest_topic_name" {
  type = string
}

variable "rmin_mics_extract_trigger_schedule" {
  type = string
}

variable "cache_refresh_subnetwork" {
  type = string
}

variable "cache_refresh_redis_max_conn" {
  type = number
}

variable "cache_refresh_redis_max_idle" {
  type = number
}

variable "cache_refresh_redis_min_idle" {
  type = number
}

variable "cache_refresh_redis_max_wait_millis" {
  type = number
}

variable "cache_refresh_redis_timeout_millis" {
  type = number
}

variable "cache_refresh_max_workers" {
  type = number
}

variable "cache_refresh_sa_email" {
  type = string
}

variable "cache_refresh_schedule" {
  type = string
}

variable "cache_refresh_version" {
  type = string
}

variable "cache_refresh_partition_count" {
  type = string
}

variable "dashboard_api_internal_pre_warm_schedule" {
  type = string
}

variable "dashboard_api_internal_pre_warm_min_instances" {
  type = number
}

variable "dashboard_api_internal_post_warm_schedule" {
  type = string
}

variable "cloud_run_warming_sa" {
  type = string
}

variable "frontend_apis_pre_warm_schedule" {
  type = string
}

variable "frontend_apis_post_warm_schedule" {
  type = string
}

variable "dashboard_api_pre_warm_min_instances" {
  type = number
}

variable "image_api_pre_warm_min_instances" {
  type = number
}

variable "login_api_pre_warm_min_instances" {
  type = number
}

variable "subscriber_api_pre_warm_min_instances" {
  type = number
}

variable "package_api_pre_warm_min_instances" {
  type = number
}

variable "eagan_proxy_pre_warm_min_instances" {
  type = number
}

variable "consumer_portal_pre_warm_min_instances" {
  type = number
}

variable "rmin_redis_export_backup_scheduler_region" {
  type = string
}

variable "rmin_redis_export_backup_scheduler_schedule" {
  type = string
}
  
variable "rmin_redis_export_backup_scheduler_timezone" {
  type = string
}
       
variable "rmin_redis_export_backup_service_account" {
  type = string
}

variable "rmin_bigquery_export_backup_scheduler_region" {
  type = string
}

variable "rmin_bigquery_export_backup_scheduler_schedule" {
  type = string
}
     
variable "rmin_bigquery_export_backup_scheduler_timezone" {
  type = string
}

variable "rmin_bigquery_export_backup_service_account" {
  type = string
}

# [END cloud_scheduler Variables]

# [START vpc Variables]

variable "rmin_e_vpc_name" {
  type = string
}

variable "rmin_e_pvt_svc_connection_name" {
  type = string
}

# [END vpc Variables]

# [START cloud_nat Variables]

variable "cloud_nat_name" {
  type = string
}

variable "external_nat_ip_name" {
  type = string
}

variable "router_name" {
  type = string
}

# [END cloud_nat Variables]

# [START cloudsql_digest Variables]

variable "digest_db_instance_allocated_ip_range" {
  type = string
}

variable "digest_db_instance_availability_type" {
  type = string
}

variable "digest_db_instance_disk_autoresize" {
  type    = string
  default = "true"
}

variable "digest_db_instance_disk_autoresize_limit" {
  type = number
}

variable "digest_db_instance_disk_size_gb" {
  type = number
}

variable "digest_db_instance_log_rentention_days" {
  type = number
}

variable "digest_db_instance_query_insights_enabled" {
  type = string
}

variable "digest_db_instance_query_string_length" {
  type = number
}

variable "digest_db_instance_record_application_tags" {
  type = string
}

variable "digest_db_instance_record_client_address" {
  type = string
}

variable "digest_db_instance_retained_backups_count" {
  type = number
}

variable "rmin_digest_db_user_name" {
  type = string
}

variable "digest_db_instance_tier" {
  type = string
}

variable "digest_db_instance_maint_update_track" {
  type = string
}

# [END cloudsql_digest Variables]

# [START cloudsql_mdn Variables]

variable "mdn_db_instance_allocated_ip_range" {
  type = string
}

variable "mdn_db_instance_availability_type" {
  type = string
}

variable "mdn_db_instance_disk_autoresize" {
  type    = string
  default = "true"
}

variable "mdn_db_instance_disk_autoresize_limit" {
  type = number
}

variable "mdn_db_instance_disk_size_gb" {
  type = number
}

variable "mdn_db_instance_query_insights_enabled" {
  type = string
}

variable "mdn_db_instance_query_string_length" {
  type = number
}

variable "mdn_db_instance_record_application_tags" {
  type = string
}

variable "mdn_db_instance_record_client_address" {
  type = string
}

variable "mdn_db_instance_retained_backups_count" {
  type = number
}

variable "mdn_db_instance_log_rentention_days" {
  type = number
}

variable "rmin_mdn_db_user_name" {
  type = string
}

variable "mdn_db_instance_tier" {
  type = string
}

variable "mdn_db_instance_maint_update_track" {
  type = string
}

# [END cloudsql_mdn Variables]

# [START cloudsql_mc Variables]

variable "mc_db_instance_allocated_ip_range" {
  type = string
}

variable "mc_db_instance_availability_type" {
  type = string
}

variable "mc_db_instance_disk_autoresize" {
  type    = string
  default = "true"
}

variable "mc_db_instance_disk_autoresize_limit" {
  type = number
}

variable "mc_db_instance_disk_size_gb" {
  type = number
}

variable "mc_db_instance_query_insights_enabled" {
  type = string
}

variable "mc_db_instance_query_string_length" {
  type = number
}

variable "mc_db_instance_record_application_tags" {
  type = string
}

variable "mc_db_instance_record_client_address" {
  type = string
}

variable "mc_db_instance_retained_backups_count" {
  type = number
}

variable "mc_db_instance_log_rentention_days" {
  type = number
}

variable "rmin_mc_db_user_name" {
  type = string
}

variable "mc_db_instance_tier" {
  type = string
}

variable "mc_db_instance_maint_update_track" {
  type = string
}

# [END cloudsql_mc Variables]

# [START dashboard_firestore Variables]

variable "dashboard_firestore_backup_retention" {
  type = string
}

# [END dashboard_firestore Variables]

# [START mail_campaign_firestore Variables]

variable "mail_campaign_firestore_backup_retention" {
  type = string
}

# [END mail_campaign_firestore Variables]

# [START subscriber_firestore Variables]

variable "subscribers_firestore_backup_retention" {
  type = string
}

# [END subscriber_firestore Variables]

# [START internal_lb Variables]

variable "rmin_lb_ip_int_c_address" {
  type = string
}

# [END internal_lb Variables]

# [START external_lb Variables]

variable "rmin_lb_ip_ext_c_address" {
  type = string
}

# [END external_lb Variables]

# [START dataflow_jobconfigs Variables]

variable "rmin_cloud_campaigns_config_version" {
  type    = string
  default = "3.0.4"
}

variable "rmin_cloud_locale_key_ingest_config_version" {
  type    = string
  default = "0.0.8"
}

variable "rmin_cloud_mdn_event_log_processor_config_version" {
  type    = string
  default = "0.1.0"
}

variable "rmin_cloud_ninetynine_m_barcode_ingest_config_version" {
  type    = string
  default = "0.0.12"
}

variable "rmin_cloud_digest_event_processor_config_version" {
  type    = string
  default = "1.1.0"
}

# [END dataflow_jobconfigs Variables]

# [ START cloud_storage variables ]

// [ START redis vars ]
variable "rmin_redis_export_backup_bucket_e_location" {
  type = string
}

variable "rmin_redis_export_backup_bucket_e_storage_class" {
  type = string
}

variable "rmin_redis_export_backup_bucket_e_lifecycle_rule_condition_age" {
  type = number
}
// [ END redis vars ]

// [ START bigquery vars ]
variable "rmin_bigquery_export_backup_bucket_e_location" {
  type = string
}

variable "rmin_bigquery_export_backup_bucket_e_storage_class" {
  type = string
}

variable "rmin_bigquery_export_backup_bucket_e_lifecycle_rule_condition_age" {
  type = number
}
// [ END bigquery vars ]

# [ END cloud_storage variables ]