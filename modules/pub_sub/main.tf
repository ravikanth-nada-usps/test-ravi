# [START google_pubsub_schema]

resource "google_pubsub_schema" "dashboard_api_logs" {
  name       = "dashboard-api-logs"
  type       = "PROTOCOL_BUFFER"
  definition = file("${path.module}/schemas/dashboard-api-logging-schema.proto")
}

resource "google_pubsub_schema" "image_api_logs" {
  name       = "image-api-logs"
  type       = "PROTOCOL_BUFFER"
  definition = file("${path.module}/schemas/image-api-logging-schema.proto")
}

resource "google_pubsub_schema" "login_api_logs" {
  name       = "login-api-logs"
  type       = "PROTOCOL_BUFFER"
  definition = file("${path.module}/schemas/login-api-logs-schema.proto")

  count = var.toggle_4583_5681_consumer_portal ? 1 : 0
}

resource "google_pubsub_schema" "subscriber_api_logs" {
  name       = "subscriber-api-logs"
  type       = "PROTOCOL_BUFFER"
  definition = file("${path.module}/schemas/subscriber-api-logging-schema.proto")

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0
}

resource "google_pubsub_schema" "subscriber_opt_in_settings" {
  name       = "subscriber-opt-in-settings"
  type       = "PROTOCOL_BUFFER"
  definition = file("${path.module}/schemas/subscriber-opt-in-settings-schema.proto")

  count = var.toggle_4583_5680_frontend ? 1 : 0
}

resource "google_pubsub_schema" "eagan_proxy_logs" {
  name       = "eagan-proxy-logs"
  type       = "PROTOCOL_BUFFER"
  definition = file("${path.module}/schemas/eagan-proxy-logging-schema.proto")

  count = var.toggle_4583_5680_frontend ? 1 : 0
}

resource "google_pubsub_schema" "package_api_logs" {
  name       = "package-api-logs"
  type       = "PROTOCOL_BUFFER"
  definition = file("${path.module}/schemas/package-api-logging-schema.proto")

  count = var.toggle_4583_5673_myusps_migration ? 1 : 0
}

resource "google_pubsub_schema" "package_notification_logs" {
  name       = "package-notification-logs"
  type       = "PROTOCOL_BUFFER"
  definition = file("${path.module}/schemas/package-notification-logging-schema.proto")

  count = var.toggle_4583_5673_myusps_migration ? 1 : 0
}

resource "google_pubsub_schema" "account_revision" {
  name       = "account-revision"
  type       = "PROTOCOL_BUFFER"
  definition = file("${path.module}/schemas/account-revision-schema.proto")

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0
}

resource "google_pubsub_schema" "physical_address_revision" {
  name       = "physical-address-revision"
  type       = "PROTOCOL_BUFFER"
  definition = file("${path.module}/schemas/physical-address-revision-schema.proto")

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0
}

resource "google_pubsub_schema" "digest_click_logs" {
  name       = "digest-click-logs"
  type       = "PROTOCOL_BUFFER"
  definition = file("${path.module}/schemas/digest-click-logging-schema.proto")

  count = var.toggle_4583_5666_redesign_phase2 ? 1 : 0
}

resource "google_pubsub_schema" "digest_tracking_errors_logs" {
  name       = "digest-tracking-errors-logs"
  type       = "PROTOCOL_BUFFER"
  definition = file("${path.module}/schemas/digest-tracking-errors-logging-schema.proto")

  count = var.toggle_4583_5666_redesign_phase2 ? 1 : 0
}

resource "google_pubsub_schema" "mc_click_logs" {
  name       = "mc-click-logs"
  type       = "PROTOCOL_BUFFER"
  definition = file("${path.module}/schemas/mc-click-logs-schema.proto")

  count = var.toggle_4583_5666_redesign_phase2 ? 1 : 0
}

resource "google_pubsub_schema" "digest_open_logs" {
  name       = "digest-open-logs"
  type       = "PROTOCOL_BUFFER"
  definition = file("${path.module}/schemas/digest-open-logs-schema.proto")

  count = var.toggle_4583_xxxx_mc_reporting ? 1 : 0
}

resource "google_pubsub_schema" "digest_opt_out_reason" {
  name       = "digest-opt-out-reason"
  type       = "PROTOCOL_BUFFER"
  definition = file("${path.module}/schemas/digest-opt-out-reason-schema.proto")

  count = var.toggle_4583_5681_consumer_portal ? 1 : 0
}

# [END google_pubsub_schema]


# [START google_pubsub_topic]

resource "google_pubsub_topic" "rmin_99m_barcode_submission_topic_e" {
  name    = "rmin-99m-barcode-submission-topic-e-${var.name_suffix}"
  project = var.project_id
}

//ADD SCHEMA
resource "google_pubsub_topic" "rmin_account_revision_topic" {
  name    = "rmin-account-revision-topic-c-${var.name_suffix}"
  project = var.project_id

  depends_on = [google_pubsub_schema.account_revision]
  schema_settings {
    encoding = "JSON"
    schema   = "projects/${var.project_id}/schemas/account-revision"
  }

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0
}

resource "google_pubsub_topic" "rmin_alerts_topic_e" {
  name    = "rmin-alerts-topic-e-${var.name_suffix}"
  project = var.project_id
}

resource "google_pubsub_topic" "rmin_campaign_topic_e" {
  name    = "rmin-campaign-topic-e-${var.name_suffix}"
  project = var.project_id
}

resource "google_pubsub_topic" "rmin_container_scan_topic_e" {
  name    = "rmin-container-scan-topic-e-${var.name_suffix}"
  project = var.project_id
}

resource "google_pubsub_topic" "rmin_dashboard_api_logs_dlt_c" {
  name    = "rmin-dashboard-api-logs-dlt-c-${var.name_suffix}"
  project = var.project_id
}

resource "google_pubsub_topic" "rmin_dashboard_api_logs_c" {
  name    = "rmin-dashboard-api-logs-c-${var.name_suffix}"
  project = var.project_id

  depends_on = [google_pubsub_schema.dashboard_api_logs]
  schema_settings {
    encoding = "JSON"
    schema   = "projects/${var.project_id}/schemas/dashboard-api-logs"
  }
}

resource "google_pubsub_topic" "rmin_dashboard_event_topic_e" {

  name    = "rmin-dashboard-event-topic-e-${var.name_suffix}"
  project = var.project_id
}

resource "google_pubsub_topic" "rmin_digest_event_topic_c" {
  name    = "rmin-digest-event-topic-c-${var.name_suffix}"
  project = var.project_id
}

resource "google_pubsub_topic" "rmin_dn_email_topic_e" {
  name    = "rmin-dn-email-topic-e-${var.name_suffix}"
  project = var.project_id
}

resource "google_pubsub_topic" "rmin_dn_logs_topic_e" {
  name    = "rmin-dn-logs-topic-e-${var.name_suffix}"
  project = var.project_id
}

resource "google_pubsub_topic" "rmin_errors_e" {
  name    = "rmin-errors-e-${var.name_suffix}"
  project = var.project_id
}

resource "google_pubsub_topic" "rmin_flats_topic_e" {
  name    = "rmin-flats-topic-e-${var.name_suffix}"
  project = var.project_id
}

resource "google_pubsub_topic" "rmin_image_api_logs_dlt_c" {
  name    = "rmin-image-api-logs-dlt-c-${var.name_suffix}"
  project = var.project_id
}

resource "google_pubsub_topic" "rmin_image_api_logs_c" {
  name    = "rmin-image-api-logs-c-${var.name_suffix}"
  project = var.project_id

  depends_on = [google_pubsub_schema.image_api_logs]
  schema_settings {
    encoding = "JSON"
    schema   = "projects/${var.project_id}/schemas/image-api-logs"
  }
}

resource "google_pubsub_topic" "rmin_lde_zip11_topic_e" {
  name    = "rmin-lde-zip11-topic-e-${var.name_suffix}"
  project = var.project_id
}

