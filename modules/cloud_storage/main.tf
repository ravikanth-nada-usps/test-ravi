# [START google_storage_bucket]

resource "google_storage_bucket" "rmin_campaign_bucket_e" {
  location                    = "US"
  name                        = "rmin-campaign-bucket-e-${var.name_suffix}"
  project                     = var.project_id
  requester_pays              = "false"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = "true"
  default_event_based_hold    = "false"
  force_destroy               = "false"

  soft_delete_policy {
    retention_duration_seconds = 0
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }

    condition {
      age                        = "5"
      created_before             = ""
      days_since_custom_time     = "0"
      days_since_noncurrent_time = "0"
      num_newer_versions         = "0"
      with_state                 = "ANY"
    }
  }

}

resource "google_storage_notification" "rmin_campaign_bucket_e_notification" {
  bucket         = "rmin-campaign-bucket-e-${var.name_suffix}"
  event_types    = ["OBJECT_FINALIZE"]
  payload_format = "JSON_API_V1"
  topic          = "//pubsub.googleapis.com/projects/${var.project_id}/topics/rmin-campaign-topic-e-${var.name_suffix}"

  depends_on = [
    google_storage_bucket.rmin_campaign_bucket_e
  ]
}

resource "google_storage_bucket" "rmin_campaign_csv_unzip_bucket_c" {
  location                    = "US"
  name                        = "rmin-campaign-csv-unzip-bucket-c-${var.name_suffix}"
  project                     = var.project_id
  requester_pays              = "false"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = "true"
  default_event_based_hold    = "false"
  force_destroy               = "false"

  soft_delete_policy {
    retention_duration_seconds = 0
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }

    condition {
      age                        = "5"
      created_before             = ""
      days_since_custom_time     = "0"
      days_since_noncurrent_time = "0"
      num_newer_versions         = "0"
      with_state                 = "ANY"
    }
  }

}

resource "google_storage_bucket" "rmin_campaign_csv_unzip_bucket_ext_c" {
  location                    = "US"
  name                        = "rmin-campaign-csv-unzip-bucket-ext-c-${var.name_suffix}"
  project                     = var.project_id
  requester_pays              = "false"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = "true"
  default_event_based_hold    = "false"
  force_destroy               = "false"

  soft_delete_policy {
    retention_duration_seconds = 0
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }

    condition {
      age                        = "5"
      created_before             = ""
      days_since_custom_time     = "0"
      days_since_noncurrent_time = "0"
      num_newer_versions         = "0"
      with_state                 = "ANY"
    }
  }

  count = var.toggle_4583_xxxx_ext_caches ? 1 : 0
}

resource "google_storage_bucket" "rmin_campaign_csv_unzip_bucket_e" {
  location                    = "US"
  name                        = "rmin-campaign-csv-unzip-bucket-e-${var.name_suffix}"
  project                     = var.project_id
  requester_pays              = "false"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = "true"
  default_event_based_hold    = "false"
  force_destroy               = "false"

  soft_delete_policy {
    retention_duration_seconds = 0
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }

    condition {
      age                        = "5"
      created_before             = ""
      days_since_custom_time     = "0"
      days_since_noncurrent_time = "0"
      num_newer_versions         = "0"
      with_state                 = "ANY"
    }
  }


}

resource "google_storage_bucket" "rmin_campaigndata_bucket_e" {
  default_event_based_hold    = "false"
  force_destroy               = "false"
  location                    = "US"
  name                        = "rmin-campaigndata-bucket-e-${var.name_suffix}"
  project                     = var.project_id
  requester_pays              = "false"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = "true"

  soft_delete_policy {
    retention_duration_seconds = 0
  }

}

resource "google_storage_bucket" "rmin_mail_campaigndata_bucket_c" {
  default_event_based_hold    = "false"
  force_destroy               = "false"
  location                    = "US"
  name                        = "rmin-mail-campaigndata-bucket-c-${var.name_suffix}"
  project                     = var.project_id
  requester_pays              = "false"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = "true"

  soft_delete_policy {
    retention_duration_seconds = 0
  }

}

resource "google_storage_bucket" "rmin_mail_campaigndata_bucket_ext_c" {
  default_event_based_hold    = "false"
  force_destroy               = "false"
  location                    = "US"
  name                        = "rmin-mail-campaigndata-bucket-ext-c-${var.name_suffix}"
  project                     = var.project_id
  requester_pays              = "false"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = "true"

  soft_delete_policy {
    retention_duration_seconds = 0
  }

  count = var.toggle_4583_xxxx_ext_caches ? 1 : 0
}

