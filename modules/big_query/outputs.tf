output "bigquery_dataset" {
  value       = google_bigquery_dataset.rmin_operationaldata_bigquery_e
  description = "Bigquery dataset resource."
}

output "bigquery_dataset_id" {
  value       = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  description = "Bigquery dataset resource ID."
}

output "account_revision_table_id" {
  value       = var.toggle_4583_1111_subscriber_services ? format("%s:%s.%s", google_bigquery_table.rmin_operationaldata_bigquery_e_Account_Revision[0].project, google_bigquery_table.rmin_operationaldata_bigquery_e_Account_Revision[0].dataset_id, google_bigquery_table.rmin_operationaldata_bigquery_e_Account_Revision[0].table_id) : null
  description = "BigQuery Table ID for the Account Revision Table"
}

output "dashboard_api_logs_table_id" {
  value       = format("%s:%s.%s", google_bigquery_table.rmin_operationaldata_bigquery_e_Dashboard_API_Logs.project, google_bigquery_table.rmin_operationaldata_bigquery_e_Dashboard_API_Logs.dataset_id, google_bigquery_table.rmin_operationaldata_bigquery_e_Dashboard_API_Logs.table_id)
  description = "BigQuery Table ID for the Dashboard API Logs Revision Table"
}

output "image_api_logs_table_id" {
  value       = format("%s:%s.%s", google_bigquery_table.rmin_operationaldata_bigquery_e_Image_API_Logs.project, google_bigquery_table.rmin_operationaldata_bigquery_e_Image_API_Logs.dataset_id, google_bigquery_table.rmin_operationaldata_bigquery_e_Image_API_Logs.table_id)
  description = "BigQuery Table ID for the Image API Logs Revision Table"
}

output "login_api_logs_table_id" {
  value       = var.toggle_4583_5681_consumer_portal ? format("%s:%s.%s", google_bigquery_table.rmin_operationaldata_bigquery_e_Login_API_Logs[0].project, google_bigquery_table.rmin_operationaldata_bigquery_e_Login_API_Logs[0].dataset_id, google_bigquery_table.rmin_operationaldata_bigquery_e_Login_API_Logs[0].table_id) : null
  description = "BigQuery Table ID for the Package API Logs Revision Table"
}

output "mics_extract_table_id" {
  value       = var.toggle_4583_1111_subscriber_services ? format("%s:%s.%s", google_bigquery_table.rmin_operationaldata_bigquery_e_Mics_Extract_Logs[0].project, google_bigquery_table.rmin_operationaldata_bigquery_e_Mics_Extract_Logs[0].dataset_id, google_bigquery_table.rmin_operationaldata_bigquery_e_Mics_Extract_Logs[0].table_id) : null
  description = "BigQuery table ID for the Mics Extract Logs Table"
}

output "mics_extract_table_name" {
  value       = var.toggle_4583_1111_subscriber_services ? google_bigquery_table.rmin_operationaldata_bigquery_e_Mics_Extract_Logs[0].table_id : null
  description = "Bigquery Table Name for the Mics Extract Logs Table"
}

output "package_api_logs_table_id" {
  value       = var.toggle_4583_5673_myusps_migration ? format("%s:%s.%s", google_bigquery_table.rmin_operationaldata_bigquery_e_Package_API_Logs[0].project, google_bigquery_table.rmin_operationaldata_bigquery_e_Package_API_Logs[0].dataset_id, google_bigquery_table.rmin_operationaldata_bigquery_e_Package_API_Logs[0].table_id) : null
  description = "BigQuery Table ID for the Package API Logs Revision Table"
}

output "package_notification_logs_table_id" {
  value       = var.toggle_4583_5673_myusps_migration ? format("%s:%s.%s", google_bigquery_table.rmin_operationaldata_bigquery_e_Package_Notification_Logs[0].project, google_bigquery_table.rmin_operationaldata_bigquery_e_Package_Notification_Logs[0].dataset_id, google_bigquery_table.rmin_operationaldata_bigquery_e_Package_Notification_Logs[0].table_id) : null
  description = "BigQuery Table ID for the Package Notification Logs Revision Table"
}