resource "google_pubsub_topic" "rmin_locale_key_submission_topic_e" {
  name    = "rmin-locale-key-submission-topic-e-${var.name_suffix}"
  project = var.project_id
}

resource "google_pubsub_topic" "rmin_login_api_logs_topic" {
  name    = "rmin-login-api-logs-c-${var.name_suffix}"
  project = var.project_id

  schema_settings {
    encoding = "JSON"
    schema   = google_pubsub_schema.login_api_logs[0].id
  }

  count = var.toggle_4583_5681_consumer_portal ? 1 : 0
}


resource "google_pubsub_topic" "rmin_mail_campaign_reporting_topic_c" {
  name    = "rmin-mail-campaign-reporting-topic-c-${var.name_suffix}"
  project = var.project_id
}

resource "google_pubsub_topic" "rmin_packages_topic_e" {
  name    = "rmin-packages-topic-e-${var.name_suffix}"
  project = var.project_id
}

resource "google_pubsub_topic" "rmin_physical_address_revision_topic" {
  name    = "rmin-physical-address-revision-topic-c-${var.name_suffix}"
  project = var.project_id

  depends_on = [google_pubsub_schema.physical_address_revision]
  schema_settings {
    encoding = "JSON"
    schema   = "projects/${var.project_id}/schemas/physical-address-revision"
  }

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0
}

resource "google_pubsub_topic" "rmin_mics_subscriber_extract_topic_c" {
  name    = "rmin-mics-subscriber-extract-topic-c-${var.name_suffix}"
  project = var.project_id

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0
}

resource "google_pubsub_topic" "rmin_package_api_logs_topic" {
  name    = "rmin-package-api-logs-topic-c-${var.name_suffix}"
  project = var.project_id

  schema_settings {
    encoding = "JSON"
    schema   = google_pubsub_schema.package_api_logs[0].id
  }

  count = var.toggle_4583_5673_myusps_migration ? 1 : 0
}

resource "google_pubsub_topic" "rmin_package_event_topic" {
  name    = "rmin-package-event-topic-c-${var.name_suffix}"
  project = var.project_id

  count = var.toggle_4583_5673_myusps_migration ? 1 : 0
}

resource "google_pubsub_topic" "rmin_package_notification_topic" {
  name    = "rmin-package-notification-topic-c-${var.name_suffix}"
  project = var.project_id

  count = var.toggle_4583_5673_myusps_migration ? 1 : 0
}

resource "google_pubsub_topic" "rmin_package_sms_notification_topic" {
  name    = "rmin-package-sms-notification-topic-c-${var.name_suffix}"
  project = var.project_id

  count = var.toggle_4583_5710_apigee_hybrid ? 1 : 0
}

resource "google_pubsub_topic" "rmin_package_notification_dlq_topic" {
  name    = "rmin-package-notification-dlq-topic-c-${var.name_suffix}"
  project = var.project_id

  count = var.toggle_4583_5673_myusps_migration ? 1 : 0
}

resource "google_pubsub_topic" "rmin_package_sms_notification_dlq_topic" {
  name    = "rmin-package-sms-notification-dlq-topic-c-${var.name_suffix}"
  project = var.project_id

  count = var.toggle_4583_5710_apigee_hybrid ? 1 : 0
}

resource "google_pubsub_topic" "rmin_package_notification_logs_topic" {
  name    = "rmin-package-notification-logs-topic-c-${var.name_suffix}"
  project = var.project_id

  schema_settings {
    encoding = "JSON"
    schema   = google_pubsub_schema.package_notification_logs[0].id
  }

  count = var.toggle_4583_5673_myusps_migration ? 1 : 0
}

resource "google_pubsub_topic" "rmin_package_notification_update_topic" {
  name    = "rmin-package-notification-update-topic-c-${var.name_suffix}"
  project = var.project_id

  count = var.toggle_4583_5673_myusps_migration ? 1 : 0
}

resource "google_pubsub_topic" "rmin_psg_topic_e" {
  name    = "rmin-psg-topic-e-${var.name_suffix}"
  project = var.project_id
}

resource "google_pubsub_topic" "rmin_qr_code_service_topic_c" {
  name    = "rmin-qr-code-service-topic-c-${var.name_suffix}"
  project = var.project_id
}

resource "google_pubsub_topic" "rmin_qr_code_service_dlt_topic_c" {
  name    = "rmin-qr-code-service-dlt-topic-c-${var.name_suffix}"
  project = var.project_id
}

resource "google_pubsub_topic" "rmin_rawfile_topic_e" {
  name    = "rmin-rawfile-topic-e-${var.name_suffix}"
  project = var.project_id
}

resource "google_pubsub_topic" "rmin_redischeck_campaign_e" {
  name    = "rmin-redischeck-campaign-e-${var.name_suffix}"
  project = var.project_id
}

resource "google_pubsub_topic" "rmin_redischeck_locks_cache_e" {
  name    = "rmin-redischeck-locks-cache-e-${var.name_suffix}"
  project = var.project_id
}

resource "google_pubsub_topic" "rmin_redischeck_locks_cache_e_2" {
  name    = "rmin-redischeck-locks-cache-e-2-${var.name_suffix}"
  project = var.project_id
}

resource "google_pubsub_topic" "rmin_redischeck_mailCampaign_c" {
  name    = "rmin-redischeck-mailCampaign-c-${var.name_suffix}"
  project = var.project_id
}

resource "google_pubsub_topic" "rmin_redischeck_mailCampaign_ext_c" {
  name    = "rmin-redischeck-mailCampaign-ext-c-${var.name_suffix}"
  project = var.project_id
  count   = var.toggle_4583_xxxx_ext_caches ? 1 : 0
}

resource "google_pubsub_topic" "rmin_redischeck_mdnzip11s_cache_c" {
  name    = "rmin-redischeck-mdnzip11s-cache-c-${var.name_suffix}"
  project = var.project_id
}

resource "google_pubsub_topic" "rmin_redischeck_mics_locks_c" {
  name    = "rmin-redischeck-mics-locks-c-${var.name_suffix}"
  project = var.project_id
}

resource "google_pubsub_topic" "rmin_redischeck_packageCampaign_c" {
  name    = "rmin-redischeck-packageCampaign-c-${var.name_suffix}"
  project = var.project_id
}

resource "google_pubsub_topic" "rmin_redischeck_packageCampaign_ext_c" {
  name    = "rmin-redischeck-packageCampaign-ext-c-${var.name_suffix}"
  project = var.project_id
  count   = var.toggle_4583_xxxx_ext_caches ? 1 : 0
}

resource "google_pubsub_topic" "rmin_redischeck_saturation_data_cache_e" {
  name    = "rmin-redischeck-saturation-data-cache-e-${var.name_suffix}"
  project = var.project_id
}

resource "google_pubsub_topic" "rmin_redischeck_subscriber_2_e" {
  name    = "rmin-redischeck-subscriber-2-e-${var.name_suffix}"
  project = var.project_id
}

resource "google_pubsub_topic" "rmin_redischeck_subscriber_c" {
  name    = "rmin-redischeck-subscriber-c-${var.name_suffix}"
  project = var.project_id
}

resource "google_pubsub_topic" "rmin_redischeck_fs_subscriber_c" {
  name    = "rmin-redischeck-fs-subscriber-cache-c-${var.name_suffix}"
  project = var.project_id

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0
}

resource "google_pubsub_topic" "rmin_redischeck_subscriber_e" {
  name    = "rmin-redischeck-subscriber-e-${var.name_suffix}"
  project = var.project_id
}

resource "google_pubsub_topic" "rmin_redischeck_subscriber_email_cache_c" {
  name    = "rmin-redischeck-subscriber-email-cache-c-${var.name_suffix}"
  project = var.project_id
}

resource "google_pubsub_topic" "rmin_redischeck_fs_subscriber_email_cache_c" {
  name    = "rmin-redischeck-fs-subscriber-email-cache-c-${var.name_suffix}"
  project = var.project_id

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0
}

