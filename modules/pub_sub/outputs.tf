/*
output "redis_mc_topic" {
  value       = google_pubsub_topic.rmin_redischeck_mailCampaign_c.id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "redis_pc_topic" {
  value       = google_pubsub_topic.rmin_redischeck_packageCampaign_c.id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"

}
*/

output "rmin_99m_barcode_submission_topic_e_topic_id" {
  value       = google_pubsub_topic.rmin_99m_barcode_submission_topic_e.id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_account_revision_topic_id" {
  value       = var.toggle_4583_1111_subscriber_services ? google_pubsub_topic.rmin_account_revision_topic[0].name : null
  description = "Name of Topic with format {{name}}"
}

output "rmin_alerts_topic_e_topic_id" {
  value       = google_pubsub_topic.rmin_alerts_topic_e.id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_campaign_topic_e_topic_id" {
  value       = google_pubsub_topic.rmin_campaign_topic_e.id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_container_scan_topic_e_topic_id" {
  value       = google_pubsub_topic.rmin_container_scan_topic_e.id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_dashboard_api_logs_dlt_c_topic_id" {
  value       = google_pubsub_topic.rmin_dashboard_api_logs_dlt_c.id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_dashboard_api_logs_c_topic_id" {
  value       = google_pubsub_topic.rmin_dashboard_api_logs_c.id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_dashboard_event_topic_e_topic_id" {
  value       = google_pubsub_topic.rmin_dashboard_event_topic_e.id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_digest_event_topic_c_topic_id" {
  value       = google_pubsub_topic.rmin_digest_event_topic_c.id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_digest_open_logs_topic_c_topic_id" {
  value       = var.toggle_4583_xxxx_mc_reporting ? google_pubsub_topic.rmin_digest_open_logs_topic_c[0].id : null
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_dn_email_topic_e_topic_id" {
  value       = google_pubsub_topic.rmin_dn_email_topic_e.id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_dn_logs_topic_e_topic_id" {
  value       = google_pubsub_topic.rmin_dn_logs_topic_e.id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_errors_e_topic_id" {
  value       = google_pubsub_topic.rmin_errors_e.id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_flats_topic_e_topic_id" {
  value       = google_pubsub_topic.rmin_flats_topic_e.id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_image_api_logs_dlt_c_topic_id" {
  value       = google_pubsub_topic.rmin_image_api_logs_dlt_c.id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_image_api_logs_c_topic_id" {
  value       = google_pubsub_topic.rmin_image_api_logs_c.id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_lde_zip11_topic_e_topic_id" {
  value       = google_pubsub_topic.rmin_lde_zip11_topic_e.id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_locale_key_submission_topic_e_topic_id" {
  value       = google_pubsub_topic.rmin_locale_key_submission_topic_e.id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_mail_campaign_reporting_topic_c_topic_id" {
  value       = google_pubsub_topic.rmin_mail_campaign_reporting_topic_c.id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_packages_topic_e_topic_id" {
  value       = google_pubsub_topic.rmin_packages_topic_e.id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_physical_address_revision_topic_id" {
  value       = var.toggle_4583_1111_subscriber_services ? google_pubsub_topic.rmin_physical_address_revision_topic[0].id : null
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_mics_subscriber_extract_topic_id" {
  value       = var.toggle_4583_1111_subscriber_services ? google_pubsub_topic.rmin_mics_subscriber_extract_topic_c[0].id : null
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_psg_topic_e_topic_id" {
  value       = google_pubsub_topic.rmin_psg_topic_e.id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_qr_code_service_topic_c_topic_id" {
  value       = google_pubsub_topic.rmin_qr_code_service_topic_c.id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_rawfile_topic_e_topic_id" {
  value       = google_pubsub_topic.rmin_rawfile_topic_e.id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_redischeck_campaign_e_topic_id" {
  value       = google_pubsub_topic.rmin_redischeck_campaign_e.id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_redischeck_relay_lock_c_id" {
  value       = google_pubsub_topic.rmin_redischeck_relay_lock_c.id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_redischeck_flats_lock_c_id" {
  value       = google_pubsub_topic.rmin_redischeck_flats_lock_c.id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_redischeck_locks_cache_e_topic_id" {
  value       = google_pubsub_topic.rmin_redischeck_locks_cache_e.id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_redischeck_locks_cache_e_2_topic_id" {
  value       = google_pubsub_topic.rmin_redischeck_locks_cache_e_2.id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_redischeck_mailCampaign_c_topic_id" {
  value       = google_pubsub_topic.rmin_redischeck_mailCampaign_c.id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_redischeck_mailCampaign_ext_c_topic_id" {
  value       = var.toggle_4583_xxxx_ext_caches ? google_pubsub_topic.rmin_redischeck_mailCampaign_ext_c[0].id : null
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_redischeck_mdnzip11s_cache_c_topic_id" {
  value       = google_pubsub_topic.rmin_redischeck_mdnzip11s_cache_c.id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_redischeck_mics_locks_c_topic_id" {
  value       = google_pubsub_topic.rmin_redischeck_mics_locks_c.id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_redischeck_packageCampaign_c_topic_id" {
  value       = google_pubsub_topic.rmin_redischeck_packageCampaign_c.id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_redischeck_packageCampaign_ext_c_topic_id" {
  value       = var.toggle_4583_xxxx_ext_caches ? google_pubsub_topic.rmin_redischeck_packageCampaign_ext_c[0].id : null
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_redischeck_saturation_data_cache_e_topic_id" {
  value       = google_pubsub_topic.rmin_redischeck_saturation_data_cache_e.id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_redischeck_subscriber_2_e_topic_id" {
  value       = google_pubsub_topic.rmin_redischeck_subscriber_2_e.id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_redischeck_subscriber_c_topic_id" {
  value       = google_pubsub_topic.rmin_redischeck_subscriber_c.id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_redischeck_subscriber_e_topic_id" {
  value       = google_pubsub_topic.rmin_redischeck_subscriber_e.id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_redischeck_subscriber_email_cache_c_topic_id" {
  value       = google_pubsub_topic.rmin_redischeck_subscriber_email_cache_c.id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_reportingsync_dlt_e_topic_id" {
  value       = google_pubsub_topic.rmin_reportingsync_dlt_e.id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_subscriber_api_logs_topic_id" {
  value       = var.toggle_4583_1111_subscriber_services ? google_pubsub_topic.rmin_subscriber_api_logs_topic[0].id : null
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_eagan_proxy_logs_topic_id" {
  value       = var.toggle_4583_5680_frontend ? google_pubsub_topic.rmin_eagan_proxy_logs_topic[0].id : null
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_subscriber_event_topic_id" {
  value       = var.toggle_4583_1111_subscriber_services ? google_pubsub_topic.rmin_subscriber_event_topic[0].id : null
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_subscriber_topic_2_e_topic_id" {
  value       = google_pubsub_topic.rmin_subscriber_topic_2_e.id
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_subscriber_opt_in_settings_topic_id" {
  value       = var.toggle_4583_5680_frontend ? google_pubsub_topic.rmin_subscriber_opt_in_settings_topic[0].id : null
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_99m_barcode_submission_topic_e_name" {
  value       = google_pubsub_topic.rmin_99m_barcode_submission_topic_e.name
  description = "Name of Topic"
}