output "physical_address_revision_table_id" {
  value       = var.toggle_4583_1111_subscriber_services ? format("%s:%s.%s", google_bigquery_table.rmin_operationaldata_bigquery_e_Physical_Address_Revision[0].project, google_bigquery_table.rmin_operationaldata_bigquery_e_Physical_Address_Revision[0].dataset_id, google_bigquery_table.rmin_operationaldata_bigquery_e_Physical_Address_Revision[0].table_id) : null
  description = "BigQuery table ID for the Physical Address Revision Table"
}

output "subscriber_api_logs_table_id" {
  value       = var.toggle_4583_1111_subscriber_services ? format("%s:%s.%s", google_bigquery_table.rmin_operationaldata_bigquery_e_Subscriber_API_Logs[0].project, google_bigquery_table.rmin_operationaldata_bigquery_e_Subscriber_API_Logs[0].dataset_id, google_bigquery_table.rmin_operationaldata_bigquery_e_Subscriber_API_Logs[0].table_id) : null
  description = "BigQuery table ID for the Subscriber API Logs Table"
}

output "eagan_proxy_logs_table_id" {
  value       = var.toggle_4583_5680_frontend ? format("%s:%s.%s", google_bigquery_table.rmin_operationaldata_bigquery_e_Eagan_Proxy_Logs[0].project, google_bigquery_table.rmin_operationaldata_bigquery_e_Eagan_Proxy_Logs[0].dataset_id, google_bigquery_table.rmin_operationaldata_bigquery_e_Eagan_Proxy_Logs[0].table_id) : null
  description = "Bigquery Table Name for the Eagan Proxy Logs Table"
}

output "mc_cloud_mail_campaign_reporting_job_logs_bq_table_id" {
  value       = google_bigquery_table.rmin_operationaldata_bigquery_e_Cloud_Mail_Campaign_Reporting_Job_Logs.table_id
  description = "Bigquery Table Name for the Mail Campaign Reporting Job Logs Table"
}

output "rmin_cloud_zip5_initiatives_sync_function_c_bigquery_table" {
  value       = var.toggle_4583_5681_consumer_portal ? format("%s.%s.%s", google_bigquery_table.rmin_operationaldata_bigquery_e_DN_ZIP5_CLOUD[0].project, google_bigquery_table.rmin_operationaldata_bigquery_e_DN_ZIP5_CLOUD[0].dataset_id, google_bigquery_table.rmin_operationaldata_bigquery_e_DN_ZIP5_CLOUD[0].table_id) : null
  description = "BigQuery Table for zip5 initiatives sync cloud function"
}

output "digest_click_logs_table_id" {
  value       = var.toggle_4583_5666_redesign_phase2 ? format("%s:%s.%s", google_bigquery_table.rmin_operationaldata_bigquery_e_Digest_Click_Logs[0].project, google_bigquery_table.rmin_operationaldata_bigquery_e_Digest_Click_Logs[0].dataset_id, google_bigquery_table.rmin_operationaldata_bigquery_e_Digest_Click_Logs[0].table_id) : null
  description = "BigQuery Table ID for the Digest Click Logs Table"
}

output "digest_tracking_errors_table_id" {
  value       = var.toggle_4583_5666_redesign_phase2 ? format("%s:%s.%s", google_bigquery_table.rmin_operationaldata_bigquery_e_Digest_Tracking_Errors[0].project, google_bigquery_table.rmin_operationaldata_bigquery_e_Digest_Tracking_Errors[0].dataset_id, google_bigquery_table.rmin_operationaldata_bigquery_e_Digest_Tracking_Errors[0].table_id) : null
  description = "BigQuery Table ID for the Digest Tracking Errors Table"
}

output "mc_click_logs_table_id" {
  value       = var.toggle_4583_5666_redesign_phase2 ? format("%s:%s.%s", google_bigquery_table.rmin_operationaldata_bigquery_e_MC_Click_Logs[0].project, google_bigquery_table.rmin_operationaldata_bigquery_e_MC_Click_Logs[0].dataset_id, google_bigquery_table.rmin_operationaldata_bigquery_e_MC_Click_Logs[0].table_id) : null
  description = "Bigquery Table Name for the Mail Campaign Click Logs Table"
}

