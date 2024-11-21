variable "project_id" {
  type = string
}

variable "name_suffix" {
  type = string
}

variable "toggle_4583_1111_subscriber_services" {
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

variable "toggle_4583_5708_mdn_to_eng" {
  type    = bool
  default = false
}

variable "toggle_4583_5710_apigee_hybrid" {
  type    = bool
  default = false
}

variable "timezone_list" {
  type = map(any)
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

variable "rmin_zip5_initiatives_sync_cloud_run_url" {
  type = string
}

variable "rmin_zip5_initiatives_sync_sa_email" {
  type = string
}

variable "rmin_template_bucket" {
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
  type    = string
  default = "1.0.17"
}

variable "sunday_digest_error_topic" {
  type = string
}

variable "sunday_digest_max_workers" {
  type    = number
  default = 4
}

variable "sunday_digest_redis_max_conn" {
  type = string
}

variable "sunday_digest_redis_max_idle" {
  type    = string
  default = "10"
}

variable "sunday_digest_redis_min_idle" {
  type    = string
  default = "5"
}

variable "sunday_digest_redishost" {
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

variable "sunday_digest_subnetwork_central" {
  type = string
}

variable "sunday_digest_toggle_dedupe_sunday_email" {
  type = string
}

variable "sunday_digest_toggle_email_cache_lookup" {
  type = string
}

variable "sunday_digest_topic_name_central" {
  type = string
}

variable "rmin_mics_extract_trigger_func_url" {
  type = string
}

variable "rmin_mics_extract_trigger_sa_email" {
  type = string
}

variable "rmin_mics_extract_trigger_schedule" {
  type = string
}

variable "cache_refresh_schedule" {
  type = string
}

variable "cache_refresh_version" {
  type = string
}

variable "subscriber_email_cache_redishost" {
  type = string
}

variable "subscriber_cache_redishost" {
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

variable "cache_refresh_subnetwork" {
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

variable "dashboard_api_internal_post_warm_min_instances" {
  type = number
}

variable "dashboard_api_internal_service_name" {
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

variable "dashboard_api_service_name" {
  type = string
}

variable "dashboard_api_pre_warm_min_instances" {
  type = number
}

variable "dashboard_api_post_warm_min_instances" {
  type = number
}

variable "image_api_service_name" {
  type = string
}

variable "image_api_pre_warm_min_instances" {
  type = number
}

variable "image_api_post_warm_min_instances" {
  type = number
}

variable "login_api_service_name" {
  type = string
}

variable "login_api_pre_warm_min_instances" {
  type = number
}

variable "login_api_post_warm_min_instances" {
  type = number
}

variable "subscriber_api_service_name" {
  type = string
}

variable "subscriber_api_pre_warm_min_instances" {
  type = number
}

variable "subscriber_api_post_warm_min_instances" {
  type = number
}

variable "package_api_service_name" {
  type = string
}

variable "package_api_pre_warm_min_instances" {
  type = number
}

variable "package_api_post_warm_min_instances" {
  type = number
}

variable "eagan_proxy_service_name" {
  type = string
}

variable "eagan_proxy_pre_warm_min_instances" {
  type = number
}

variable "eagan_proxy_post_warm_min_instances" {
  type = number
}

variable "consumer_portal_service_name" {
  type = string
}

variable "consumer_portal_pre_warm_min_instances" {
  type = number
}

variable "consumer_portal_post_warm_min_instances" {
  type = number
}

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

variable "mdn_eng_feed_database" {
  type = string
}

variable "mdn_eng_feed_num_shard" {
  type = string
}

variable "mdn_eng_feed_temp_bucket" {
  type = string
}

variable "mdn_eng_feed_table" {
  type = string
}

variable "mdn_eng_feed_firestore_subscribers" {
  type = string
}

variable "process_failed_package_notifications_url" {
  type = string
}

variable "process_failed_package_notifications_sa_email" {
  type = string
}

variable "rmin_redis_export_backup_scheduler_region_invar" {
  type = string
}

variable "rmin_redis_export_backup_scheduler_schedule_invar" {
  type = string
}
  
variable "rmin_redis_export_backup_scheduler_timezone_invar" {
  type = string
}
       
variable "rmin_redis_export_backup_service_account_invar" {
  type = string
}

variable "rmin_redis_export_backup_bucket_name_invar" {
  type = string
  description = "Placeholder for the name of the Redis Cache export backup bucket created in the cloud_storage module"
}

variable "rmin_bigquery_export_backup_scheduler_region_invar" {
  type = string
}

variable "rmin_bigquery_export_backup_scheduler_schedule_invar" {
  type = string
}
     
variable "rmin_bigquery_export_backup_scheduler_timezone_invar" {
  type = string
}

variable "rmin_bigquery_export_backup_service_account_invar" {
  type = string
}

variable "rmin_bigquery_export_backup_bucket_name_invar" {
  type = string
  description = "Placeholder for the name of the BigQuery export backup bucket created in the cloud_storage module"
}

variable "toggle_4583_5717_rmin_backup_invar" {
  type    = bool
  default = false
}