resource "google_pubsub_topic" "rmin_redischeck_zip5_initiatives_cache_c" {
  name    = "rmin-redischeck-zip5-initiatives-cache-c-${var.name_suffix}"
  project = var.project_id

  count = var.toggle_4583_5681_consumer_portal ? 1 : 0
}

resource "google_pubsub_topic" "rmin_reportingsync_dlt_e" {
  name    = "rmin-reportingsync-dlt-e-${var.name_suffix}"
  project = var.project_id
}

resource "google_pubsub_topic" "rmin_subscriber_topic_2_e" {
  name    = "rmin-subscriber-topic-2-e-${var.name_suffix}"
  project = var.project_id
}

resource "google_pubsub_topic" "rmin_subscriber_api_logs_topic" {
  name    = "rmin-subscriber-api-logs-topic-c-${var.name_suffix}"
  project = var.project_id

  depends_on = [google_pubsub_schema.subscriber_api_logs]
  schema_settings {
    encoding = "JSON"
    schema   = "projects/${var.project_id}/schemas/subscriber-api-logs"
  }

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0
}

resource "google_pubsub_topic" "rmin_subscriber_opt_in_settings_topic" {
  name    = "rmin-subscriber-opt-in-settings-topic-c-${var.name_suffix}"
  project = var.project_id

  depends_on = [google_pubsub_schema.subscriber_opt_in_settings]
  schema_settings {
    encoding = "JSON"
    schema   = "projects/${var.project_id}/schemas/subscriber-opt-in-settings"
  }

  count = var.toggle_4583_5680_frontend ? 1 : 0
}

resource "google_pubsub_topic" "rmin_eagan_proxy_logs_topic" {
  name    = "rmin-eagan-proxy-logs-topic-c-${var.name_suffix}"
  project = var.project_id

  depends_on = [google_pubsub_schema.eagan_proxy_logs]
  schema_settings {
    encoding = "JSON"
    schema   = "projects/${var.project_id}/schemas/eagan-proxy-logs"
  }

  count = var.toggle_4583_5680_frontend ? 1 : 0
}

resource "google_pubsub_topic" "rmin_subscriber_event_topic" {
  name    = "rmin-subscriber-event-topic-c-${var.name_suffix}"
  project = var.project_id

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0
}

resource "google_pubsub_topic" "rmin_firestore_gcs_validation_func" {
  name    = "rmin-firestore-gcs-validation-func-${var.name_suffix}"
  project = var.project_id
}

resource "google_pubsub_topic" "rmin_redischeck_flats_lock_c" {
  project = var.project_id
  name    = "rmin-redischeck-flats-lock-c-${var.name_suffix}"
}

resource "google_pubsub_topic" "rmin_redischeck_relay_lock_c" {
  project = var.project_id
  name    = "rmin-redischeck-relay-lock-c-${var.name_suffix}"
}

resource "google_pubsub_topic" "rmin_zip11subscribers_topic_c" {
  project = var.project_id
  name    = "rmin-zip11subscribers-topic-c-${var.name_suffix}"
}

resource "google_pubsub_topic" "rmin_zip5_done_topic_c" {
  project = var.project_id
  name    = "rmin-zip5-done-topic-c-${var.name_suffix}"
}

resource "google_pubsub_topic" "rmin_emailstatistics_topic_c" {
  project = var.project_id
  name    = "rmin-emailstatistics-topic-c-${var.name_suffix}"
}

resource "google_pubsub_topic" "rmin_email_topic_c" {
  project = var.project_id
  name    = "rmin-email-topic-c-${var.name_suffix}"
}

resource "google_pubsub_topic" "rmin_email_dlt_topic_c" {
  project = var.project_id
  name    = "rmin-email-dlt-topic-c-${var.name_suffix}"
}

resource "google_pubsub_topic" "rmin_mics_extract_file_upload_topic" {
  name    = "rmin-mics-extract-file-upload-topic-c-${var.name_suffix}"
  project = var.project_id

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0
}

resource "google_pubsub_topic" "rmin_mics_extract_file_upload_dlq_topic" {
  name    = "rmin-mics-extract-file-upload-dlq-topic-c-${var.name_suffix}"
  project = var.project_id

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0
}

resource "google_pubsub_topic" "rmin_po_campaign_reporting_topic_c" {
  name    = "rmin-po-campaign-reporting-topic-c-${var.name_suffix}"
  project = var.project_id

  count = var.toggle_4583_5668_price_change ? 1 : 0
}

resource "google_pubsub_topic" "rmin_digest_click_event_topic" {
  name    = "rmin-digest-click-event-topic-c-${var.name_suffix}"
  project = var.project_id

  depends_on = [google_pubsub_schema.digest_click_logs[0]]
  schema_settings {
    encoding = "JSON"
    schema   = "projects/${var.project_id}/schemas/digest-click-logs"
  }

  count = var.toggle_4583_5666_redesign_phase2 ? 1 : 0
}

resource "google_pubsub_topic" "rmin_digest_open_logs_topic_c" {
  name    = "rmin-digest-open-logs-topic-c-${var.name_suffix}"
  project = var.project_id

  depends_on = [google_pubsub_schema.digest_open_logs]
  schema_settings {
    encoding = "JSON"
    schema   = "projects/${var.project_id}/schemas/digest-open-logs"
  }

  count = var.toggle_4583_xxxx_mc_reporting ? 1 : 0
}

resource "google_pubsub_topic" "rmin_digest_opt_out_reason_topic_c" {
  name    = "rmin-digest-opt-out-reason-topic-c-${var.name_suffix}"
  project = var.project_id

  depends_on = [google_pubsub_schema.digest_opt_out_reason]
  schema_settings {
    encoding = "JSON"
    schema   = "projects/${var.project_id}/schemas/digest-opt-out-reason"
  }

  count = var.toggle_4583_5681_consumer_portal ? 1 : 0
}

resource "google_pubsub_topic" "rmin_subscriber_opt_in_settings_dlt_topic_c" {
  name    = "rmin-subscriber-opt-in-settings-dlt-topic-c-${var.name_suffix}"
  project = var.project_id

  depends_on = [google_pubsub_schema.physical_address_revision]
  schema_settings {
    encoding = "JSON"
    schema   = "projects/${var.project_id}/schemas/physical-address-revision"
  }

  count = var.toggle_4583_5680_frontend ? 1 : 0
}

resource "google_pubsub_topic" "rmin_digest_tracking_errors_topic" {
  name    = "rmin-digest-tracking-errors-topic-c-${var.name_suffix}"
  project = var.project_id

  depends_on = [google_pubsub_schema.digest_tracking_errors_logs[0]]
  schema_settings {
    encoding = "JSON"
    schema   = "projects/${var.project_id}/schemas/digest-tracking-errors-logs"
  }

  count = var.toggle_4583_5666_redesign_phase2 ? 1 : 0
}

resource "google_pubsub_topic" "rmin_mc_click_logs_topic_c" {
  name    = "rmin-mc-click-logs-topic-c-${var.name_suffix}"
  project = var.project_id

  depends_on = [google_pubsub_schema.mc_click_logs]
  schema_settings {
    encoding = "JSON"
    schema   = "projects/${var.project_id}/schemas/mc-click-logs"
  }

  count = var.toggle_4583_5666_redesign_phase2 ? 1 : 0
}

resource "google_pubsub_topic" "rmin_inbound_package_sync_topic" {
  name    = "rmin-inbound-package-data-sync-topic-c-${var.name_suffix}"
  project = var.project_id

  count = var.toggle_4583_5690_ptr2 ? 1 : 0
}

resource "google_pubsub_topic" "rmin_mc_click_data_sync_topic" {
  name    = "rmin-mc-click-data-sync-topic-c-${var.name_suffix}"
  project = var.project_id

  count = var.toggle_4583_5681_consumer_portal ? 1 : 0
}

# [END google_pubsub_topic]

# [START google_pubsub_subscription]