output "qr_code_service_job_logs_bq_table_id" {
  value       = google_bigquery_table.rmin_operationaldata_bigquery_e_QR_Code_Service_Logs.table_id
  description = "Bigquery Table Name for the QR Code Service Logs Table"
}

output "digest_open_logs_bq_table_id" {
  value       = var.toggle_4583_xxxx_mc_reporting ? format("%s:%s.%s", google_bigquery_table.rmin_operationaldata_bigquery_e_Digest_Open_Logs[0].project, google_bigquery_table.rmin_operationaldata_bigquery_e_Digest_Open_Logs[0].dataset_id, google_bigquery_table.rmin_operationaldata_bigquery_e_Digest_Open_Logs[0].table_id) : null
  description = "Bigquery Table Name for the Digest Open Logs Table"
}

output "digest_opt_out_reason_bq_table_id" {
  value       = var.toggle_4583_5681_consumer_portal ? format("%s:%s.%s", google_bigquery_table.rmin_operationaldata_bigquery_e_Digest_Opt_Out_Reason[0].project, google_bigquery_table.rmin_operationaldata_bigquery_e_Digest_Opt_Out_Reason[0].dataset_id, google_bigquery_table.rmin_operationaldata_bigquery_e_Digest_Opt_Out_Reason[0].table_id) : null
  description = "Bigquery Table Name for the Digest Open Logs Table"
}

output "subscriber_opt_in_settings_dlt_bq_table_id" {
  value       = var.toggle_4583_5680_frontend ? format("%s:%s.%s", google_bigquery_table.rmin_operationaldata_bigquery_e_Subscriber_Opt_In_Settings_Dlt[0].project, google_bigquery_table.rmin_operationaldata_bigquery_e_Subscriber_Opt_In_Settings_Dlt[0].dataset_id, google_bigquery_table.rmin_operationaldata_bigquery_e_Subscriber_Opt_In_Settings_Dlt[0].table_id) : null
  description = "Bigquery Table Name for the Subscriber Opt In Settings Dlt"
}

output "mdn_to_eng_processing_logs_bq_table_id" {
  value       = var.toggle_4583_5708_mdn_to_eng ? format("%s:%s.%s", google_bigquery_table.rmin_operationaldata_bigquery_c_MDN_To_Eng_Processing_Logs[0].project, google_bigquery_table.rmin_operationaldata_bigquery_c_MDN_To_Eng_Processing_Logs[0].dataset_id, google_bigquery_table.rmin_operationaldata_bigquery_c_MDN_To_Eng_Processing_Logs[0].table_id) : null
  description = "Bigquery Table Name for the MDN to Eng Processing Logs Table"
}

output "mdn_to_eng_processing_logs_bq_table_dataset_name" {
  value       = var.toggle_4583_5708_mdn_to_eng ? format("%s.%s", google_bigquery_table.rmin_operationaldata_bigquery_c_MDN_To_Eng_Processing_Logs[0].dataset_id, google_bigquery_table.rmin_operationaldata_bigquery_c_MDN_To_Eng_Processing_Logs[0].table_id) : null
  description = "Bigquery Table Name for the MDN to Eng Processing Logs Table"
}

output "mdn_to_eng_processing_logs_bq_table_name" {
  value       = var.toggle_4583_5708_mdn_to_eng ? google_bigquery_table.rmin_operationaldata_bigquery_c_MDN_To_Eng_Processing_Logs[0].table_id : null
  description = "Bigquery Table Name for the MDN to Eng Processing Logs Table"
}

output "mdn_to_eng_processing_logs_bq_table_dataset_id" {
  value       = var.toggle_4583_5708_mdn_to_eng ? google_bigquery_table.rmin_operationaldata_bigquery_c_MDN_To_Eng_Processing_Logs[0].dataset_id : null
  description = "Bigquery Table Name for the MDN to Eng Processing Logs Table"
}