resource "google_storage_bucket" "rmin_package_campaigndata_bucket_c" {
  default_event_based_hold    = "false"
  force_destroy               = "false"
  location                    = "US"
  name                        = "rmin-package-campaigndata-bucket-c-${var.name_suffix}"
  project                     = var.project_id
  requester_pays              = "false"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = "true"

  soft_delete_policy {
    retention_duration_seconds = 0
  }

}

resource "google_storage_bucket" "rmin_package_campaigndata_bucket_ext_c" {
  default_event_based_hold    = "false"
  force_destroy               = "false"
  location                    = "US"
  name                        = "rmin-package-campaigndata-bucket-ext-c-${var.name_suffix}"
  project                     = var.project_id
  requester_pays              = "false"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = "true"

  soft_delete_policy {
    retention_duration_seconds = 0
  }

  count = var.toggle_4583_xxxx_ext_caches ? 1 : 0
}

resource "google_storage_bucket" "rmin_rawfile_bucket_e" {
  location                    = "US"
  name                        = "rmin-rawfile-bucket-e-${var.name_suffix}"
  project                     = var.project_id
  requester_pays              = "false"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = "true"
  default_event_based_hold    = "false"
  force_destroy               = "false"

  soft_delete_policy {
    retention_duration_seconds = 0
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }

    condition {
      age                        = "5"
      created_before             = ""
      days_since_custom_time     = "0"
      days_since_noncurrent_time = "0"
      num_newer_versions         = "0"
      with_state                 = "ANY"
    }
  }

}

resource "google_storage_notification" "rmin_rawfile_bucket_e_notification" {
  bucket         = "rmin-rawfile-bucket-e-${var.name_suffix}"
  event_types    = ["OBJECT_FINALIZE"]
  payload_format = "JSON_API_V1"
  topic          = "//pubsub.googleapis.com/projects/${var.project_id}/topics/rmin-rawfile-topic-e-${var.name_suffix}"

  depends_on = [
    google_storage_bucket.rmin_rawfile_bucket_e
  ]
}


resource "google_storage_bucket" "rmin_subscriber_bucket_2_e" {
  location                    = "US"
  name                        = "rmin-subscriber-bucket-2-e-${var.name_suffix}"
  project                     = var.project_id
  requester_pays              = "false"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = "true"
  default_event_based_hold    = "false"
  force_destroy               = "false"

  soft_delete_policy {
    retention_duration_seconds = 0
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }

    condition {
      age                        = "5"
      created_before             = ""
      days_since_custom_time     = "0"
      days_since_noncurrent_time = "0"
      num_newer_versions         = "0"
      with_state                 = "ANY"
    }
  }
}

resource "google_storage_notification" "rmin_subscriber_bucket_2_e_notification" {
  bucket         = "rmin-subscriber-bucket-2-e-${var.name_suffix}"
  event_types    = ["OBJECT_FINALIZE"]
  payload_format = "JSON_API_V1"
  topic          = "//pubsub.googleapis.com/projects/${var.project_id}/topics/rmin-subscriber-topic-2-e-${var.name_suffix}"

  depends_on = [
    google_storage_bucket.rmin_subscriber_bucket_2_e
  ]
}


resource "google_storage_bucket" "rmin_subscriber_bucket_e" {
  location                    = "US"
  name                        = "rmin-subscriber-bucket-e-${var.name_suffix}"
  project                     = var.project_id
  requester_pays              = "false"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = "true"
  default_event_based_hold    = "false"
  force_destroy               = "false"

  soft_delete_policy {
    retention_duration_seconds = 0
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }

    condition {
      age                        = "5"
      created_before             = ""
      days_since_custom_time     = "0"
      days_since_noncurrent_time = "0"
      num_newer_versions         = "0"
      with_state                 = "ANY"
    }
  }
}

# resource "google_storage_notification" "rmin_subscriber_bucket_e_notification" {
# bucket         = "rmin-subscriber-bucket-e-${var.name_suffix}"
# event_types    = ["OBJECT_FINALIZE"]
# payload_format = "JSON_API_V1"
# topic          = "//pubsub.googleapis.com/projects/${var.project_id}/topics/rmin-subscriber-topic-e-${var.name_suffix}"

# depends_on = [
# google_storage_bucket.rmin_subscriber_bucket_e
# ]
# }