resource "google_pubsub_subscription" "rmin_99m_barcode_submission_subscription_e" {
  ack_deadline_seconds       = "10"
  enable_message_ordering    = "false"
  message_retention_duration = "604800s"
  name                       = "rmin-99m-barcode-submission-subscription-e-${var.name_suffix}"
  project                    = var.project_id
  retain_acked_messages      = "false"
  topic                      = google_pubsub_topic.rmin_99m_barcode_submission_topic_e.name

  expiration_policy {
    ttl = ""
  }
}

resource "google_pubsub_subscription" "rmin_account_revision_subscription" {
  ack_deadline_seconds       = "120"
  enable_message_ordering    = "false"
  message_retention_duration = "604800s"
  name                       = "rmin-account-revision-subscription-c-${var.name_suffix}"
  project                    = var.project_id

  bigquery_config {
    table               = var.account_revision_table_id
    use_topic_schema    = true
    write_metadata      = false
    drop_unknown_fields = true
  }

  retain_acked_messages = "false"

  retry_policy {
    maximum_backoff = "5s"
    minimum_backoff = "0s"
  }

  expiration_policy {
    ttl = ""
  }

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0

  topic = google_pubsub_topic.rmin_account_revision_topic[0].name
}

resource "google_pubsub_subscription" "rmin_campaign_subscription_c" {
  ack_deadline_seconds    = "10"
  enable_message_ordering = "false"

  expiration_policy {
    ttl = ""
  }

  message_retention_duration = "604800s"
  name                       = "rmin-campaign-subscription-c-${var.name_suffix}"
  project                    = var.project_id
  retain_acked_messages      = "false"
  topic                      = google_pubsub_topic.rmin_campaign_topic_e.name
}

resource "google_pubsub_subscription" "rmin_campaign_subscription_ext_c" {
  ack_deadline_seconds    = "10"
  enable_message_ordering = "false"

  expiration_policy {
    ttl = ""
  }

  message_retention_duration = "604800s"
  name                       = "rmin-campaign-subscription-ext-c-${var.name_suffix}"
  project                    = var.project_id
  retain_acked_messages      = "false"
  topic                      = google_pubsub_topic.rmin_campaign_topic_e.name

  count = var.toggle_4583_xxxx_ext_caches ? 1 : 0
}

resource "google_pubsub_subscription" "rmin_container_scan_topic_subscription_e" {
  ack_deadline_seconds       = "10"
  enable_message_ordering    = "false"
  message_retention_duration = "604800s"
  name                       = "rmin-container-scan-topic-subscription-e-${var.name_suffix}"
  project                    = var.project_id
  retain_acked_messages      = "false"
  topic                      = google_pubsub_topic.rmin_container_scan_topic_e.name

  expiration_policy {
    ttl = ""
  }
}

resource "google_pubsub_subscription" "rmin_dashboard_api_logs_subscription_c" {
  ack_deadline_seconds = "10"

  dead_letter_policy {
    dead_letter_topic     = google_pubsub_topic.rmin_dashboard_api_logs_dlt_c.id
    max_delivery_attempts = "20"
  }

  enable_message_ordering    = "false"
  message_retention_duration = "604800s"
  name                       = "rmin-dashboard-api-logs-subscription-c-${var.name_suffix}"
  project                    = var.project_id
  retain_acked_messages      = "false"

  bigquery_config {
    drop_unknown_fields = "false"
    use_table_schema    = "false"
    use_topic_schema    = "true"
    write_metadata      = "false"
    table               = var.dashboard_api_logs_table_id
  }

  retry_policy {
    maximum_backoff = "600s"
    minimum_backoff = "15s"
  }

  expiration_policy {
    ttl = ""
  }

  topic = google_pubsub_topic.rmin_dashboard_api_logs_c.name

  depends_on = [
    google_pubsub_topic.rmin_dashboard_api_logs_dlt_c,
    google_pubsub_topic.rmin_dashboard_api_logs_c
  ]
}

resource "google_pubsub_subscription" "rmin_dashboard_event_subscription_e" {
  ack_deadline_seconds       = "120"
  enable_message_ordering    = "false"
  message_retention_duration = "604800s"
  name                       = "rmin-dashboard-event-subscription-e-${var.name_suffix}"
  project                    = var.project_id

  push_config {
    oidc_token {
      service_account_email = var.dashboard_event_sub_service_account_email
    }
    push_endpoint = var.dashboard_event_sub_push_endpoint

  }

  retain_acked_messages = "false"

  retry_policy {
    maximum_backoff = "5s"
    minimum_backoff = "0s"
  }

  expiration_policy {
    ttl = ""
  }

  topic = google_pubsub_topic.rmin_dashboard_event_topic_e.name
}

resource "google_pubsub_subscription" "rmin_digest_event_subscription_c" {
  ack_deadline_seconds    = "10"
  enable_message_ordering = "false"

  expiration_policy {
    ttl = ""
  }

  message_retention_duration = "604800s"
  name                       = "rmin-digest-event-subscription-c-${var.name_suffix}"
  project                    = var.project_id
  retain_acked_messages      = "false"
  topic                      = google_pubsub_topic.rmin_digest_event_topic_c.name
}

resource "google_pubsub_subscription" "rmin_dn_email_subscription_e" {
  ack_deadline_seconds       = "10"
  enable_message_ordering    = "false"
  message_retention_duration = "604800s"
  name                       = "rmin-dn-email-subscription-e-${var.name_suffix}"
  project                    = var.project_id
  retain_acked_messages      = "false"
  topic                      = google_pubsub_topic.rmin_dn_email_topic_e.name

  expiration_policy {
    ttl = ""
  }
}

resource "google_pubsub_subscription" "rmin_dn_logs_subscription_e" {
  ack_deadline_seconds       = "10"
  enable_message_ordering    = "false"
  message_retention_duration = "604800s"
  name                       = "rmin-dn-logs-subscription-e-${var.name_suffix}"
  project                    = var.project_id
  retain_acked_messages      = "false"
  topic                      = google_pubsub_topic.rmin_dn_logs_topic_e.name

  expiration_policy {
    ttl = ""
  }
}

resource "google_pubsub_subscription" "rmin_flats_subscription_e_2" {
  ack_deadline_seconds       = "10"
  enable_message_ordering    = "false"
  message_retention_duration = "604800s"
  name                       = "rmin-flats-subscription-e-2-${var.name_suffix}"
  project                    = var.project_id
  retain_acked_messages      = "false"
  topic                      = google_pubsub_topic.rmin_flats_topic_e.name

  expiration_policy {
    ttl = ""
  }
}

resource "google_pubsub_subscription" "rmin_image_api_logs_subscription_c" {
  ack_deadline_seconds = "10"

  dead_letter_policy {
    dead_letter_topic     = google_pubsub_topic.rmin_image_api_logs_dlt_c.id
    max_delivery_attempts = "20"
  }

  enable_message_ordering    = "false"
  message_retention_duration = "604800s"
  name                       = "rmin-image-api-logs-subscription-c-${var.name_suffix}"
  project                    = var.project_id
  retain_acked_messages      = "false"

  retry_policy {
    maximum_backoff = "600s"
    minimum_backoff = "15s"
  }

  bigquery_config {
    drop_unknown_fields = "false"
    use_table_schema    = "false"
    use_topic_schema    = "true"
    write_metadata      = "false"
    table               = var.image_api_logs_table_id
  }

  expiration_policy {
    ttl = ""
  }

  topic = google_pubsub_topic.rmin_image_api_logs_c.name

  depends_on = [
    google_pubsub_topic.rmin_image_api_logs_c,
    google_pubsub_topic.rmin_image_api_logs_dlt_c
  ]
}

resource "google_pubsub_subscription" "rmin_lde_zip11_subscription_e" {
  ack_deadline_seconds       = "10"
  enable_message_ordering    = "false"
  message_retention_duration = "604800s"
  name                       = "rmin-lde-zip11-subscription-e-${var.name_suffix}"
  project                    = var.project_id
  retain_acked_messages      = "false"
  topic                      = google_pubsub_topic.rmin_lde_zip11_topic_e.name

  expiration_policy {
    ttl = ""
  }
}