output "rmin_account_revision_topic_name" {
  value       = var.toggle_4583_1111_subscriber_services ? google_pubsub_topic.rmin_account_revision_topic[0].name : null
  description = "Name of Topic with format {{name}}"
}

output "rmin_alerts_topic_e_name" {
  value       = google_pubsub_topic.rmin_alerts_topic_e.name
  description = "Name of Topic"
}

output "rmin_campaign_topic_e_name" {
  value       = google_pubsub_topic.rmin_campaign_topic_e.name
  description = "Name of Topic"
}

output "rmin_container_scan_topic_e_name" {
  value       = google_pubsub_topic.rmin_container_scan_topic_e.name
  description = "Name of Topic"
}

output "rmin_dashboard_api_logs_dlt_c_name" {
  value       = google_pubsub_topic.rmin_dashboard_api_logs_dlt_c.name
  description = "Name of Topic"
}

output "rmin_dashboard_api_logs_c_name" {
  value       = google_pubsub_topic.rmin_dashboard_api_logs_c.name
  description = "Name of Topic"
}

output "rmin_dashboard_event_topic_e_name" {
  value       = google_pubsub_topic.rmin_dashboard_event_topic_e.name
  description = "Name of Topic"
}

output "rmin_digest_event_topic_c_name" {
  value       = google_pubsub_topic.rmin_digest_event_topic_c.name
  description = "Name of Topic"
}