resource "google_storage_bucket" "rmin_subscriber_csv_unzip_bucket_2_e" {
  location                    = "US"
  name                        = "rmin-subscriber-csv-unzip-bucket-2-e-${var.name_suffix}"
  project                     = var.project_id
  requester_pays              = "false"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = "true"
  default_event_based_hold    = "false"
  force_destroy               = "false"

  soft_delete_policy {
    retention_duration_seconds = 0
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }

    condition {
      age                        = "5"
      created_before             = ""
      days_since_custom_time     = "0"
      days_since_noncurrent_time = "0"
      num_newer_versions         = "0"
      with_state                 = "ANY"
    }
  }
}

resource "google_storage_bucket" "rmin_subscriber_csv_unzip_bucket_e" {
  location                    = "US"
  name                        = "rmin-subscriber-csv-unzip-bucket-e-${var.name_suffix}"
  project                     = var.project_id
  requester_pays              = "false"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = "true"
  default_event_based_hold    = "false"
  force_destroy               = "false"

  soft_delete_policy {
    retention_duration_seconds = 0
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }

    condition {
      age                        = "5"
      created_before             = ""
      days_since_custom_time     = "0"
      days_since_noncurrent_time = "0"
      num_newer_versions         = "0"
      with_state                 = "ANY"
    }
  }
}

resource "google_storage_bucket" "rmin_subscriberdropbox_bucket_e" {
  location                    = "US"
  name                        = "rmin-subscriberdropbox-bucket-e-${var.name_suffix}"
  project                     = var.project_id
  requester_pays              = "false"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = "true"
  default_event_based_hold    = "false"
  force_destroy               = "false"

  soft_delete_policy {
    retention_duration_seconds = 0
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }

    condition {
      age                        = "15"
      created_before             = ""
      days_since_custom_time     = "0"
      days_since_noncurrent_time = "0"
      num_newer_versions         = "0"
      with_state                 = "ANY"
    }
  }
}

resource "google_storage_bucket" "rmin_subscriberdropbox_bucket_e_2" {
  location                    = "US"
  name                        = "rmin-subscriberdropbox-bucket-e-2-${var.name_suffix}"
  project                     = var.project_id
  requester_pays              = "false"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = "true"
  default_event_based_hold    = "false"
  force_destroy               = "false"

  soft_delete_policy {
    retention_duration_seconds = 0
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }

    condition {
      age                        = "10"
      created_before             = ""
      days_since_custom_time     = "0"
      days_since_noncurrent_time = "0"
      num_newer_versions         = "0"
      with_state                 = "ANY"
    }
  }
}

resource "google_storage_bucket" "rmin_template_bucket_e" {
  default_event_based_hold    = "false"
  force_destroy               = "false"
  location                    = "US"
  name                        = "rmin-template-bucket-e-${var.name_suffix}"
  project                     = var.project_id
  requester_pays              = "false"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = "true"

  soft_delete_policy {
    retention_duration_seconds = 0
  }
}

resource "google_storage_bucket" "rmin_qr_code_bucket_c" {
  name                        = "rmin-qr-code-bucket-c-${var.name_suffix}"
  project                     = var.project_id
  location                    = "US"
  default_event_based_hold    = "false"
  force_destroy               = "false"
  requester_pays              = "false"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = "true"

  soft_delete_policy {
    retention_duration_seconds = 0
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age                        = 15
      created_before             = ""
      days_since_custom_time     = "0"
      days_since_noncurrent_time = "0"
      num_newer_versions         = "0"
      with_state                 = "ANY"
    }
  }
}

resource "google_storage_bucket" "rmin_subscriber_email_csv_unzip_bucket_c" {
  name                        = "rmin-subscriber-email-csv-unzip-bucket-c-${var.name_suffix}"
  project                     = var.project_id
  location                    = "US"
  default_event_based_hold    = "false"
  force_destroy               = "false"
  requester_pays              = "false"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = "true"

  soft_delete_policy {
    retention_duration_seconds = 0
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age                        = 5
      created_before             = ""
      days_since_custom_time     = "0"
      days_since_noncurrent_time = "0"
      num_newer_versions         = "0"
      with_state                 = "ANY"
    }
  }
}

resource "google_storage_bucket" "rmin_mics_extract_bucket_c" {
  location                    = "US"
  name                        = "rmin-mics-extract-bucket-c-${var.name_suffix}"
  project                     = var.project_id
  requester_pays              = "false"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = "true"
  default_event_based_hold    = "false"
  force_destroy               = "false"

  soft_delete_policy {
    retention_duration_seconds = 0
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }

    condition {
      age                        = "5"
      created_before             = ""
      days_since_custom_time     = "0"
      days_since_noncurrent_time = "0"
      num_newer_versions         = "0"
      with_state                 = "ANY"
    }
  }

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0
}