resource "google_pubsub_subscription" "rmin_locale_key_submission_subscription_e" {
  ack_deadline_seconds       = "10"
  enable_message_ordering    = "false"
  message_retention_duration = "604800s"
  name                       = "rmin-locale-key-submission-subscription-e-${var.name_suffix}"
  project                    = var.project_id
  retain_acked_messages      = "false"
  topic                      = google_pubsub_topic.rmin_locale_key_submission_topic_e.name

  expiration_policy {
    ttl = ""
  }
}

resource "google_pubsub_subscription" "rmin_login_api_logs_subscription" {
  ack_deadline_seconds = "10"

  enable_message_ordering    = "false"
  message_retention_duration = "604800s"
  name                       = "rmin-login-api-logs-subscription-c-${var.name_suffix}"
  project                    = var.project_id
  retain_acked_messages      = "false"

  bigquery_config {
    drop_unknown_fields = "false"
    use_table_schema    = "false"
    use_topic_schema    = "true"
    write_metadata      = "false"
    table               = var.login_api_logs_table_id
  }

  retry_policy {
    maximum_backoff = "600s"
    minimum_backoff = "15s"
  }

  expiration_policy {
    ttl = ""
  }

  topic = google_pubsub_topic.rmin_login_api_logs_topic[0].name

  count = var.toggle_4583_5681_consumer_portal ? 1 : 0
}

resource "google_pubsub_subscription" "rmin_mail_campaign_reporting_subscription_c" {
  ack_deadline_seconds       = "60"
  enable_message_ordering    = "false"
  message_retention_duration = "604800s"
  name                       = "rmin-mail-campaign-reporting-subscription-c-${var.name_suffix}"
  project                    = var.project_id

  push_config {
    oidc_token {
      service_account_email = var.mc_report_sub_service_account_email
    }
    push_endpoint = var.mc_report_cloud_sub_push_endpoint
  }

  retain_acked_messages = "false"

  retry_policy {
    maximum_backoff = "10s"
    minimum_backoff = "0s"
  }

  expiration_policy {
    ttl = ""
  }

  topic = google_pubsub_topic.rmin_mail_campaign_reporting_topic_c.name
}

resource "google_pubsub_subscription" "rmin_mics_extract_file_upload_subscription" {
  ack_deadline_seconds       = "600"
  enable_message_ordering    = "false"
  message_retention_duration = "604800s"
  name                       = "rmin-mics-extract-file-upload-subscription-c-${var.name_suffix}"
  project                    = var.project_id
  retain_acked_messages      = "false"
  topic                      = google_pubsub_topic.rmin_mics_extract_file_upload_topic[0].name

  retry_policy {
    maximum_backoff = "180s"
    minimum_backoff = "60s"
  }

  dead_letter_policy {
    dead_letter_topic     = google_pubsub_topic.rmin_mics_extract_file_upload_dlq_topic[0].id
    max_delivery_attempts = "10"
  }

  expiration_policy {
    ttl = ""
  }

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0

}

resource "google_pubsub_subscription" "rmin_mics_extract_file_upload_dlq_subscription" {
  ack_deadline_seconds       = "10"
  enable_message_ordering    = "false"
  message_retention_duration = "604800s"
  name                       = "rmin-mics-extract-file-upload-dlq-subscription-c-${var.name_suffix}"
  project                    = var.project_id
  retain_acked_messages      = "false"
  topic                      = google_pubsub_topic.rmin_mics_extract_file_upload_dlq_topic[0].name

  retry_policy {
    maximum_backoff = "5s"
    minimum_backoff = "0s"
  }

  expiration_policy {
    ttl = ""
  }

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0

}

resource "google_pubsub_subscription" "rmin_package_api_logs_subscription" {
  ack_deadline_seconds = "10"

  enable_message_ordering    = "false"
  message_retention_duration = "604800s"
  name                       = "rmin-package-api-logs-subscription-c-${var.name_suffix}"
  project                    = var.project_id
  retain_acked_messages      = "false"

  bigquery_config {
    drop_unknown_fields = "false"
    use_table_schema    = "false"
    use_topic_schema    = "true"
    write_metadata      = "false"
    table               = var.package_api_logs_table_id
  }

  retry_policy {
    maximum_backoff = "600s"
    minimum_backoff = "15s"
  }

  expiration_policy {
    ttl = ""
  }

  topic = google_pubsub_topic.rmin_package_api_logs_topic[0].name

  depends_on = [
    google_pubsub_topic.rmin_package_api_logs_topic
  ]

  count = var.toggle_4583_5673_myusps_migration ? 1 : 0
}

resource "google_pubsub_subscription" "rmin_package_notification_logs_subscription" {
  ack_deadline_seconds = "10"

  enable_message_ordering    = "false"
  message_retention_duration = "604800s"
  name                       = "rmin-package-notification-logs-subscription-c-${var.name_suffix}"
  project                    = var.project_id
  retain_acked_messages      = "false"

  bigquery_config {
    drop_unknown_fields = "false"
    use_table_schema    = "false"
    use_topic_schema    = "true"
    write_metadata      = "false"
    table               = var.package_notification_logs_table_id
  }

  retry_policy {
    maximum_backoff = "600s"
    minimum_backoff = "15s"
  }

  expiration_policy {
    ttl = ""
  }

  topic = google_pubsub_topic.rmin_package_notification_logs_topic[0].name

  depends_on = [
    google_pubsub_topic.rmin_package_notification_logs_topic
  ]

  count = var.toggle_4583_5673_myusps_migration ? 1 : 0
}

resource "google_pubsub_subscription" "rmin_package_event_subscription" {
  ack_deadline_seconds       = "90"
  enable_message_ordering    = "false"
  message_retention_duration = "604800s"
  name                       = "rmin-package-event-subscription-c-${var.name_suffix}"
  project                    = var.project_id

  push_config {
    oidc_token {

      service_account_email = var.rmin_package_event_sa_email
    }

    push_endpoint = var.package_event_push_endpoint

  }

  retain_acked_messages = "false"

  retry_policy {
    maximum_backoff = "5s"
    minimum_backoff = "0s"
  }

  expiration_policy {
    ttl = ""
  }

  count = var.toggle_4583_5673_myusps_migration ? 1 : 0

  topic = google_pubsub_topic.rmin_package_event_topic[0].name
}

resource "google_pubsub_subscription" "rmin_package_notification_subscription" {
  ack_deadline_seconds       = "90"
  enable_message_ordering    = "false"
  message_retention_duration = "604800s"
  name                       = "rmin-package-notification-subscription-c-${var.name_suffix}"
  project                    = var.project_id

  /*push_config {
    oidc_token {

      service_account_email = var.rmin_package_notification_sa_email
    }

    push_endpoint = format("%s/%s", var.package_notification_push_endpoint, "email")

  }*/

  retain_acked_messages = "false"

  retry_policy {
    maximum_backoff = "30s"
    minimum_backoff = "2s"
  }

  expiration_policy {
    ttl = ""
  }

  dead_letter_policy {
    dead_letter_topic     = google_pubsub_topic.rmin_package_notification_dlq_topic[0].id
    max_delivery_attempts = "5"
  }

  count = var.toggle_4583_5673_myusps_migration ? 1 : 0

  topic = google_pubsub_topic.rmin_package_notification_topic[0].name
}

resource "google_pubsub_subscription" "rmin_package_notification_dlq_subscription" {
  ack_deadline_seconds       = "10"
  enable_message_ordering    = "false"
  message_retention_duration = "604800s"
  name                       = "rmin-package-notification-dlq-subscription-c-${var.name_suffix}"
  project                    = var.project_id
  retain_acked_messages      = "false"
  topic                      = google_pubsub_topic.rmin_package_notification_dlq_topic[0].name

  retry_policy {
    maximum_backoff = "5s"
    minimum_backoff = "0s"
  }

  expiration_policy {
    ttl = ""
  }

  count = var.toggle_4583_5673_myusps_migration ? 1 : 0

}

