variable "project_id" {
  type = string
}

variable "dataset" {
  type = string
}

variable "toggle_4583_1111_subscriber_services" {
  type    = bool
  default = false
}

variable "toggle_4583_5673_myusps_migration" {
  type    = bool
  default = false
}

variable "toggle_4583_xxxx_mc_reporting" {
  type    = bool
  default = false
}

variable "toggle_4583_5681_consumer_portal" {
  type    = bool
  default = false
}

variable "toggle_4583_5680_frontend" {
  type    = bool
  default = false
}

variable "toggle_4583_5710_apigee_hybrid" {
  type    = bool
  default = false
}

variable "dashboard_event_image_location" {
  type = string
}

variable "dashboard_api_image_location" {
  type = string
}

variable "image_api_image_location" {
  type = string
}

variable "subscriber_event_image_location" {
  type = string
}

variable "subscriber_api_image_location" {
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

variable "subscriber_event_version" {
  type = string
}

variable "subscriber_api_version" {
  type = string
}

variable "environment" {
  type = string
}

variable "spring_profile" {
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

variable "subscriber_event_service_account" {
  type = string
}

variable "subscriber_api_service_account" {
  type = string
}

variable "vpc_connector" {
  type = string
}

variable "subscriber_vpc_connector" {
  type = string
}

variable "api_vpc_connector" {
  type = string
}

variable "firestore_expiry_days" {
  type = number
}

variable "firestore_subscriber_expiry_days" {
  type = number
}

variable "mailCampaignCache_read_ip" {
  type = string
}

variable "packageCampaignCache_read_ip" {
  type = string
}

variable "mailCampaignCache_ip" {
  type = string
}

variable "packageCampaignCache_ip" {
  type = string
}

variable "mailCampaignCache_read_ext_ip" {
  type = string
}

variable "packageCampaignCache_read_ext_ip" {
  type = string
}

variable "mailCampaignCache_ext_ip" {
  type = string
}

variable "packageCampaignCache_ext_ip" {
  type = string
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

variable "dashboard_zip5_done_topic" {
  type = string
}

variable "dashboard_toggle_parcel_locker" {
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

variable "dashboard_toggle_send_to_locker_and_inbound" {
  type = string
}

variable "dashboard_toggle_usps_possession_ind" {
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

variable "mail_campaign_image_bucket" {
  type = string
}

variable "mail_campaign_image_bucket_ext" {
  type = string
}

variable "package_campaign_image_bucket" {
  type = string
}

variable "package_campaign_image_bucket_ext" {
  type = string
}

variable "dashboard_api_logs_topic_name" {
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

variable "eagan_proxy_logs_topic_name" {
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

variable "image_api_logs_topic_name" {
  type = string
}

variable "image_api_external_url" {
  type = string
}

variable "subscriber_dropbox_bucket" {
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

variable "login_api_logs_topic" {
  type = string
}

variable "subscriber_event_topic" {
  type = string
}

variable "package_vpc_connector" {
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

variable "package_api_logs_topic" {
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

variable "package_notification_logs_topic" {
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

variable "package_notification_topic" {
  type = string
}

variable "package_sms_notification_topic" {
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

variable "subscriber_api_log_topic" {
  type = string
}

variable "subscriber_opt_in_settings_topic" {
  type = string
}

variable "zip5_initiative_cache_ip" {
  type = string
}

variable "digest_opt_out_reason_topic" {
  type = string
}

variable "dashboard_api_decryptionKey" {
  type = string
}

variable "dashboard_db_name" {
  type = string
}

variable "subscribers_db_name" {
  type = string
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

variable "mics_subscriber_bucket" {
  type = string
}

variable "subscriber_cache_ip" {
  type = string
}

variable "mics_subscriber_table" {
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

variable "rmin_peripheral_connector" {
  type = string
}

variable "toggle_4583_5668_price_change" {
  type    = bool
  default = false
}

variable "mc_cloud_mail_campaign_reporting_job_logs_bq_table" {
  type = string
}

variable "mc_mail_campaign_firestore_db" {
  type = string
}

variable "mc_po_campaign_reporting_topic_name" {
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

variable "toggle_4583_5666_redesign_phase2" {
  type    = bool
  default = false
}

variable "qr_code_service_job_logs_bq_table" {
  type = string
}

variable "qr_code_rest_endpoint" {
  type = string
}

variable "qr_code_image_bucket_name" {
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

variable "digest_tracking_event_topic" {
  type = string
}

variable "digest_tracking_click_topic" {
  type = string
}

variable "digest_tracking_error_topic" {
  type = string
}

variable "digest_tracking_redirect_https_env_url" {
  type = string
}

variable "digest_tracking_cloud_url_encrypted_toggle" {
  type = string
}

variable "digest_tracking_mc_click_data_sync_topic" {
  type = string
}

variable "digest_tracking_mc_click_topic" {
  type = string
}

variable "digest_tracking_base_url_ridealong_click" {
  type = string
}

variable "digest_tracking_base_url_click_track" {
  type = string
}

variable "dashboard_event_topic_name" {
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

variable "rmin_global_elements_bucket_c_name" {
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

variable "package_notification_sms_cpu_idle" {
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