resource "google_storage_notification" "rmin_mics_extract_bucket_notification" {
  bucket         = google_storage_bucket.rmin_mics_extract_bucket_c[0].name
  event_types    = ["OBJECT_FINALIZE"]
  payload_format = "JSON_API_V1"
  topic          = var.mics_extract_file_upload_topic_name

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0
}

resource "google_storage_bucket" "rmin_temp_cache_backup" {
  default_event_based_hold    = "false"
  force_destroy               = "false"
  location                    = "US"
  name                        = "rmin-temp-cache-backup-${var.name_suffix}"
  project                     = var.project_id
  requester_pays              = "false"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = "true"

  soft_delete_policy {
    retention_duration_seconds = 0
  }
}
resource "google_storage_bucket" "rmin_global_elements_bucket_c" {
  default_event_based_hold    = "false"
  force_destroy               = "false"
  location                    = "US"
  name                        = "rmin-global-elements-bucket-c-${var.name_suffix}"
  project                     = var.project_id
  requester_pays              = "false"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = "true"

  soft_delete_policy {
    retention_duration_seconds = 0
  }

  count = var.toggle_4583_5681_consumer_portal ? 1 : 0
}

resource "google_storage_bucket" "rmin_mdn_file_bucket_c" {
  location                    = "US"
  name                        = "rmin-mdn-file-bucket-c-${var.name_suffix}"
  project                     = var.project_id
  requester_pays              = "false"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = "true"
  default_event_based_hold    = "false"
  force_destroy               = "false"

  soft_delete_policy {
    retention_duration_seconds = 0
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }

    condition {
      age                        = "7"
      created_before             = ""
      days_since_custom_time     = "0"
      days_since_noncurrent_time = "0"
      num_newer_versions         = "0"
      with_state                 = "ANY"
    }
  }

  count = var.toggle_4583_5708_mdn_to_eng ? 1 : 0
}

resource "google_storage_bucket" "rmin_mdn_temp_bucket_c" {
  location                    = "US"
  name                        = "rmin-mdn-temp-bucket-c-${var.name_suffix}"
  project                     = var.project_id
  requester_pays              = "false"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = "true"
  default_event_based_hold    = "false"
  force_destroy               = "false"

  soft_delete_policy {
    retention_duration_seconds = 0
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }

    condition {
      age                        = "7"
      created_before             = ""
      days_since_custom_time     = "0"
      days_since_noncurrent_time = "0"
      num_newer_versions         = "0"
      with_state                 = "ANY"
    }
  }

  count = var.toggle_4583_5708_mdn_to_eng ? 1 : 0
}

resource "google_storage_bucket" "rmin_redis_export_backup_bucket_e" {
  location                    = var.rmin_redis_export_backup_bucket_e_location_invar
  name                        = "rmin-redis-export-backup-e-${var.name_suffix}"
  project                     = var.project_id
  requester_pays              = "false"
  storage_class               = var.rmin_redis_export_backup_bucket_e_storage_class_invar
  uniform_bucket_level_access = "true"
  default_event_based_hold    = "false"
  force_destroy               = "false"

  soft_delete_policy {
    retention_duration_seconds = 0
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }

    condition {
      days_since_noncurrent_time = var.rmin_bigquery_export_backup_bucket_e_lifecycle_rule_condition_age_invar
    }
  }

  versioning {
	enabled = "true"
  }
  
  count = var.toggle_4583_5717_rmin_backup_invar ? 1 : 0
}

resource "google_storage_bucket" "rmin_bigquery_export_backup_bucket_e" {
  location                    = var.rmin_bigquery_export_backup_bucket_e_location_invar
  name                        = "rmin-bigquery-export-backup-e-${var.name_suffix}"
  project                     = var.project_id
  requester_pays              = "false"
  storage_class               = var.rmin_bigquery_export_backup_bucket_e_storage_class_invar
  uniform_bucket_level_access = "true"
  default_event_based_hold    = "false"
  force_destroy               = "false"

  soft_delete_policy {
    retention_duration_seconds = 0
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }

    condition {
      days_since_noncurrent_time = var.rmin_bigquery_export_backup_bucket_e_lifecycle_rule_condition_age_invar
    }
  }
  
  versioning {
	enabled = "true"
  }

  count = var.toggle_4583_5717_rmin_backup_invar ? 1 : 0
}

# [END google_storage_bucket]