resource "google_pubsub_subscription" "rmin_package_sms_notification_subscription" {
  ack_deadline_seconds       = "90"
  enable_message_ordering    = "false"
  message_retention_duration = "604800s"
  name                       = "rmin-package-sms-notification-subscription-c-${var.name_suffix}"
  project                    = var.project_id

  /*push_config {
    oidc_token {

      service_account_email = var.rmin_package_notification_sa_email
    }

    push_endpoint = format("%s/%s", var.package_sms_notification_push_endpoint, "sms")

  }*/

  retain_acked_messages = "false"

  retry_policy {
    maximum_backoff = "30s"
    minimum_backoff = "2s"
  }

  expiration_policy {
    ttl = ""
  }

  dead_letter_policy {
    dead_letter_topic     = google_pubsub_topic.rmin_package_sms_notification_dlq_topic[0].id
    max_delivery_attempts = "5"
  }

  count = var.toggle_4583_5710_apigee_hybrid ? 1 : 0

  topic = google_pubsub_topic.rmin_package_sms_notification_topic[0].name
}

resource "google_pubsub_subscription" "rmin_package_sms_notification_dlq_subscription" {
  ack_deadline_seconds       = "10"
  enable_message_ordering    = "false"
  message_retention_duration = "604800s"
  name                       = "rmin-package-sms-notification-dlq-subscription-c-${var.name_suffix}"
  project                    = var.project_id
  retain_acked_messages      = "false"
  topic                      = google_pubsub_topic.rmin_package_sms_notification_dlq_topic[0].name

  retry_policy {
    maximum_backoff = "5s"
    minimum_backoff = "0s"
  }

  expiration_policy {
    ttl = ""
  }

  count = var.toggle_4583_5710_apigee_hybrid ? 1 : 0

}

resource "google_pubsub_subscription" "rmin_package_notification_update_subscription" {
  ack_deadline_seconds       = "90"
  enable_message_ordering    = "false"
  message_retention_duration = "604800s"
  name                       = "rmin-package-notification-update-subscription-c-${var.name_suffix}"
  project                    = var.project_id

  push_config {
    oidc_token {

      service_account_email = var.rmin_package_notification_update_sa_email
    }

    push_endpoint = var.package_notification_update_push_endpoint

  }

  retain_acked_messages = "false"

  retry_policy {
    maximum_backoff = "5s"
    minimum_backoff = "0s"
  }

  expiration_policy {
    ttl = ""
  }

  count = var.toggle_4583_5673_myusps_migration ? 1 : 0

  topic = google_pubsub_topic.rmin_package_notification_update_topic[0].name
}

resource "google_pubsub_subscription" "rmin_packages_subscription_e_2" {
  ack_deadline_seconds       = "10"
  enable_message_ordering    = "false"
  message_retention_duration = "604800s"
  name                       = "rmin-packages-subscription-e-2-${var.name_suffix}"
  project                    = var.project_id
  retain_acked_messages      = "false"
  topic                      = google_pubsub_topic.rmin_packages_topic_e.name

  expiration_policy {
    ttl = ""
  }
}

resource "google_pubsub_subscription" "rmin_physical_address_revision_subscription" {
  ack_deadline_seconds       = "120"
  enable_message_ordering    = "false"
  message_retention_duration = "604800s"
  name                       = "rmin-physical-address-revision-subscription-c-${var.name_suffix}"
  project                    = var.project_id

  bigquery_config {
    table               = var.physical_address_revision_table_id
    use_topic_schema    = true
    write_metadata      = false
    drop_unknown_fields = true
  }

  retain_acked_messages = "false"

  retry_policy {
    maximum_backoff = "5s"
    minimum_backoff = "0s"
  }

  expiration_policy {
    ttl = ""
  }

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0

  topic = google_pubsub_topic.rmin_physical_address_revision_topic[0].name
}

resource "google_pubsub_subscription" "rmin_subscriber_opt_in_settings_subscription_c" {
  ack_deadline_seconds       = "120"
  enable_message_ordering    = "false"
  message_retention_duration = "604800s"
  name                       = "rmin-subscriber-opt-in-settings-subscription-c-${var.name_suffix}"
  project                    = var.project_id
  topic                      = google_pubsub_topic.rmin_subscriber_opt_in_settings_topic[0].name


  dead_letter_policy {
    dead_letter_topic     = google_pubsub_topic.rmin_subscriber_opt_in_settings_dlt_topic_c[0].id
    max_delivery_attempts = 5
  }

  retry_policy {
    minimum_backoff = "300s"
    maximum_backoff = "300s"
  }

  count = var.toggle_4583_5680_frontend ? 1 : 0

}

resource "google_pubsub_subscription" "rmin_mics_subscriber_extract" {
  ack_deadline_seconds       = "120"
  enable_message_ordering    = "false"
  message_retention_duration = "604800s"
  name                       = "rmin-mics-subscriber-extract-subscription-c-${var.name_suffix}"
  project                    = var.project_id

  retain_acked_messages = "false"

  retry_policy {
    maximum_backoff = "5s"
    minimum_backoff = "0s"
  }

  expiration_policy {
    ttl = ""
  }

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0

  topic = google_pubsub_topic.rmin_mics_subscriber_extract_topic_c[0].name
}

resource "google_pubsub_subscription" "rmin_psg_subscription_e_2" {
  ack_deadline_seconds       = "300"
  enable_message_ordering    = "false"
  message_retention_duration = "604800s"
  name                       = "rmin-psg-subscription-e-2-${var.name_suffix}"
  project                    = var.project_id
  retain_acked_messages      = "false"
  topic                      = google_pubsub_topic.rmin_psg_topic_e.name

  expiration_policy {
    ttl = ""
  }
}

resource "google_pubsub_subscription" "rmin_qr_code_service_subscription_c" {
  ack_deadline_seconds       = "120"
  enable_message_ordering    = "false"
  message_retention_duration = "604800s"
  name                       = "rmin-qr-code-service-subscription-c-${var.name_suffix}"
  project                    = var.project_id
  retain_acked_messages      = "false"
  topic                      = google_pubsub_topic.rmin_qr_code_service_topic_c.name

  push_config {
    oidc_token {
      service_account_email = var.qr_code_service_sub_service_account_email
    }
    push_endpoint = var.qr_code_service_sub_push_endpoint
  }

  retry_policy {
    maximum_backoff = "60s"
    minimum_backoff = "2s"
  }

  dead_letter_policy {
    dead_letter_topic     = google_pubsub_topic.rmin_qr_code_service_dlt_topic_c.id
    max_delivery_attempts = "10"
  }

  expiration_policy {
    ttl = ""
  }

}

resource "google_pubsub_subscription" "rmin_qr_code_service_dlt_subscription_c" {
  ack_deadline_seconds       = "10"
  enable_message_ordering    = "false"
  message_retention_duration = "604800s"
  name                       = "rmin-qr-code-service-dlt-subscription-c-${var.name_suffix}"
  project                    = var.project_id
  retain_acked_messages      = "false"
  topic                      = google_pubsub_topic.rmin_qr_code_service_dlt_topic_c.name

  push_config {
    oidc_token {
      service_account_email = var.dashboard_event_sub_service_account_email
    }
    push_endpoint = var.dashboard_event_sub_push_endpoint
  }

  expiration_policy {
    ttl = ""
  }
}

resource "google_pubsub_subscription" "rmin_rawfile_subscription_e_2" {
  ack_deadline_seconds       = "600"
  enable_message_ordering    = "false"
  message_retention_duration = "604800s"
  name                       = "rmin-rawfile-subscription-e-2-${var.name_suffix}"
  project                    = var.project_id
  retain_acked_messages      = "false"
  topic                      = google_pubsub_topic.rmin_rawfile_topic_e.name

  expiration_policy {
    ttl = ""
  }
}

resource "google_pubsub_subscription" "rmin_reportingsync_dlt_subscription_e" {
  ack_deadline_seconds       = "10"
  enable_message_ordering    = "false"
  message_retention_duration = "604800s"
  name                       = "rmin-reportingsync-dlt-subscription-e-${var.name_suffix}"
  project                    = var.project_id
  retain_acked_messages      = "false"
  topic                      = google_pubsub_topic.rmin_reportingsync_dlt_e.name

  expiration_policy {
    ttl = ""
  }
}

