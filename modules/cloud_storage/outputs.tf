output "rmin_template_bucket_e_name" {
  value       = google_storage_bucket.rmin_template_bucket_e.name
  description = "Name of Template Bucket"
}

output "rmin_mics_extract_bucket_name" {
  value       = var.toggle_4583_1111_subscriber_services ? google_storage_bucket.rmin_mics_extract_bucket_c[0].name : null
  description = "Name of the mics exteact bucket"
}

output "rmin_mail_campaign_image_bucket_name" {
  value       = google_storage_bucket.rmin_mail_campaigndata_bucket_c.name
  description = "Name of the mail campaign images bucket"
}

output "rmin_mail_campaign_image_bucket_name_ext" {
  value       = var.toggle_4583_xxxx_ext_caches ? google_storage_bucket.rmin_mail_campaigndata_bucket_ext_c[0].name : null
  description = "Name of the external mail campaign images bucket"
}

output "rmin_package_campaign_image_bucket_name" {
  value       = google_storage_bucket.rmin_package_campaigndata_bucket_c.name
  description = "Name of the package campaign images bucket"
}

output "rmin_package_campaign_image_bucket_name_ext" {
  value       = var.toggle_4583_xxxx_ext_caches ? google_storage_bucket.rmin_package_campaigndata_bucket_ext_c[0].name : null
  description = "Name of the external package campaign images bucket"
}

output "rmin_subscriber_dropbox_bucket_name" {
  value       = google_storage_bucket.rmin_subscriberdropbox_bucket_e_2.name
  description = "Name of the subscriber dropbox bucket number 2"
}

output "rmin_qr_code_bucket_c_name" {
  value       = google_storage_bucket.rmin_qr_code_bucket_c.name
  description = "Name of the QR Code Image Bucket"
}
output "rmin_mdn_file_bucket_c_name" {
  value       = var.toggle_4583_5708_mdn_to_eng ? google_storage_bucket.rmin_mdn_file_bucket_c[0].name : null
  description = "Name of MDN File Bucket"
}

output "rmin_mdn_temp_bucket_c_name" {
  value       = var.toggle_4583_5708_mdn_to_eng ? google_storage_bucket.rmin_mdn_temp_bucket_c[0].name : null
  description = "Name of MDN File temp Bucket"
}

output "rmin_global_elements_bucket_c_name" {
  value       = var.toggle_4583_5681_consumer_portal ? google_storage_bucket.rmin_global_elements_bucket_c[0].name : null
  description = "Name of the Global Elements bucket"
}

output "rmin_temp_cache_backup" {
  value       = var.toggle_4583_5708_mdn_to_eng ? google_storage_bucket.rmin_temp_cache_backup.name : null
  description = "Name of the Temp Cache bucket"
}

output "rmin_redis_export_backup_bucket_name_outvar" {
  value       = var.toggle_4583_5717_rmin_backup_invar ? google_storage_bucket.rmin_redis_export_backup_bucket_e[0].name : null
  description = "Output varialbe for the Redis Cache export backup bucket name"
}

output "rmin_bigquery_export_backup_bucket_name_outvar" {
  value       = var.toggle_4583_5717_rmin_backup_invar ? google_storage_bucket.rmin_bigquery_export_backup_bucket_e[0].name : null
  description = "Output variable for the BigQuery export backup bucket name"
}