output "rmin_dn_email_topic_e_name" {
  value       = google_pubsub_topic.rmin_dn_email_topic_e.name
  description = "Name of Topic"
}

output "rmin_dn_logs_topic_e_name" {
  value       = google_pubsub_topic.rmin_dn_logs_topic_e.name
  description = "Name of Topic"
}

output "rmin_eagan_proxy_logs_topic_name" {
  value       = var.toggle_4583_5680_frontend ? google_pubsub_topic.rmin_eagan_proxy_logs_topic[0].name : null
  description = "Name of Topic with format projects/{{project}}/topics/{{name}}"
}

output "rmin_errors_e_name" {
  value       = google_pubsub_topic.rmin_errors_e.name
  description = "Name of Topic"
}

output "rmin_flats_topic_e_name" {
  value       = google_pubsub_topic.rmin_flats_topic_e.name
  description = "Name of Topic"
}

output "rmin_image_api_logs_dlt_c_name" {
  value       = google_pubsub_topic.rmin_image_api_logs_dlt_c.name
  description = "Name of Topic"
}

output "rmin_image_api_logs_c_name" {
  value       = google_pubsub_topic.rmin_image_api_logs_c.name
  description = "Name of Topic"
}

output "rmin_lde_zip11_topic_e_name" {
  value       = google_pubsub_topic.rmin_lde_zip11_topic_e.name
  description = "Name of Topic"
}

output "rmin_locale_key_submission_topic_e_name" {
  value       = google_pubsub_topic.rmin_locale_key_submission_topic_e.name
  description = "Name of Topic"
}

output "rmin_login_api_logs_topic_name" {
  value       = var.toggle_4583_5681_consumer_portal ? google_pubsub_topic.rmin_login_api_logs_topic[0].name : null
  description = "Name of topic in format {{name}}"
}

output "rmin_mail_campaign_reporting_topic_c_name" {
  value       = google_pubsub_topic.rmin_mail_campaign_reporting_topic_c.name
  description = "Name of Topic"
}

output "rmin_mics_extract_file_upload_topic_name" {
  value       = var.toggle_4583_1111_subscriber_services ? google_pubsub_topic.rmin_mics_extract_file_upload_topic[0].name : null
  description = "Name of Mics Extract Topic"
}

output "rmin_package_notification_topic_name" {
  value       = var.toggle_4583_5673_myusps_migration ? google_pubsub_topic.rmin_package_notification_topic[0].name : null
  description = "Name of Topic with format {{name}}"
}

output "rmin_package_sms_notification_topic_name" {
  value       = var.toggle_4583_5710_apigee_hybrid ? google_pubsub_topic.rmin_package_sms_notification_topic[0].name : null
  description = "Name of Topic with format {{name}}"
}

output "rmin_package_notification_update_topic_name" {
  value       = var.toggle_4583_5673_myusps_migration ? google_pubsub_topic.rmin_package_notification_update_topic[0].name : null
  description = "Name of Topic with format {{name}}"
}

output "rmin_package_api_logs_topic_name" {
  value       = var.toggle_4583_5673_myusps_migration ? google_pubsub_topic.rmin_package_api_logs_topic[0].name : null
  description = "Name of Topic with format {{name}}"
}

output "rmin_package_notification_logs_topic_name" {
  value       = var.toggle_4583_5673_myusps_migration ? google_pubsub_topic.rmin_package_notification_logs_topic[0].name : null
  description = "Name of Topic with format {{name}}"
}

output "rmin_packages_topic_e_name" {
  value       = google_pubsub_topic.rmin_packages_topic_e.name
  description = "Name of Topic"
}

