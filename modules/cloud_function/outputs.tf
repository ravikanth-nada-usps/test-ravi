output "rmin_cloud_image_dimension_func_c_url" {
  value       = google_cloudfunctions2_function.rmin_cloud_image_dimension_func_c.service_config[0].uri
  description = "The URL address of the Function"
}

output "rmin_cloud_subscriber_update_func_url" {
  value       = var.toggle_4583_1111_subscriber_services ? google_cloudfunctions2_function.rmin_cloud_subscriber_update_func[0].service_config[0].uri : null
  description = "The URL address of the Subscriber Update Function"
}

output "rmin_redischeck_subscriber_cache_c_url" {
  value       = google_cloudfunctions2_function.rmin_redischeck_subscriber_cache_c.service_config[0].uri
  description = "The URL address of the Function"
}

output "rmin_redischeck_mail_campaign_cache_c_url" {
  value       = google_cloudfunctions2_function.rmin_redischeck_mail_campaign_cache_c.service_config[0].uri
  description = "The URL address of the Function"
}

output "rmin_redischeck_package_campaign_cache_c_url" {
  value       = google_cloudfunctions2_function.rmin_redischeck_package_campaign_cache_c.service_config[0].uri
  description = "The URL address of the Function"
}

output "rmin_redischeck_mics_locks_cache_c_url" {
  value       = google_cloudfunctions2_function.rmin_redischeck_mics_locks_cache_c.service_config[0].uri
  description = "The URL address of the Function"
}


output "rmin_cloud_zip5_timezone_func_c_url" {
  value       = google_cloudfunctions2_function.rmin_cloud_zip5_timezone_func_c.service_config[0].uri
  description = "The URL address of the Function"
}

output "rmin_cloudsql_runpartman_digest_url" {
  value       = google_cloudfunctions2_function.rmin_cloudsql_runpartman_digest.service_config[0].uri
  description = "The URL address of the Function"
}

output "rmin_cloudsql_runpartman_c_url" {
  value       = google_cloudfunctions2_function.rmin_cloudsql_runpartman_c.service_config[0].uri
  description = "The URL address of the Function"
}

output "rmin_cloud_mics_extract_function_url" {
  value       = var.toggle_4583_1111_subscriber_services ? google_cloudfunctions2_function.rmin_mics_extract_function[0].service_config[0].uri : null
  description = "The URL address of the mics extract cloud function"
}

output "rmin_cloud_zip5_initiatives_sync_function_c_url" {
  value       = var.toggle_4583_5681_consumer_portal ? google_cloudfunctions2_function.rmin_cloud_zip5_initiatives_sync_function_c[0].service_config[0].uri : null
  description = "The URL address of the Function"
}

output "rmin_cloud_process_failed_package_notifications_c_url" {
  value       = var.toggle_4583_5710_apigee_hybrid ? google_cloudfunctions2_function.rmin_cloud_process_failed_package_notifications[0].service_config[0].uri : null
  description = "The URL address of the process failed package notifications function"
}