resource "google_pubsub_subscription" "rmin_subscriber_event_subscription" {
  ack_deadline_seconds       = "120"
  enable_message_ordering    = "false"
  message_retention_duration = "604800s"
  name                       = "rmin-subscriber-event-subscription-c-${var.name_suffix}"
  project                    = var.project_id

  push_config {
    oidc_token {

      service_account_email = var.subscriber_event_service_account_email
    }

    push_endpoint = var.subscriber_event_push_endpoint

  }

  retain_acked_messages = "false"

  retry_policy {
    maximum_backoff = "5s"
    minimum_backoff = "0s"
  }

  expiration_policy {
    ttl = ""
  }

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0

  topic = google_pubsub_topic.rmin_subscriber_event_topic[0].name
}

resource "google_pubsub_subscription" "rmin_subscriber_api_logs_subscription" {
  ack_deadline_seconds       = "120"
  enable_message_ordering    = "false"
  message_retention_duration = "604800s"
  name                       = "rmin-subscriber-api-logs-subscription-c-${var.name_suffix}"
  project                    = var.project_id

  bigquery_config {
    table               = var.subscriber_api_logs_table_id
    use_topic_schema    = true
    write_metadata      = false
    drop_unknown_fields = true
  }

  retain_acked_messages = "false"

  retry_policy {
    maximum_backoff = "5s"
    minimum_backoff = "0s"
  }

  expiration_policy {
    ttl = ""
  }

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0

  topic = google_pubsub_topic.rmin_subscriber_api_logs_topic[0].name
}

resource "google_pubsub_subscription" "rmin_eagan_proxy_logs_subscription" {
  ack_deadline_seconds       = "120"
  enable_message_ordering    = "false"
  message_retention_duration = "604800s"
  name                       = "rmin-eagan-proxy-logs-subscription-c-${var.name_suffix}"
  project                    = var.project_id

  bigquery_config {
    table               = var.eagan_proxy_logs_table_id
    use_topic_schema    = true
    write_metadata      = false
    drop_unknown_fields = true
  }

  retain_acked_messages = "false"

  retry_policy {
    maximum_backoff = "5s"
    minimum_backoff = "0s"
  }

  expiration_policy {
    ttl = ""
  }

  count = var.toggle_4583_5680_frontend ? 1 : 0

  topic = google_pubsub_topic.rmin_eagan_proxy_logs_topic[0].name
}

resource "google_pubsub_subscription" "rmin_subscriber_subscription_2_c" {
  ack_deadline_seconds    = "10"
  enable_message_ordering = "false"

  expiration_policy {
    ttl = ""
  }

  message_retention_duration = "604800s"
  name                       = "rmin-subscriber-subscription-2-c-${var.name_suffix}"
  project                    = var.project_id
  retain_acked_messages      = "false"
  topic                      = google_pubsub_topic.rmin_subscriber_topic_2_e.name
}

resource "google_pubsub_subscription" "rmin_subscriber_subscription_2_c_2" {
  ack_deadline_seconds       = "10"
  enable_message_ordering    = "false"
  message_retention_duration = "604800s"
  name                       = "rmin-subscriber-subscription-2-c-2-${var.name_suffix}"
  project                    = var.project_id
  retain_acked_messages      = "false"
  topic                      = google_pubsub_topic.rmin_subscriber_topic_2_e.name

  expiration_policy {
    ttl = ""
  }
}

resource "google_pubsub_subscription" "rmin_zip11subscribers_subscription_c" {
  project = var.project_id
  name    = "rmin-zip11subscribers-subscription-c-${var.name_suffix}"
  topic   = google_pubsub_topic.rmin_zip11subscribers_topic_c.name

  expiration_policy {
    ttl = ""
  }

  depends_on = [
    google_pubsub_topic.rmin_zip11subscribers_topic_c
  ]
}

resource "google_pubsub_subscription" "rmin_zip11subscribers_emailnotification_subscription_c" {
  project = var.project_id
  name    = "rmin-zip11subscribers-emailnotification-subscription-c-${var.name_suffix}"
  topic   = google_pubsub_topic.rmin_zip11subscribers_topic_c.name

  expiration_policy {
    ttl = ""
  }

  depends_on = [
    google_pubsub_topic.rmin_zip11subscribers_topic_c
  ]
}

resource "google_pubsub_subscription" "rmin_zip11subscribers_emailstatistics2_subscription_c" {
  project = var.project_id
  name    = "rmin-zip11subscribers-emailstatistics2-subscription-c-${var.name_suffix}"
  topic   = google_pubsub_topic.rmin_zip11subscribers_topic_c.name

  expiration_policy {
    ttl = ""
  }
  message_retention_duration = "604800s"

  depends_on = [
    google_pubsub_topic.rmin_zip11subscribers_topic_c
  ]
}

resource "google_pubsub_subscription" "rmin_zip5_done_mcr_subscription_c" {
  project = var.project_id
  name    = "rmin-zip5-done-mcr-subscription-c-${var.name_suffix}"
  topic   = google_pubsub_topic.rmin_zip5_done_topic_c.name
  filter  = "NOT hasPrefix(attributes.source, \"Sun\")"

  expiration_policy {
    ttl = ""
  }

  depends_on = [
    google_pubsub_topic.rmin_zip5_done_topic_c
  ]
}

resource "google_pubsub_subscription" "rmin_zip5_done_digest_subscriber_subscription_c" {
  project                    = var.project_id
  name                       = "rmin-zip5-done-digest-subscriber-subscription-c-${var.name_suffix}"
  topic                      = google_pubsub_topic.rmin_zip5_done_topic_c.name
  message_retention_duration = "604800s"
  ack_deadline_seconds       = 600

  expiration_policy {
    ttl = ""
  }

  depends_on = [
    google_pubsub_topic.rmin_zip5_done_topic_c
  ]
}

resource "google_pubsub_subscription" "rmin_email_topic_subscription_c" {
  project                    = var.project_id
  name                       = "rmin-email-topic-subscription-c-${var.name_suffix}"
  topic                      = google_pubsub_topic.rmin_email_topic_c.name
  message_retention_duration = "57600s"
  ack_deadline_seconds       = 600

  dead_letter_policy {
    dead_letter_topic     = google_pubsub_topic.rmin_email_dlt_topic_c.id
    max_delivery_attempts = 10
  }

  expiration_policy {
    ttl = ""
  }

  depends_on = [
    google_pubsub_topic.rmin_email_dlt_topic_c,
    google_pubsub_topic.rmin_email_topic_c
  ]

  push_config {
    push_endpoint = var.email_relay_cutover_url

    oidc_token {
      service_account_email = var.email_topic_sub_service_account_email
    }
  }
}

resource "google_pubsub_subscription" "rmin_email_dlt_subscription_c" {
  project                    = var.project_id
  name                       = "rmin-email-dlt-subscription-c-${var.name_suffix}"
  topic                      = google_pubsub_topic.rmin_email_dlt_topic_c.name
  message_retention_duration = "604800s"

  expiration_policy {
    ttl = ""
  }

  depends_on = [
    google_pubsub_topic.rmin_email_dlt_topic_c
  ]
}

resource "google_pubsub_subscription" "rmin_emailstatistics_subscription_c" {
  project                    = var.project_id
  name                       = "rmin-emailstatistics-subscription-c-${var.name_suffix}"
  topic                      = google_pubsub_topic.rmin_emailstatistics_topic_c.name
  message_retention_duration = "604800s"

  expiration_policy {
    ttl = ""
  }

  depends_on = [
    google_pubsub_topic.rmin_emailstatistics_topic_c
  ]
}