output "rmin_physical_address_revision_topic_name" {
  value       = var.toggle_4583_1111_subscriber_services ? google_pubsub_topic.rmin_physical_address_revision_topic[0].name : null
  description = "Name of Topic with format {{name}}"
}

output "rmin_psg_topic_e_name" {
  value       = google_pubsub_topic.rmin_psg_topic_e.name
  description = "Name of Topic"
}

output "rmin_qr_code_service_topic_c_name" {
  value       = google_pubsub_topic.rmin_qr_code_service_topic_c.name
  description = "Name of Topic"
}

output "rmin_rawfile_topic_e_name" {
  value       = google_pubsub_topic.rmin_rawfile_topic_e.name
  description = "Name of Topic"
}

output "rmin_redischeck_campaign_e_name" {
  value       = google_pubsub_topic.rmin_redischeck_campaign_e.name
  description = "Name of Topic"
}

output "rmin_redischeck_relay_lock_c_name" {
  value       = google_pubsub_topic.rmin_redischeck_relay_lock_c.name
  description = "Name of Topic"
}

output "rmin_redischeck_flats_lock_c_name" {
  value       = google_pubsub_topic.rmin_redischeck_flats_lock_c.name
  description = "Name of Topic"
}

output "rmin_redischeck_locks_cache_e_name" {
  value       = google_pubsub_topic.rmin_redischeck_locks_cache_e.name
  description = "Name of Topic"
}

output "rmin_redischeck_locks_cache_e_2_name" {
  value       = google_pubsub_topic.rmin_redischeck_locks_cache_e_2.name
  description = "Name of Topic"
}

output "rmin_redischeck_mailCampaign_c_name" {
  value       = google_pubsub_topic.rmin_redischeck_mailCampaign_c.name
  description = "Name of Topic"
}

output "rmin_redischeck_mdnzip11s_cache_c_name" {
  value       = google_pubsub_topic.rmin_redischeck_mdnzip11s_cache_c.name
  description = "Name of Topic"
}

output "rmin_redischeck_mics_locks_c_name" {
  value       = google_pubsub_topic.rmin_redischeck_mics_locks_c.name
  description = "Name of Topic"
}

output "rmin_redischeck_packageCampaign_c_name" {
  value       = google_pubsub_topic.rmin_redischeck_packageCampaign_c.name
  description = "Name of Topic"
}

output "rmin_redischeck_saturation_data_cache_e_name" {
  value       = google_pubsub_topic.rmin_redischeck_saturation_data_cache_e.name
  description = "Name of Topic"
}

output "rmin_redischeck_subscriber_2_e_name" {
  value       = google_pubsub_topic.rmin_redischeck_subscriber_2_e.name
  description = "Name of Topic"
}

output "rmin_redischeck_subscriber_c_name" {
  value       = google_pubsub_topic.rmin_redischeck_subscriber_c.name
  description = "Name of Topic"
}

output "rmin_redischeck_fs_subscriber_cache_c_name" {
  value       = var.toggle_4583_1111_subscriber_services ? google_pubsub_topic.rmin_redischeck_fs_subscriber_c[0].name : null
  description = "Name of Firestore Subscriber Cache Redis Check Topic"
}

output "rmin_redischeck_subscriber_e_name" {
  value       = google_pubsub_topic.rmin_redischeck_subscriber_e.name
  description = "Name of Topic"
}

output "rmin_redischeck_subscriber_email_cache_c_name" {
  value       = google_pubsub_topic.rmin_redischeck_subscriber_email_cache_c.name
  description = "Name of Topic"
}

output "rmin_redischeck_fs_subscriber_email_cache_c_name" {
  value       = var.toggle_4583_1111_subscriber_services ? google_pubsub_topic.rmin_redischeck_fs_subscriber_email_cache_c[0].name : null
  description = "Name of Firestore Subscriber Email Cache Redis Check Topic"
}

output "rmin_redischeck_zip5_initiatives_cache_c_name" {
  value       = var.toggle_4583_5681_consumer_portal ? google_pubsub_topic.rmin_redischeck_zip5_initiatives_cache_c[0].name : null
  description = "Name of Zip5 Initiatives Cache Redis Check Topic"
}

