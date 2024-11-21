
output "rmin_mail_campaign_cache_c_read_ip" {
  value       = var.rmin_mail_campaign_cache_c_replica_enabled ? "${google_redis_instance.rmin_mail_campaign_cache_c.read_endpoint}" : ""
  description = "The IP address of Redis Cache Read Replica"
}

output "rmin_mail_campaign_cache_c_ip" {
  value       = google_redis_instance.rmin_mail_campaign_cache_c.host
  description = "The IP address of Redis Cache Primary Endpoint"
}

output "rmin_mail_campaign_cache_ext_c_read_ip" {
  value       = var.toggle_4583_xxxx_ext_caches ? var.rmin_mail_campaign_cache_ext_c_replica_enabled ? "${google_redis_instance.rmin_mail_campaign_cache_ext_c[0].read_endpoint}" : "" : null
  description = "The IP address of Redis Cache Read Replica"
}

output "rmin_mail_campaign_cache_ext_c_ip" {
  value       = var.toggle_4583_xxxx_ext_caches ? google_redis_instance.rmin_mail_campaign_cache_ext_c[0].host : null
  description = "The IP address of Redis Cache Primary Endpoint"
}

output "rmin_mdn_zip11s_cache_c_read_ip" {
  value       = var.rmin_mdn_zip11s_cache_c_replica_enabled ? "${google_redis_instance.rmin_mdn_zip11s_cache_c.read_endpoint}" : ""
  description = "The IP address of Redis Cache Read Replica"
}

output "rmin_mdn_zip11s_cache_c_ip" {
  value       = google_redis_instance.rmin_mdn_zip11s_cache_c.host
  description = "The IP address of Redis Cache Primary Endpoint"
}

output "rmin_mics_locks_cache_c_read_ip" {
  value       = var.rmin_mics_locks_cache_c_replica_enabled ? "${google_redis_instance.rmin_mics_locks_cache_c.read_endpoint}" : ""
  description = "The IP address of Redis Cache Read Replica"
}

output "rmin_mics_locks_cache_c_ip" {
  value       = google_redis_instance.rmin_mics_locks_cache_c.host
  description = "The IP address of Redis Cache Primary Endpoint"
}

output "rmin_package_campaign_cache_c_read_ip" {
  value       = var.rmin_package_campaign_cache_c_replica_enabled ? "${google_redis_instance.rmin_package_campaign_cache_c.read_endpoint}" : ""
  description = "The IP address of Redis Cache Read Replica"
}

output "rmin_package_campaign_cache_c_ip" {
  value       = google_redis_instance.rmin_package_campaign_cache_c.host
  description = "The IP address of Redis Cache Primary Endpoint"
}

output "rmin_package_campaign_cache_ext_c_read_ip" {
  value       = var.toggle_4583_xxxx_ext_caches ? var.rmin_package_campaign_cache_ext_c_replica_enabled ? "${google_redis_instance.rmin_package_campaign_cache_ext_c[0].read_endpoint}" : "" : null
  description = "The IP address of Redis Cache Read Replica"
}

output "rmin_package_campaign_cache_ext_c_ip" {
  value       = var.toggle_4583_xxxx_ext_caches ? google_redis_instance.rmin_package_campaign_cache_ext_c[0].host : null
  description = "The IP address of Redis Cache Primary Endpoint"
}

output "rmin_subscriber_cache_c_read_ip" {
  value       = var.rmin_subscriber_cache_c_replica_enabled ? "${google_redis_instance.rmin_subscriber_cache_c.read_endpoint}" : ""
  description = "The IP address of Redis Cache Read Replica"
}

output "rmin_subscriber_cache_c_ip" {
  value       = google_redis_instance.rmin_subscriber_cache_c.host
  description = "The IP address of Redis Cache Primary Endpoint"
}

output "rmin_subscriber_email_cache_c_read_ip" {
  value       = var.rmin_subscriber_email_cache_c_replica_enabled ? "${google_redis_instance.rmin_subscriber_email_cache_c.read_endpoint}" : ""
  description = "The IP address of Redis Cache Read Replica"
}

output "rmin_subscriber_email_cache_c_ip" {
  value       = google_redis_instance.rmin_subscriber_email_cache_c.host
  description = "The IP address of Redis Cache Primary Endpoint"
}

output "rmin_firestore_subscriber_cache_c_read_ip" {
  value       = var.toggle_4583_1111_subscriber_services ? var.rmin_fs_subscriber_cache_replica_enabled ? "${google_redis_instance.rmin_firestore_subscriber_cache_c[0].read_endpoint}" : "" : null
  description = "The IP address of the Firestore Subscriber Redis Cache Read Replica"
}

output "rmin_firestore_subscriber_cache_c_ip" {
  value       = var.toggle_4583_1111_subscriber_services ? google_redis_instance.rmin_firestore_subscriber_cache_c[0].host : null
  description = "The IP address of the Firestore Subscriber Redis Cache Primary Endpoint"
}

output "rmin_firestore_subscriber_email_cache_c_read_ip" {
  value       = var.toggle_4583_1111_subscriber_services ? var.rmin_fs_subscriber_email_cache_replica_enabled ? "${google_redis_instance.rmin_firestore_subscriber_email_cache_c[0].read_endpoint}" : "" : null
  description = "The IP address of the Firestore Subscriber Redis Cache Read Replica"
}

output "rmin_firestore_subscriber_email_cache_c_ip" {
  value       = var.toggle_4583_1111_subscriber_services ? google_redis_instance.rmin_firestore_subscriber_email_cache_c[0].host : null
  description = "The IP address of the Firestore Subscriber Redis Cache Primary Endpoint"
}

output "rmin_flats_lock_cache_c_read_ip" {
  value       = var.rmin_flats_lock_cache_c_replica_enabled ? "${google_redis_instance.rmin_flats_lock_cache_c.read_endpoint}" : ""
  description = "The IP address of Redis Cache Read Replica"
}

output "rmin_flats_lock_cache_c_ip" {
  value       = google_redis_instance.rmin_flats_lock_cache_c.host
  description = "The IP address of Redis Cache Primary Endpoint"
}


output "rmin_relay_locks_cache_c_read_ip" {
  value       = var.rmin_relay_locks_cache_c_replica_enabled ? "${google_redis_instance.rmin_relay_locks_cache_c.read_endpoint}" : ""
  description = "The IP address of Redis Cache Read Replica"
}

output "rmin_relay_locks_cache_c_ip" {
  value       = google_redis_instance.rmin_relay_locks_cache_c.host
  description = "The IP address of Redis Cache Primary Endpoint"
}


output "rmin_saturation_data_cache_e_read_ip" {
  value       = var.rmin_saturation_data_cache_e_replica_enabled ? "${google_redis_instance.rmin_saturation_data_cache_e.read_endpoint}" : ""
  description = "The IP address of Redis Cache Read Replica"
}

output "rmin_saturation_data_cache_e_ip" {
  value       = google_redis_instance.rmin_saturation_data_cache_e.host
  description = "The IP address of Redis Cache Primary Endpoint"
}

output "rmin_zip5_initiatives_sync_cache_c_ip" {
  value       = var.toggle_4583_5681_consumer_portal ? google_redis_instance.rmin_zip5_initiatives_sync_cache_c[0].host : null
  description = "The IP address of Redis Cache Primary Endpoint"
}

output "rmin_zip5_initiatives_sync_cache_c_read_ip" {
  value       = var.toggle_4583_5681_consumer_portal ? "${google_redis_instance.rmin_zip5_initiatives_sync_cache_c[0].read_endpoint}" : ""
  description = "The IP address of Redis Cache Read Replica"
}