resource "google_pubsub_subscription" "rmin_cloud_reporting_sync_subscription_c" {
  project                    = var.project_id
  name                       = "rmin-cloud-reporting-sync-subscription-c-${var.name_suffix}"
  topic                      = google_pubsub_topic.rmin_emailstatistics_topic_c.name
  message_retention_duration = "604800s"

  dead_letter_policy {
    dead_letter_topic     = google_pubsub_topic.rmin_reportingsync_dlt_e.id
    max_delivery_attempts = "50"
  }

  retry_policy {
    maximum_backoff = "600s"
    minimum_backoff = "540s"
  }

  expiration_policy {
    ttl = ""
  }

  depends_on = [
    google_pubsub_topic.rmin_emailstatistics_topic_c,
    google_pubsub_topic.rmin_reportingsync_dlt_e
  ]
}

resource "google_pubsub_subscription" "rmin_po_campaign_reporting_subscription_c" {
  ack_deadline_seconds       = "10"
  enable_message_ordering    = "false"
  message_retention_duration = "604800s"
  name                       = "rmin-po-campaign-reporting-subscription-c-${var.name_suffix}"
  project                    = var.project_id
  retain_acked_messages      = "false"
  topic                      = google_pubsub_topic.rmin_po_campaign_reporting_topic_c[0].name

  expiration_policy {
    ttl = ""
  }

  count = var.toggle_4583_5668_price_change ? 1 : 0
}

resource "google_pubsub_subscription" "rmin_digest_click_event_subscription" {
  ack_deadline_seconds = "10"

  enable_message_ordering    = "false"
  message_retention_duration = "604800s"
  name                       = "rmin-digest-click-event-subscription-c-${var.name_suffix}"
  project                    = var.project_id
  retain_acked_messages      = "false"

  bigquery_config {
    drop_unknown_fields = "false"
    use_table_schema    = "false"
    use_topic_schema    = "true"
    write_metadata      = "false"
    table               = var.digest_click_logs_table_id
  }

  retry_policy {
    maximum_backoff = "600s"
    minimum_backoff = "15s"
  }

  expiration_policy {
    ttl = ""
  }

  topic = google_pubsub_topic.rmin_digest_click_event_topic[0].name

  depends_on = [
    google_pubsub_topic.rmin_digest_click_event_topic
  ]

  count = var.toggle_4583_5666_redesign_phase2 ? 1 : 0
}

resource "google_pubsub_subscription" "rmin_digest_open_logs_subscription_c" {
  ack_deadline_seconds = "10"

  enable_message_ordering    = "false"
  message_retention_duration = "604800s"
  name                       = "rmin-digest-open-logs-subscription-c-${var.name_suffix}"
  project                    = var.project_id
  retain_acked_messages      = "false"

  bigquery_config {
    drop_unknown_fields = "false"
    use_table_schema    = "false"
    use_topic_schema    = "true"
    write_metadata      = "false"
    table               = var.digest_open_logs_table_id
  }

  retry_policy {
    maximum_backoff = "600s"
    minimum_backoff = "15s"
  }

  expiration_policy {
    ttl = ""
  }

  topic = google_pubsub_topic.rmin_digest_open_logs_topic_c[0].name

  depends_on = [
    google_pubsub_topic.rmin_digest_open_logs_topic_c
  ]

  count = var.toggle_4583_xxxx_mc_reporting ? 1 : 0
}

resource "google_pubsub_subscription" "rmin_digest_opt_out_reason_subscription_c" {
  ack_deadline_seconds = "10"

  enable_message_ordering    = "false"
  message_retention_duration = "604800s"
  name                       = "rmin-digest-opt-out-reason-subscription-c-${var.name_suffix}"
  project                    = var.project_id
  retain_acked_messages      = "false"

  bigquery_config {
    drop_unknown_fields = "false"
    use_table_schema    = "false"
    use_topic_schema    = "true"
    write_metadata      = "false"
    table               = var.digest_opt_out_reason_table_id
  }

  retry_policy {
    maximum_backoff = "600s"
    minimum_backoff = "15s"
  }

  expiration_policy {
    ttl = ""
  }

  topic = google_pubsub_topic.rmin_digest_opt_out_reason_topic_c[0].name

  depends_on = [
    google_pubsub_topic.rmin_digest_opt_out_reason_topic_c
  ]

  count = var.toggle_4583_5681_consumer_portal ? 1 : 0
}

resource "google_pubsub_subscription" "rmin_subscriber_opt_in_settings_dlt_subscription_c" {
  ack_deadline_seconds = "10"

  enable_message_ordering    = "false"
  message_retention_duration = "604800s"
  name                       = "rmin-subscriber-opt-in-settings-dlt-subscription-c-${var.name_suffix}"
  project                    = var.project_id
  retain_acked_messages      = "false"

  bigquery_config {
    table               = var.subscriber_opt_in_settings_dlt_table_id
    use_topic_schema    = "true"
    use_table_schema    = "false"
    write_metadata      = "false"
    drop_unknown_fields = "true"
  }

  expiration_policy {
    ttl = ""
  }

  topic = google_pubsub_topic.rmin_subscriber_opt_in_settings_dlt_topic_c[0].name

  depends_on = [
    google_pubsub_topic.rmin_subscriber_opt_in_settings_dlt_topic_c
  ]

  count = var.toggle_4583_5680_frontend ? 1 : 0

}


resource "google_pubsub_subscription" "rmin_digest_tracking_errors_subscription" {
  ack_deadline_seconds = "10"

  enable_message_ordering    = "false"
  message_retention_duration = "604800s"
  name                       = "rmin-digest-tracking-errors-subscription-c-${var.name_suffix}"
  project                    = var.project_id
  retain_acked_messages      = "false"

  bigquery_config {
    drop_unknown_fields = "false"
    use_table_schema    = "false"
    use_topic_schema    = "true"
    write_metadata      = "false"
    table               = var.digest_tracking_errors_table_id
  }

  retry_policy {
    maximum_backoff = "600s"
    minimum_backoff = "15s"
  }

  expiration_policy {
    ttl = ""
  }

  topic = google_pubsub_topic.rmin_digest_tracking_errors_topic[0].name

  depends_on = [
    google_pubsub_topic.rmin_digest_tracking_errors_topic
  ]

  count = var.toggle_4583_5666_redesign_phase2 ? 1 : 0
}

resource "google_pubsub_subscription" "rmin_mc_click_logs_subscription_c" {
  ack_deadline_seconds       = "120"
  enable_message_ordering    = "false"
  message_retention_duration = "604800s"
  name                       = "rmin-mc-click-logs-subscription-c-${var.name_suffix}"
  project                    = var.project_id

  bigquery_config {
    table               = var.mc_click_logs_table_id
    use_topic_schema    = true
    write_metadata      = false
    drop_unknown_fields = true
  }

  retain_acked_messages = "false"

  retry_policy {
    maximum_backoff = "5s"
    minimum_backoff = "0s"
  }

  expiration_policy {
    ttl = ""
  }

  count = var.toggle_4583_5666_redesign_phase2 ? 1 : 0

  topic = google_pubsub_topic.rmin_mc_click_logs_topic_c[0].name
}

resource "google_pubsub_subscription" "rmin_inbound_package_sync_subscription_c" {
  ack_deadline_seconds       = "10"
  enable_message_ordering    = "false"
  message_retention_duration = "604800s"
  name                       = "rmin-inbound-package-data-sync-subscription-c-${var.name_suffix}"
  project                    = var.project_id
  retain_acked_messages      = "false"
  topic                      = google_pubsub_topic.rmin_inbound_package_sync_topic[0].name

  expiration_policy {
    ttl = ""
  }

  count = var.toggle_4583_5690_ptr2 ? 1 : 0
}

resource "google_pubsub_subscription" "rmin_mc_click_data_sync_subscription_c" {
  ack_deadline_seconds       = "10"
  enable_message_ordering    = "false"
  message_retention_duration = "604800s"
  name                       = "rmin-mc-click-data-sync-subscription-c-${var.name_suffix}"
  project                    = var.project_id
  retain_acked_messages      = "false"
  topic                      = google_pubsub_topic.rmin_mc_click_data_sync_topic[0].name

  expiration_policy {
    ttl = ""
  }

  count = var.toggle_4583_5681_consumer_portal ? 1 : 0
}

# [END google_pubsub_subscription]