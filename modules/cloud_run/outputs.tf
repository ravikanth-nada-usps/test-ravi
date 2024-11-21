output "dashboard_cloud_run_url" {
  value       = google_cloud_run_v2_service.rmin_cloud_dashboard_event_processor_run.uri
  description = "Cloud Run URL that is serving the dashboard event service"
}

output "dashboard_api_cloud_run_url" {
  value       = google_cloud_run_v2_service.rmin_cloud_dashboard_api.uri
  description = "Cloud Run URL that is serving the dashboard API service"
}

output "dashboard_api_internal_cloud_run_url" {
  value       = google_cloud_run_v2_service.rmin_cloud_dashboard_api_internal.uri
  description = "Cloud Run URL that is serving the dashboard API Internal service"
}

output "dashboard_api_internal_service_name" {
  value       = google_cloud_run_v2_service.rmin_cloud_dashboard_api_internal.name
  description = "Cloud Run Service name for Dashboard API Internal"
}

output "image_api_cloud_run_url" {
  value       = google_cloud_run_v2_service.rmin_cloud_image_api.uri
  description = "Cloud Run URL that is serving the image API service"
}

output "subscriber_event_cloud_run_url" {
  value       = var.toggle_4583_1111_subscriber_services ? google_cloud_run_v2_service.rmin_cloud_subscriber_event[0].uri : null
  description = "Cloud Run URL that is serving the subscriber event service"
}

output "subscriber_api_cloud_run_url" {
  value       = var.toggle_4583_1111_subscriber_services ? google_cloud_run_v2_service.rmin_cloud_subscriber_api[0].uri : null
  description = "Cloud Run URL that is serving the subscriber api service"
}

output "mics_subscriber_cloud_run_url" {
  value       = var.toggle_4583_1111_subscriber_services ? google_cloud_run_v2_service.rmin_mics_subscriber_extract[0].uri : null
  description = "Cloud Run URL that is serving the mics subscriber extract service"
}

output "package_event_cloud_run_url" {
  value       = var.toggle_4583_5673_myusps_migration ? google_cloud_run_v2_service.rmin_cloud_package_event_processor[0].uri : null
  description = "Cloud Run URL that is serving the package event processor service"
}

output "package_notification_cloud_run_url" {
  value       = var.toggle_4583_5673_myusps_migration ? google_cloud_run_v2_service.rmin_cloud_package_notification_processor[0].uri : null
  description = "Cloud Run URL that is serving the package notification processor service"
}

output "package_sms_notification_cloud_run_url" {
  value       = var.toggle_4583_5710_apigee_hybrid ? google_cloud_run_v2_service.rmin_cloud_package_sms_notification_processor[0].uri : null
  description = "Cloud Run URL that is serving the package sms notification processor service"
}

output "package_notification_update_cloud_run_url" {
  value       = var.toggle_4583_5673_myusps_migration ? google_cloud_run_v2_service.rmin_cloud_package_notification_update_processor[0].uri : null
  description = "Cloud Run URL that is serving the package notification update processor service"
}

output "mc_report_cloud_run_url" {
  value       = google_cloud_run_v2_service.rmin_cloud_mc_report_service.uri
  description = "Cloud Run URL that is serving the mc report service"
}

output "mc_api_cloud_run_url" {
  value       = var.toggle_4583_xxxx_mc_reporting ? google_cloud_run_v2_service.rmin_cloud_mc_api[0].uri : null
  description = "Cloud Run URL that is serving the mail campaign api"
}

output "dashboard_api_service_name" {
  value       = google_cloud_run_v2_service.rmin_cloud_dashboard_api.name
  description = "Cloud Run Service name for Dashboard API"
}

output "eagan_proxy_service_name" {
  value       = var.toggle_4583_5681_consumer_portal ? google_cloud_run_v2_service.rmin_cloud_eagan_proxy[0].name : null
  description = "Cloud Run Service name for Eagan Proxy"
}

output "image_api_service_name" {
  value       = google_cloud_run_v2_service.rmin_cloud_image_api.name
  description = "Cloud Run Service name for Image API"
}

output "subscriber_api_service_name" {
  value       = var.toggle_4583_1111_subscriber_services ? google_cloud_run_v2_service.rmin_cloud_subscriber_api[0].name : null
  description = "Cloud Run Service name for Dashboard API"
}

output "login_api_service_name" {
  value       = var.toggle_4583_5681_consumer_portal ? google_cloud_run_v2_service.rmin_cloud_login_api[0].name : null
  description = "Cloud Run Service name for Dashboard API"
}

output "package_api_service_name" {
  value       = var.toggle_4583_5673_myusps_migration ? google_cloud_run_v2_service.rmin_cloud_package_api[0].name : null
  description = "Cloud Run Service name for Dashboard API"
}

output "consumer_portal_service_name" {
  value       = var.toggle_4583_5680_frontend ? google_cloud_run_v2_service.rmin_cloud_consumer_portal_frontend[0].name : null
  description = "Cloud Run Service name for Dashboard API"
}