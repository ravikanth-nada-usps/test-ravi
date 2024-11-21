variable "toggle_4583_1111_subscriber_services" {
  type    = bool
  default = false
}

variable "toggle_4583_5673_myusps_migration" {
  type    = bool
  default = false
}

variable "toggle_4583_5681_consumer_portal" {
  type    = bool
  default = false
}

variable "toggle_4583_5690_ptr2" {
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

variable "toggle_4583_5708_mdn_to_eng" {
  type    = bool
  default = false
}

variable "toggle_4583_xxxx_ext_caches" {
  type    = bool
  default = false
}

variable "dashboard_db_location" {
  type = string
}

variable "dashboard_db_name" {
  type = string
}

variable "subscribers_db_location" {
  type = string
}

variable "subscribers_db_name" {
  type = string
}

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

variable "name_suffix" {
  type = string
}

variable "project_id" {
  type = string
}

variable "package_notification_trigger_function_name" {
  type = string
}

variable "package_notification_trigger_function_zip_file_name" {
  type = string
}

variable "package_notification_trigger_function_min_instance" {
  type = string
}

variable "package_notification_trigger_function_max_instance" {
  type = string
}

variable "package_notification_trigger_function_memory" {
  type = string
}

variable "package_notification_trigger_function_timeout" {
  type = string
}

variable "package_notification_trigger_function_max_concurrency" {
  type = string
}

variable "package_notification_trigger_function_cpu" {
  type = string
}

variable "package_notification_connector" {
  type = string
}

variable "package_notification_topic" {
  type = string
}

variable "package_notification_trigger_mp_toggle" {
  type = bool
}

variable "package_notification_trigger_function_service_account" {
  type = string
}

variable "package_vpc_connector" {
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

variable "redischeck_mail_campaign_topic" {
  type = string
}

variable "redischeck_mail_campaign_ext_topic" {
  type = string
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

variable "redischeck_package_campaign_topic" {
  type = string
}

variable "redischeck_package_campaign_ext_topic" {
  type = string
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

variable "rmin_redischeck_fs_subscriber_cache_memory" {
  type = string
}

variable "rmin_redischeck_fs_subscriber_email_cache_memory" {
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

variable "rmin_alerts_e_resource" {
  type = string
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

variable "rmin_cloud_zip5_timezone_func_c_redis_ip" {
  type = string
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

variable "rmin_mail_campaign_cache_c_ip" {
  type = string
}

variable "rmin_mail_campaign_cache_ext_c_ip" {
  type = string
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

variable "rmin_cloud_zip5_initiatives_sync_function_c_redis_ip" {
  type = string
}

variable "rmin_cloud_zip5_initiatives_sync_function_c_sa_email" {
  type = string
}

variable "rmin_cloud_zip5_initiatives_sync_function_c_timeout" {
  type = number
}

variable "rmin_cloud_zip5_initiatives_sync_function_c_vpc_connector" {
  type = string
}

variable "rmin_cloud_zip5_initiatives_sync_function_c_bigquery_table" {
  type = string
}



variable "rmin_mics_locks_cache_c_ip" {
  type = string
}

variable "rmin_package_campaign_cache_c_ip" {
  type = string
}

variable "rmin_package_campaign_cache_ext_c_ip" {
  type = string
}

variable "rmin_redischeck_flats_cache_c_avail_mem_mb" {
  type = number
}

variable "rmin_redischeck_flats_cache_c_max_instances" {
  type = number
}

variable "rmin_redischeck_flats_cache_c_redishost" {
  type = string
}

variable "rmin_redischeck_flats_cache_c_resource" {
  type = string
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

variable "rmin_redischeck_relay_cache_c_redishost" {
  type = string
}

variable "rmin_redischeck_relay_cache_c_resource" {
  type = string
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

variable "rmin_redischeck_mdnzip11s_cache_c_redishost" {
  type = string
}

variable "rmin_redischeck_mdnzip11s_cache_c_resource" {
  type = string
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

variable "rmin_redischeck_saturation_data_cache_e_redishost" {
  type = string
}

variable "rmin_redischeck_saturation_data_cache_e_resource" {
  type = string
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

variable "rmin_redischeck_subscriber_email_cache_c_avail_mem_mb" {
  type = number
}

variable "rmin_redischeck_subscriber_email_cache_c_max_instances" {
  type = number
}

variable "rmin_redischeck_subscriber_email_cache_c_redishost" {
  type = string
}

variable "rmin_redischeck_subscriber_email_cache_c_resource" {
  type = string
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

variable "rmin_redischeck_fs_subscriber_cache_redishost" {
  type = string
}

variable "rmin_redischeck_fs_subscriber_cache_resource" {
  type = string
}

variable "rmin_redischeck_fs_subscriber_email_cache_redishost" {
  type = string
}

variable "rmin_redischeck_fs_subscriber_email_cache_resource" {
  type = string
}

variable "rmin_redischeck_zip5_initiatives_cache_redishost" {
  type = string
}

variable "rmin_redischeck_zip5_initiatives_cache_resource" {
  type = string
}

variable "rmin_subscriber_cache_c_ip" {
  type = string
}

variable "rmin_template_bucket" {
  type = string
}

variable "vpc_connector" {
  type = string
}

variable "subscriber_vpc_connector" {
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

variable "rmin_cloudsql_runpartman_digest_secret" {
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

variable "subscriber_update_function_name" {
  type = string
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

variable "subscriber_update_function_service_account" {
  type = string
}

variable "subscriber_update_function_timeout" {
  type = number
}

variable "subscriber_update_function_zip_file_name" {
  type = string
}

variable "firestore_subscribers_cache_ip" {
  type = string
}

variable "firestore_subscribers_cache_read_ip" {
  type = string
}

variable "firestore_subscribers_email_cache_ip" {
  type = string
}

variable "account_revision_topic" {
  type = string
}

variable "package_notification_update_topic" {
  type = string
}

variable "physical_address_revision_topic" {
  type = string
}

variable "subscriber_opt_in_topic" {
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

variable "rmin_mics_extract_vpc_connector" {
  type = string
}

variable "rmin_mics_extract_table" {
  type = string
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

variable "rmin_mics_subscriber_cloud_run_url" {
  type = string
}

variable "rmin_mics_extract_queue_id" {
  type = string
}

variable "rmin_mics_extract_location_id" {
  type = string
}

variable "cloudsql_digest_secret_version" {
  type = string
}

variable "cloudsql_mdn_secret_version" {
  type = string
}
#here
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

variable "inbound_package_sync_connector" {
  type = string
}

variable "inbound_package_sync_topic" {
  type = string
}

variable "inbound_package_sync_trigger_function_partitions" {
  type = string
}

variable "inbound_package_sync_trigger_function_service_account" {
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

variable "package_email_notification_dlq_subscription_name" {
  type = string
}

variable "package_email_notification_topic_name" {
  type = string
}

variable "package_sms_notification_dlq_subscription_name" {
  type = string
}

variable "package_sms_notification_topic_name" {
  type = string
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

variable "mdn_eng_feed_function_name" {
  type = string
}

variable "mdn_eng_feed_function_table_id" {
  type = string
}

variable "mdn_eng_feed_function_mount_path" {
  type = string
}

variable "mdn_eng_feed_function_temp_bucket" {
  type = string
}

variable "mdn_eng_feed_function_file_bucket" {
  type = string
}

variable "mdn_eng_feed_function_secret" {
  type = string
}