output "rmin_reportingsync_dlt_e_name" {
  value       = google_pubsub_topic.rmin_reportingsync_dlt_e.name
  description = "Name of Topic"
}

output "rmin_subscriber_api_logs_topic_name" {
  value       = var.toggle_4583_1111_subscriber_services ? google_pubsub_topic.rmin_subscriber_api_logs_topic[0].name : null
  description = "Name of Topic with format {{name}}"
}

output "rmin_subscriber_event_topic_name" {
  value       = var.toggle_4583_1111_subscriber_services ? google_pubsub_topic.rmin_subscriber_event_topic[0].name : null
  description = "Name of Topic with format {{name}}"
}

output "rmin_subscriber_topic_2_e_name" {
  value       = google_pubsub_topic.rmin_subscriber_topic_2_e.name
  description = "Name of Topic"
}

output "rmin_subscriber_opt_in_settings_topic_name" {
  value       = var.toggle_4583_5680_frontend ? google_pubsub_topic.rmin_subscriber_opt_in_settings_topic[0].name : null
  description = "Name of Topic with format {{name}}"
}

output "rmin_zip5_done_topic_c_name" {
  value       = google_pubsub_topic.rmin_zip5_done_topic_c.name
  description = "Name of Topic"
}

output "rmin_po_campaign_reporting_topic_c_name" {
  value       = var.toggle_4583_5668_price_change ? google_pubsub_topic.rmin_po_campaign_reporting_topic_c[0].name : null
  description = "Name of Topic"
}

output "rmin_mc_click_logs_topic_c_name" {
  value       = var.toggle_4583_5666_redesign_phase2 ? google_pubsub_topic.rmin_mc_click_logs_topic_c[0].name : null
  description = "Name of Topic"
}

output "rmin_digest_click_event_topic_name" {
  value       = var.toggle_4583_5666_redesign_phase2 ? google_pubsub_topic.rmin_digest_click_event_topic[0].name : null
  description = "Name of Topic"
}

output "rmin_digest_tracking_errors_topic_name" {
  value       = var.toggle_4583_5666_redesign_phase2 ? google_pubsub_topic.rmin_digest_tracking_errors_topic[0].name : null
  description = "Name of Topic"
}

output "rmin_digest_open_logs_topic_name" {
  value       = var.toggle_4583_xxxx_mc_reporting ? google_pubsub_topic.rmin_digest_open_logs_topic_c[0].name : null
  description = "Name of Topic"
}

output "rmin_digest_opt_out_reason_topic_name" {
  value       = var.toggle_4583_5681_consumer_portal ? google_pubsub_topic.rmin_digest_opt_out_reason_topic_c[0].name : null
  description = "Name of Topic"
}

output "rmin_inbound_package_sync_topic_name" {
  value       = var.toggle_4583_5690_ptr2 ? google_pubsub_topic.rmin_inbound_package_sync_topic[0].name : null
  description = "Name of Topic"
}

output "rmin_subscriber_opt_in_settings_dlt_topic_name" {
  value       = var.toggle_4583_5680_frontend ? google_pubsub_topic.rmin_subscriber_opt_in_settings_dlt_topic_c[0].name : null
  description = "Name of Topic"
}

output "rmin_mc_click_data_sync_topic_name" {
  value       = var.toggle_4583_5681_consumer_portal ? google_pubsub_topic.rmin_mc_click_data_sync_topic[0].name : null
  description = "Name of Topic"
}

output "rmin_mc_click_logs_topic_name" {
  value       = var.toggle_4583_5666_redesign_phase2 ? google_pubsub_topic.rmin_mc_click_logs_topic_c[0].name : null
  description = "Name of Topic"
}

output "rmin_package_sms_notification_dlq_subscription_name" {
  value       = var.toggle_4583_5710_apigee_hybrid ? google_pubsub_subscription.rmin_package_sms_notification_dlq_subscription[0].name : null
  description = "Name of subscription for DLQ processing function"
}

output "rmin_package_email_notification_dlq_subscription_name" {
  value       = var.toggle_4583_5710_apigee_hybrid ? google_pubsub_subscription.rmin_package_notification_dlq_subscription[0].name : null
  description = "Name of subscription for DLQ processing function"
}

