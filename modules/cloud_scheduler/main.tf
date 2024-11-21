# [START google_cloud_scheduler_job]

resource "google_cloud_scheduler_job" "rmin_cloud_mdn_eng_feed" {
  name    = "rmin-cloud-mdn-eng-feed"
  project = var.project_id
  region  = "us-central1"
  count   = var.toggle_4583_5708_mdn_to_eng ? 1 : 0

  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "16"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "2"
  }

  schedule         = var.mdn_eng_feed_schedule
  paused           = var.name_suffix == "000p" ? false : true
  time_zone        = "America/New_York"
  attempt_deadline = "600s"

  http_target {

    http_method = "POST"

    body = base64encode(<<EOT
    {
        "launchParameter": {
            "jobName": "rmin-cloud-mdn-eng-feed",
            "containerSpecGcsPath": "gs://rmin-template-bucket-e-000r/templates/flex/rmin-cloud-mdn-eng-feed-v${var.mdn_eng_feed_version}.json",
            "parameters": {
                "mdnNumShards": "${var.mdn_eng_feed_num_shard}",
				"mdnTempBucket": "gs://${var.mdn_eng_feed_temp_bucket}/",
                "bigQueryDatabase": "${var.mdn_eng_feed_database}",
                "mdnEngLoggingTable": "${var.mdn_eng_feed_table}",
                "subscriberFirestore": "${var.mdn_eng_feed_firestore_subscribers}"
            },
            "environment": {
                "ipConfiguration": "WORKER_IP_PRIVATE",
                "stagingLocation": "gs://${var.rmin_template_bucket}/staging",
                "maxWorkers": ${var.mdn_eng_feed_workers},
                "serviceAccountEmail": "${var.mdn_eng_feed_sa_email}",
                "subnetwork": "${var.mdn_eng_feed_subnetwork}",
                "tempLocation": "gs://${var.rmin_template_bucket}/staging"
            }
        }
    }
    EOT
    )

    oauth_token {
      scope                 = "https://www.googleapis.com/auth/cloud-platform"
      service_account_email = var.mdn_eng_feed_sa_email
    }

    uri = "https://dataflow.googleapis.com/v1b3/projects/${var.project_id}/locations/us-central1/flexTemplates:launch"
  }
}

resource "google_cloud_scheduler_job" "rmin_cloud_sunday_digest_central" {

  for_each = var.timezone_list

  name    = "rmin-cloud-sunday-digest-${each.value.scheduler_name_suffix}"
  project = var.project_id
  region  = "us-central1"

  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "16"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "0"
  }

  schedule         = var.sunday_digest_schedule
  time_zone        = each.value.gcloud_tz
  attempt_deadline = "180s"

  http_target {

    http_method = "POST"

    body = base64encode(<<EOT
    {
        "launchParameter": {
            "jobName": "scheduled-sunday-digest-${each.value.msg_body_job_zone_name}",
            "containerSpecGcsPath": "gs://rmin-template-bucket-e-000r/templates/flex/rmin-cloud-sunday-digest-v${var.sunday_digest_cloud_run_version_central}.json",
            "parameters": {
                "topicName": "projects/${var.project_id}/topics/${var.sunday_digest_topic_name_central}",
                "errorTopic": "projects/${var.project_id}/topics/${var.sunday_digest_error_topic}",
                "subscriberDropboxBucket": "${var.sunday_digest_sub_drop_bucket}",
                "database": "${var.sunday_digest_database}",
                "loggingTable": "${var.sunday_digest_logging_table}",
                "zip5TimezoneTable": "ZIP5_TIMEZONE",
                "zip5Timezone": "${each.value.zip5_tz}"
            },
            "environment": {
                "ipConfiguration": "WORKER_IP_PRIVATE",
                "stagingLocation": "gs://${var.rmin_template_bucket}/staging",
                "maxWorkers": ${var.sunday_digest_max_workers},
                "serviceAccountEmail": "${var.sunday_digest_sa_email}",
                "subnetwork": "${var.sunday_digest_subnetwork_central}",
                "tempLocation": "gs://${var.rmin_template_bucket}/staging"
            }
        }
    }
    EOT
    )

    oauth_token {
      scope                 = "https://www.googleapis.com/auth/cloud-platform"
      service_account_email = var.sunday_digest_sa_email
    }

    uri = "https://dataflow.googleapis.com/v1b3/projects/${var.project_id}/locations/us-central1/flexTemplates:launch"
  }

}

resource "google_cloud_scheduler_job" "run_partman_c" {
  attempt_deadline = var.run_partman_c_attempt_deadline
  description      = "Scheduled job to trigger cloud function to run partman maintenance proc"

  http_target {
    http_method = "POST"

    oidc_token {
      audience              = var.run_partman_c_func_url
      service_account_email = var.run_partman_c_sa_email
    }

    uri = var.run_partman_c_func_url
  }

  name    = "run-partman-c"
  project = var.project_id
  region  = "us-central1"

  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "5"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "0"
  }

  schedule  = var.run_partman_c_schedule
  time_zone = "America/New_York"
}

resource "google_cloud_scheduler_job" "run_partman_digest" {
  attempt_deadline = var.run_partman_digest_attempt_deadline
  description      = "Scheduled job to trigger cloud function to run partman maintenance proc"

  http_target {
    http_method = "POST"

    oidc_token {
      audience              = var.run_partman_digest_func_url
      service_account_email = var.run_partman_digest_sa_email
    }

    uri = var.run_partman_digest_func_url
  }

  name    = "run-partman-digest"
  project = var.project_id
  region  = "us-central1"

  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "5"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "0"
  }

  schedule  = var.run_partman_digest_schedule
  time_zone = "America/New_York"
}

resource "google_cloud_scheduler_job" "run_zip5_timezone_c" {
  attempt_deadline = var.run_zip5_timezone_c_attempt_deadline
  description      = "Run zip5 timezone function in us-central1"

  http_target {
    http_method = "POST"

    oidc_token {
      audience              = var.run_zip5_timezone_c_func_url
      service_account_email = var.run_zip5_timezone_c_sa_email
    }

    uri = var.run_zip5_timezone_c_func_url
  }

  name    = "run-zip5-timezone-c"
  project = var.project_id
  region  = "us-central1"

  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "16"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "0"
  }

  schedule  = var.run_zip5_timezone_c_schedule
  time_zone = "America/New_York"
}


resource "google_cloud_scheduler_job" "rmin_gcr_pruner" {

  paused           = var.rmin_gcr_pruner_paused
  attempt_deadline = var.rmin_gcr_pruner_attempt_deadline

  http_target {
    http_method = "GET"

    oidc_token {
      audience              = var.rmin_gcr_pruner_cloud_run_url
      service_account_email = var.rmin_gcr_pruner_sa_email
    }

    uri = var.rmin_gcr_pruner_cloud_run_url
  }

  name    = "rmin-gcr-pruner"
  project = var.project_id
  region  = "us-east4"

  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "16"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "0"
  }

  schedule  = var.rmin_gcr_pruner_schedule
  time_zone = "America/New_York"
}


resource "google_cloud_scheduler_job" "rmin_report_email_completion_tz" {

  name             = "rmin-report-email-completion-tz"
  project          = var.project_id
  region           = "us-east4"
  attempt_deadline = "180s"

  http_target {
    http_method = "GET"

    oidc_token {
      audience              = var.rmin_report_email_completion_tz_cloud_run_url
      service_account_email = var.rmin_report_email_completion_tz_sa_email
    }

    uri = "${var.rmin_report_email_completion_tz_cloud_run_url}/"
  }

  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "16"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "0"
  }

  schedule  = var.rmin_report_email_completion_tz_schedule
  time_zone = "America/New_York"
}

resource "google_cloud_scheduler_job" "rmin_report_email_sla_timezone_sunday" {

  name             = "rmin-report-email-sla-timezone-sunday"
  project          = var.project_id
  region           = "us-east4"
  attempt_deadline = "180s"

  http_target {
    http_method = "GET"

    oidc_token {
      audience              = var.rmin_report_email_sla_timezone_sunday_cloud_run_url
      service_account_email = var.rmin_report_email_sla_timezone_sunday_sa_email
    }

    uri = "${var.rmin_report_email_sla_timezone_sunday_cloud_run_url}/"
  }

  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "16"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "0"
  }

  schedule  = var.rmin_report_email_sla_timezone_sunday_schedule
  time_zone = "America/New_York"
}

resource "google_cloud_scheduler_job" "rmin_report_file_and_email_sla_timezone" {

  name             = "rmin-report-file-and-email-sla-timezone"
  project          = var.project_id
  region           = "us-east4"
  attempt_deadline = "900s"

  http_target {
    http_method = "GET"

    oidc_token {
      audience              = var.rmin_report_file_and_email_sla_timezone_cloud_run_url
      service_account_email = var.rmin_report_file_and_email_sla_timezone_sa_email
    }

    uri = "${var.rmin_report_file_and_email_sla_timezone_cloud_run_url}/"
  }

  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "16"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "0"
  }

  schedule  = var.rmin_report_file_and_email_sla_timezone_schedule
  time_zone = "America/New_York"
}

resource "google_cloud_scheduler_job" "rmin_report_missing_emails" {

  name             = "rmin-report-missing-emails"
  project          = var.project_id
  region           = "us-east4"
  attempt_deadline = "900s"

  http_target {
    http_method = "GET"

    oidc_token {
      audience              = var.rmin_report_missing_emails_cloud_run_url
      service_account_email = var.rmin_report_missing_emails_sa_email
    }

    uri = "${var.rmin_report_missing_emails_cloud_run_url}/"
  }

  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "16"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "0"
  }

  schedule  = var.rmin_report_missing_emails_schedule
  time_zone = "America/New_York"
}

resource "google_cloud_scheduler_job" "rmin_report_processing_volumes" {

  name             = "rmin-report-processing-volumes"
  project          = var.project_id
  region           = "us-east4"
  attempt_deadline = "180s"

  http_target {
    http_method = "GET"

    oidc_token {
      audience              = var.rmin_report_processing_volumes_cloud_run_url
      service_account_email = var.rmin_report_processing_volumes_sa_email
    }

    uri = "${var.rmin_report_processing_volumes_cloud_run_url}/"
  }

  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "16"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "0"
  }

  schedule  = var.rmin_report_processing_volumes_schedule
  time_zone = "America/New_York"
}

resource "google_cloud_scheduler_job" "rmin_report_zip5_email_processing_time" {

  name             = "rmin-report-zip5-email-processing-time"
  project          = var.project_id
  region           = "us-east4"
  attempt_deadline = "180s"

  http_target {
    http_method = "GET"

    oidc_token {
      audience              = var.rmin_report_zip5_email_processing_time_cloud_run_url
      service_account_email = var.rmin_report_zip5_email_processing_time_sa_email
    }

    uri = "${var.rmin_report_zip5_email_processing_time_cloud_run_url}/"
  }

  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "16"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "0"
  }

  schedule  = var.rmin_report_zip5_email_processing_time_schedule
  time_zone = "America/New_York"
}

resource "google_cloud_scheduler_job" "rmin_mics_extract_trigger_eastern" {

  name    = "rmin-cloud-mics-extract-Eastern"
  project = var.project_id
  region  = "us-central1"
  paused  = true

  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "16"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "2"
  }

  schedule         = var.rmin_mics_extract_trigger_schedule
  time_zone        = "America/New_York"
  attempt_deadline = "600s"

  description = "Mics Extract Trigger Cloud Scheduler Eastern"

  http_target {
    http_method = "POST"
    body        = base64encode("US/Eastern")
    oidc_token {
      audience              = var.rmin_mics_extract_trigger_func_url
      service_account_email = var.rmin_mics_extract_trigger_sa_email
    }

    uri = var.rmin_mics_extract_trigger_func_url
  }

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0
}

resource "google_cloud_scheduler_job" "rmin_mics_extract_trigger_central" {

  name    = "rmin-cloud-mics-extract-Central"
  project = var.project_id
  region  = "us-central1"
  paused  = true

  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "16"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "2"
  }

  schedule         = var.rmin_mics_extract_trigger_schedule
  time_zone        = "America/Chicago"
  attempt_deadline = "600s"

  description = "Mics Extract Trigger Cloud Scheduler Central"

  http_target {
    http_method = "POST"
    body        = base64encode("US/Central")
    oidc_token {
      audience              = var.rmin_mics_extract_trigger_func_url
      service_account_email = var.rmin_mics_extract_trigger_sa_email
    }

    uri = var.rmin_mics_extract_trigger_func_url
  }

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0
}

resource "google_cloud_scheduler_job" "rmin_mics_extract_trigger_arizona" {

  name    = "rmin-cloud-mics-extract-Arizona"
  project = var.project_id
  region  = "us-central1"
  paused  = true

  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "16"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "2"
  }

  schedule         = var.rmin_mics_extract_trigger_schedule
  time_zone        = "America/Phoenix"
  attempt_deadline = "600s"

  description = "Mics Extract Trigger Cloud Scheduler Arizona"

  http_target {
    http_method = "POST"
    body        = base64encode("US/Arizona")
    oidc_token {
      audience              = var.rmin_mics_extract_trigger_func_url
      service_account_email = var.rmin_mics_extract_trigger_sa_email
    }

    uri = var.rmin_mics_extract_trigger_func_url
  }

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0
}

resource "google_cloud_scheduler_job" "rmin_mics_extract_trigger_mountain" {

  name    = "rmin-cloud-mics-extract-Mountain"
  project = var.project_id
  region  = "us-central1"
  paused  = true

  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "16"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "2"
  }

  schedule         = var.rmin_mics_extract_trigger_schedule
  time_zone        = "America/Denver"
  attempt_deadline = "600s"

  description = "Mics Extract Trigger Cloud Scheduler Mountain"

  http_target {
    http_method = "POST"
    body        = base64encode("US/Mountain")
    oidc_token {
      audience              = var.rmin_mics_extract_trigger_func_url
      service_account_email = var.rmin_mics_extract_trigger_sa_email
    }

    uri = var.rmin_mics_extract_trigger_func_url
  }

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0
}

resource "google_cloud_scheduler_job" "rmin_mics_extract_trigger_pacific" {

  name    = "rmin-cloud-mics-extract-Pacific"
  project = var.project_id
  region  = "us-central1"
  paused  = true

  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "16"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "2"
  }

  schedule         = var.rmin_mics_extract_trigger_schedule
  time_zone        = "America/Los_Angeles"
  attempt_deadline = "600s"

  description = "Mics Extract Trigger Cloud Scheduler Pacific"

  http_target {
    http_method = "POST"
    body        = base64encode("US/Pacific")
    oidc_token {
      audience              = var.rmin_mics_extract_trigger_func_url
      service_account_email = var.rmin_mics_extract_trigger_sa_email
    }

    uri = var.rmin_mics_extract_trigger_func_url
  }

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0
}

resource "google_cloud_scheduler_job" "rmin_mics_extract_trigger_alaska" {

  name    = "rmin-cloud-mics-extract-Alaska"
  project = var.project_id
  region  = "us-central1"
  paused  = true

  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "16"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "2"
  }

  schedule         = var.rmin_mics_extract_trigger_schedule
  time_zone        = "America/Juneau"
  attempt_deadline = "600s"

  description = "Mics Extract Trigger Cloud Scheduler Alaska"

  http_target {
    http_method = "POST"
    body        = base64encode("US/Alaska")
    oidc_token {
      audience              = var.rmin_mics_extract_trigger_func_url
      service_account_email = var.rmin_mics_extract_trigger_sa_email
    }

    uri = var.rmin_mics_extract_trigger_func_url
  }

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0
}

resource "google_cloud_scheduler_job" "rmin_mics_extract_trigger_hawaii" {

  name    = "rmin-cloud-mics-extract-Hawaii"
  project = var.project_id
  region  = "us-central1"
  paused  = true

  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "16"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "2"
  }

  schedule         = var.rmin_mics_extract_trigger_schedule
  time_zone        = "Pacific/Honolulu"
  attempt_deadline = "600s"

  description = "Mics Extract Trigger Cloud Scheduler Hawaii"

  http_target {
    http_method = "POST"
    body        = base64encode("US/Hawaii")
    oidc_token {
      audience              = var.rmin_mics_extract_trigger_func_url
      service_account_email = var.rmin_mics_extract_trigger_sa_email
    }

    uri = var.rmin_mics_extract_trigger_func_url
  }

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0
}

resource "google_cloud_scheduler_job" "rmin_mics_extract_trigger_puerto_rico" {

  name    = "rmin-cloud-mics-extract-Puerto-Rico"
  project = var.project_id
  region  = "us-central1"
  paused  = true

  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "16"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "2"
  }

  schedule         = var.rmin_mics_extract_trigger_schedule
  time_zone        = "America/Puerto_Rico"
  attempt_deadline = "600s"

  description = "Mics Extract Trigger Cloud Scheduler Puerto Rico"

  http_target {
    http_method = "POST"
    body        = base64encode("America/Puerto_Rico")

    oidc_token {
      audience              = var.rmin_mics_extract_trigger_func_url
      service_account_email = var.rmin_mics_extract_trigger_sa_email
    }

    uri = var.rmin_mics_extract_trigger_func_url
  }

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0
}

resource "google_cloud_scheduler_job" "rmin-cloud-subscriber-cache-refresh" {
  name    = "rmin-cloud-subscriber-cache-refresh"
  project = var.project_id
  region  = "us-central1"
  count   = var.toggle_4583_1111_subscriber_services ? 1 : 0

  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "16"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "2"
  }

  schedule         = var.cache_refresh_schedule
  paused           = true
  time_zone        = "America/New_York"
  attempt_deadline = "600s"

  http_target {

    http_method = "POST"

    body = base64encode(<<EOT
    {
        "launchParameter": {
            "jobName": "rmin-cloud-subscriber-cache-refresh",
            "containerSpecGcsPath": "gs://rmin-template-bucket-e-000r/templates/flex/rmin-cloud-subscriber-cache-refresh-v${var.cache_refresh_version}.json",
            "parameters": {
                "emailCacheHost": "${var.subscriber_email_cache_redishost}",
                "subscriberCacheHost": "${var.subscriber_cache_redishost}",
                "redisMaxTotal": "${var.cache_refresh_redis_max_conn}",
                "redisMaxIdle": "${var.cache_refresh_redis_max_idle}",
                "redisMinIdle": "${var.cache_refresh_redis_min_idle}",
                "redisMaxWaitMillis": "${var.cache_refresh_redis_max_wait_millis}",
                "redisTimeoutMillis": "${var.cache_refresh_redis_timeout_millis}",
                "toggleEmailCacheWrites": "false",
                "toggleSubscriberCacheWrites": "true",
                "togglePurgeCache": "false",
                "partitionCount": "${var.cache_refresh_partition_count}"
            },
            "environment": {
                "ipConfiguration": "WORKER_IP_PRIVATE",
                "stagingLocation": "gs://${var.rmin_template_bucket}/staging",
                "maxWorkers": ${var.cache_refresh_max_workers},
                "serviceAccountEmail": "${var.cache_refresh_sa_email}",
                "subnetwork": "${var.cache_refresh_subnetwork}",
                "tempLocation": "gs://${var.rmin_template_bucket}/staging"
            }
        }
    }
    EOT
    )

    oauth_token {
      scope                 = "https://www.googleapis.com/auth/cloud-platform"
      service_account_email = var.cache_refresh_sa_email
    }

    uri = "https://dataflow.googleapis.com/v1b3/projects/${var.project_id}/locations/us-central1/flexTemplates:launch"
  }
}

resource "google_cloud_scheduler_job" "rmin-cloud-subscriber-cache-purge-refresh" {
  name    = "rmin-cloud-subscriber-cache-purge-refresh"
  project = var.project_id
  region  = "us-central1"
  count   = var.toggle_4583_1111_subscriber_services ? 1 : 0

  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "16"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "2"
  }

  schedule         = var.cache_refresh_schedule
  paused           = true
  time_zone        = "America/New_York"
  attempt_deadline = "600s"

  http_target {

    http_method = "POST"

    body = base64encode(<<EOT
    {
        "launchParameter": {
            "jobName": "rmin-cloud-subscriber-cache-purge-refresh",
            "containerSpecGcsPath": "gs://rmin-template-bucket-e-000r/templates/flex/rmin-cloud-subscriber-cache-refresh-v${var.cache_refresh_version}.json",
            "parameters": {
                "emailCacheHost": "${var.subscriber_email_cache_redishost}",
                "subscriberCacheHost": "${var.subscriber_cache_redishost}",
                "redisMaxTotal": "${var.cache_refresh_redis_max_conn}",
                "redisMaxIdle": "${var.cache_refresh_redis_max_idle}",
                "redisMinIdle": "${var.cache_refresh_redis_min_idle}",
                "redisMaxWaitMillis": "${var.cache_refresh_redis_max_wait_millis}",
                "redisTimeoutMillis": "${var.cache_refresh_redis_timeout_millis}",
                "toggleEmailCacheWrites": "false",
                "toggleSubscriberCacheWrites": "true",
                "togglePurgeCache": "true",
                "partitionCount": "${var.cache_refresh_partition_count}"
            },
            "environment": {
                "ipConfiguration": "WORKER_IP_PRIVATE",
                "stagingLocation": "gs://${var.rmin_template_bucket}/staging",
                "maxWorkers": ${var.cache_refresh_max_workers},
                "serviceAccountEmail": "${var.cache_refresh_sa_email}",
                "subnetwork": "${var.cache_refresh_subnetwork}",
                "tempLocation": "gs://${var.rmin_template_bucket}/staging"
            }
        }
    }
    EOT
    )

    oauth_token {
      scope                 = "https://www.googleapis.com/auth/cloud-platform"
      service_account_email = var.cache_refresh_sa_email
    }

    uri = "https://dataflow.googleapis.com/v1b3/projects/${var.project_id}/locations/us-central1/flexTemplates:launch"
  }
}

resource "google_cloud_scheduler_job" "rmin-cloud-email-cache-refresh" {
  name    = "rmin-cloud-email-cache-refresh"
  project = var.project_id
  region  = "us-central1"
  count   = var.toggle_4583_1111_subscriber_services ? 1 : 0

  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "16"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "2"
  }

  schedule         = var.cache_refresh_schedule
  paused           = true
  time_zone        = "America/New_York"
  attempt_deadline = "600s"

  http_target {

    http_method = "POST"

    body = base64encode(<<EOT
    {
        "launchParameter": {
            "jobName": "rmin-cloud-email-cache-refresh",
            "containerSpecGcsPath": "gs://rmin-template-bucket-e-000r/templates/flex/rmin-cloud-subscriber-cache-refresh-v${var.cache_refresh_version}.json",
            "parameters": {
                "emailCacheHost": "${var.subscriber_email_cache_redishost}",
                "subscriberCacheHost": "${var.subscriber_cache_redishost}",
                "redisMaxTotal": "${var.cache_refresh_redis_max_conn}",
                "redisMaxIdle": "${var.cache_refresh_redis_max_idle}",
                "redisMinIdle": "${var.cache_refresh_redis_min_idle}",
                "redisMaxWaitMillis": "${var.cache_refresh_redis_max_wait_millis}",
                "redisTimeoutMillis": "${var.cache_refresh_redis_timeout_millis}",
                "toggleEmailCacheWrites": "true",
                "toggleSubscriberCacheWrites": "false",
                "togglePurgeCache": "false",
                "partitionCount": "${var.cache_refresh_partition_count}"
            },
            "environment": {
                "ipConfiguration": "WORKER_IP_PRIVATE",
                "stagingLocation": "gs://${var.rmin_template_bucket}/staging",
                "maxWorkers": ${var.cache_refresh_max_workers},
                "serviceAccountEmail": "${var.cache_refresh_sa_email}",
                "subnetwork": "${var.cache_refresh_subnetwork}",
                "tempLocation": "gs://${var.rmin_template_bucket}/staging"
            }
        }
    }
    EOT
    )

    oauth_token {
      scope                 = "https://www.googleapis.com/auth/cloud-platform"
      service_account_email = var.cache_refresh_sa_email
    }

    uri = "https://dataflow.googleapis.com/v1b3/projects/${var.project_id}/locations/us-central1/flexTemplates:launch"
  }
}

resource "google_cloud_scheduler_job" "rmin-cloud-email-cache-purge-refresh" {
  name    = "rmin-cloud-email-cache-purge-refresh"
  project = var.project_id
  region  = "us-central1"
  count   = var.toggle_4583_1111_subscriber_services ? 1 : 0

  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "16"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "2"
  }

  schedule         = var.cache_refresh_schedule
  paused           = true
  time_zone        = "America/New_York"
  attempt_deadline = "600s"

  http_target {

    http_method = "POST"

    body = base64encode(<<EOT
    {
        "launchParameter": {
            "jobName": "rmin-cloud-email-cache-purge-refresh",
            "containerSpecGcsPath": "gs://rmin-template-bucket-e-000r/templates/flex/rmin-cloud-subscriber-cache-refresh-v${var.cache_refresh_version}.json",
            "parameters": {
                "emailCacheHost": "${var.subscriber_email_cache_redishost}",
                "subscriberCacheHost": "${var.subscriber_cache_redishost}",
                "redisMaxTotal": "${var.cache_refresh_redis_max_conn}",
                "redisMaxIdle": "${var.cache_refresh_redis_max_idle}",
                "redisMinIdle": "${var.cache_refresh_redis_min_idle}",
                "redisMaxWaitMillis": "${var.cache_refresh_redis_max_wait_millis}",
                "redisTimeoutMillis": "${var.cache_refresh_redis_timeout_millis}",
                "toggleEmailCacheWrites": "true",
                "toggleSubscriberCacheWrites": "false",
                "togglePurgeCache": "true",
                "partitionCount": "${var.cache_refresh_partition_count}"
            },
            "environment": {
                "ipConfiguration": "WORKER_IP_PRIVATE",
                "stagingLocation": "gs://${var.rmin_template_bucket}/staging",
                "maxWorkers": ${var.cache_refresh_max_workers},
                "serviceAccountEmail": "${var.cache_refresh_sa_email}",
                "subnetwork": "${var.cache_refresh_subnetwork}",
                "tempLocation": "gs://${var.rmin_template_bucket}/staging"
            }
        }
    }
    EOT
    )

    oauth_token {
      scope                 = "https://www.googleapis.com/auth/cloud-platform"
      service_account_email = var.cache_refresh_sa_email
    }

    uri = "https://dataflow.googleapis.com/v1b3/projects/${var.project_id}/locations/us-central1/flexTemplates:launch"
  }
}

resource "google_cloud_scheduler_job" "rmin-cloud-email-subscriber-cache-refresh" {
  name    = "rmin-cloud-email-subscriber-cache-refresh"
  project = var.project_id
  region  = "us-central1"
  count   = var.toggle_4583_1111_subscriber_services ? 1 : 0

  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "16"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "2"
  }

  schedule         = var.cache_refresh_schedule
  paused           = true
  time_zone        = "America/New_York"
  attempt_deadline = "600s"

  http_target {

    http_method = "POST"

    body = base64encode(<<EOT
    {
        "launchParameter": {
            "jobName": "rmin-cloud-email-subscriber-cache-refresh",
            "containerSpecGcsPath": "gs://rmin-template-bucket-e-000r/templates/flex/rmin-cloud-subscriber-cache-refresh-v${var.cache_refresh_version}.json",
            "parameters": {
                "emailCacheHost": "${var.subscriber_email_cache_redishost}",
                "subscriberCacheHost": "${var.subscriber_cache_redishost}",
                "redisMaxTotal": "${var.cache_refresh_redis_max_conn}",
                "redisMaxIdle": "${var.cache_refresh_redis_max_idle}",
                "redisMinIdle": "${var.cache_refresh_redis_min_idle}",
                "redisMaxWaitMillis": "${var.cache_refresh_redis_max_wait_millis}",
                "redisTimeoutMillis": "${var.cache_refresh_redis_timeout_millis}",
                "toggleEmailCacheWrites": "true",
                "toggleSubscriberCacheWrites": "true",
                "togglePurgeCache": "false",
                "partitionCount": "${var.cache_refresh_partition_count}"
            },
            "environment": {
                "ipConfiguration": "WORKER_IP_PRIVATE",
                "stagingLocation": "gs://${var.rmin_template_bucket}/staging",
                "maxWorkers": ${var.cache_refresh_max_workers},
                "serviceAccountEmail": "${var.cache_refresh_sa_email}",
                "subnetwork": "${var.cache_refresh_subnetwork}",
                "tempLocation": "gs://${var.rmin_template_bucket}/staging"
            }
        }
    }
    EOT
    )

    oauth_token {
      scope                 = "https://www.googleapis.com/auth/cloud-platform"
      service_account_email = var.cache_refresh_sa_email
    }

    uri = "https://dataflow.googleapis.com/v1b3/projects/${var.project_id}/locations/us-central1/flexTemplates:launch"
  }
}

resource "google_cloud_scheduler_job" "rmin-cloud-email-subscriber-cache-purge-refresh" {
  name    = "rmin-cloud-email-subscriber-cache-purge-refresh"
  project = var.project_id
  region  = "us-central1"
  count   = var.toggle_4583_1111_subscriber_services ? 1 : 0

  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "16"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "2"
  }

  schedule         = var.cache_refresh_schedule
  paused           = true
  time_zone        = "America/New_York"
  attempt_deadline = "600s"

  http_target {

    http_method = "POST"

    body = base64encode(<<EOT
    {
        "launchParameter": {
            "jobName": "rmin-cloud-subscriber-cache-purge-refresh",
            "containerSpecGcsPath": "gs://rmin-template-bucket-e-000r/templates/flex/rmin-cloud-subscriber-cache-refresh-v${var.cache_refresh_version}.json",
            "parameters": {
                "emailCacheHost": "${var.subscriber_email_cache_redishost}",
                "subscriberCacheHost": "${var.subscriber_cache_redishost}",
                "redisMaxTotal": "${var.cache_refresh_redis_max_conn}",
                "redisMaxIdle": "${var.cache_refresh_redis_max_idle}",
                "redisMinIdle": "${var.cache_refresh_redis_min_idle}",
                "redisMaxWaitMillis": "${var.cache_refresh_redis_max_wait_millis}",
                "redisTimeoutMillis": "${var.cache_refresh_redis_timeout_millis}",
                "toggleEmailCacheWrites": "true",
                "toggleSubscriberCacheWrites": "true",
                "togglePurgeCache": "true",
                "partitionCount": "${var.cache_refresh_partition_count}"
            },
            "environment": {
                "ipConfiguration": "WORKER_IP_PRIVATE",
                "stagingLocation": "gs://${var.rmin_template_bucket}/staging",
                "maxWorkers": ${var.cache_refresh_max_workers},
                "serviceAccountEmail": "${var.cache_refresh_sa_email}",
                "subnetwork": "${var.cache_refresh_subnetwork}",
                "tempLocation": "gs://${var.rmin_template_bucket}/staging"
            }
        }
    }
    EOT
    )

    oauth_token {
      scope                 = "https://www.googleapis.com/auth/cloud-platform"
      service_account_email = var.cache_refresh_sa_email
    }

    uri = "https://dataflow.googleapis.com/v1b3/projects/${var.project_id}/locations/us-central1/flexTemplates:launch"
  }
}

resource "google_cloud_scheduler_job" "dashboard_api_internal_pre_warm" {
  name             = "dashboard-api-internal-pre-warm"
  description      = "Increases Dashboard API Internal service min instances to a predefined value"
  project          = var.project_id
  region           = "us-central1"
  schedule         = var.dashboard_api_internal_pre_warm_schedule
  time_zone        = "America/New_York"
  attempt_deadline = "600s"

  http_target {
    http_method = "PATCH"
    body = base64encode(<<EOT
    {
      "launchStage":"BETA",
      "scaling": { "minInstanceCount": ${var.dashboard_api_internal_pre_warm_min_instances} }
    }
    EOT
    )

    oauth_token {
      scope                 = "https://www.googleapis.com/auth/cloud-platform"
      service_account_email = var.cloud_run_warming_sa
    }

    uri = format("https://run.googleapis.com/v2/projects/%s/locations/us-central1/services/%s?update_mask=scaling.minInstanceCount,launchStage", var.project_id, var.dashboard_api_internal_service_name)
  }

  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "16"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "1"
  }
}

resource "google_cloud_scheduler_job" "rmin_zip5_initiatives_sync_processing_time" {

  name             = "rmin-cloud-zip5-initiatives-sync-function"
  project          = var.project_id
  region           = "us-central1"
  schedule         = "0 20 * * *"
  time_zone        = "America/New_York"
  attempt_deadline = "180s"

  http_target {
    http_method = "GET"

    oidc_token {
      audience              = var.rmin_zip5_initiatives_sync_cloud_run_url
      service_account_email = var.rmin_zip5_initiatives_sync_sa_email
    }

    uri = var.rmin_zip5_initiatives_sync_cloud_run_url

  }

  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "16"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "1"
  }
  count = var.toggle_4583_5681_consumer_portal ? 1 : 0
}

resource "google_cloud_scheduler_job" "dashboard_api_internal_post_warm" {
  name             = "dashboard-api-internal-post-warm"
  description      = "Decreases Dashboard API Internal service min instances to a predefined value"
  project          = var.project_id
  region           = "us-central1"
  schedule         = var.dashboard_api_internal_post_warm_schedule
  time_zone        = "America/New_York"
  attempt_deadline = "600s"

  http_target {
    http_method = "PATCH"
    body = base64encode(<<EOT
    {
      "launchStage":"BETA",
      "scaling": { "minInstanceCount": ${var.dashboard_api_internal_post_warm_min_instances} }
    }
    EOT
    )

    oauth_token {
      scope                 = "https://www.googleapis.com/auth/cloud-platform"
      service_account_email = var.cloud_run_warming_sa
    }

    uri = format("https://run.googleapis.com/v2/projects/%s/locations/us-central1/services/%s?update_mask=scaling.minInstanceCount,launchStage", var.project_id, var.dashboard_api_internal_service_name)
  }

  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "16"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "1"
  }
}

resource "google_cloud_scheduler_job" "dashboard_api_pre_warm" {
  name             = "dashboard-api-pre-warm"
  description      = "Increases Dashboard API service min instances to a predefined value"
  project          = var.project_id
  region           = "us-central1"
  schedule         = var.frontend_apis_pre_warm_schedule
  time_zone        = "America/New_York"
  attempt_deadline = "600s"
  paused           = false

  http_target {
    http_method = "PATCH"
    body = base64encode(<<EOT
    {
      "launchStage":"BETA",
      "scaling": { "minInstanceCount": ${var.dashboard_api_pre_warm_min_instances} }
    }
    EOT
    )

    oauth_token {
      scope                 = "https://www.googleapis.com/auth/cloud-platform"
      service_account_email = var.cloud_run_warming_sa
    }

    uri = format("https://run.googleapis.com/v2/projects/%s/locations/us-central1/services/%s?update_mask=scaling.minInstanceCount,launchStage", var.project_id, var.dashboard_api_service_name)
  }

  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "16"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "1"
  }

  count = var.toggle_4583_5680_frontend ? 1 : 0
}

resource "google_cloud_scheduler_job" "dashboard_api_post_warm" {
  name             = "dashboard-api-post-warm"
  description      = "Decreases Dashboard API service min instances to a predefined value"
  project          = var.project_id
  region           = "us-central1"
  schedule         = var.frontend_apis_post_warm_schedule
  time_zone        = "America/New_York"
  attempt_deadline = "600s"
  paused           = false

  http_target {
    http_method = "PATCH"
    body = base64encode(<<EOT
    {
      "launchStage":"BETA",
      "scaling": { "minInstanceCount": ${var.dashboard_api_post_warm_min_instances} }
    }
    EOT
    )

    oauth_token {
      scope                 = "https://www.googleapis.com/auth/cloud-platform"
      service_account_email = var.cloud_run_warming_sa
    }

    uri = format("https://run.googleapis.com/v2/projects/%s/locations/us-central1/services/%s?update_mask=scaling.minInstanceCount,launchStage", var.project_id, var.dashboard_api_service_name)
  }

  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "16"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "1"
  }

  count = var.toggle_4583_5680_frontend ? 1 : 0
}

resource "google_cloud_scheduler_job" "image_api_pre_warm" {
  name             = "image-api-pre-warm"
  description      = "Increases Image API service min instances to a predefined value"
  project          = var.project_id
  region           = "us-central1"
  schedule         = var.frontend_apis_pre_warm_schedule
  time_zone        = "America/New_York"
  attempt_deadline = "600s"

  http_target {
    http_method = "PATCH"
    body = base64encode(<<EOT
    {
      "launchStage":"BETA",
      "scaling": { "minInstanceCount": ${var.image_api_pre_warm_min_instances} }
    }
    EOT
    )

    oauth_token {
      scope                 = "https://www.googleapis.com/auth/cloud-platform"
      service_account_email = var.cloud_run_warming_sa
    }

    uri = format("https://run.googleapis.com/v2/projects/%s/locations/us-central1/services/%s?update_mask=scaling.minInstanceCount,launchStage", var.project_id, var.image_api_service_name)
  }

  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "16"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "1"
  }

  count = var.toggle_4583_5680_frontend ? 1 : 0
}

resource "google_cloud_scheduler_job" "image_api_post_warm" {
  name             = "image-api-post-warm"
  description      = "Decreases Image API service min instances to a predefined value"
  project          = var.project_id
  region           = "us-central1"
  schedule         = var.frontend_apis_post_warm_schedule
  time_zone        = "America/New_York"
  attempt_deadline = "600s"

  http_target {
    http_method = "PATCH"
    body = base64encode(<<EOT
    {
      "launchStage":"BETA",
      "scaling": { "minInstanceCount": ${var.image_api_post_warm_min_instances} }
    }
    EOT
    )

    oauth_token {
      scope                 = "https://www.googleapis.com/auth/cloud-platform"
      service_account_email = var.cloud_run_warming_sa
    }

    uri = format("https://run.googleapis.com/v2/projects/%s/locations/us-central1/services/%s?update_mask=scaling.minInstanceCount,launchStage", var.project_id, var.image_api_service_name)
  }

  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "16"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "1"
  }

  count = var.toggle_4583_5680_frontend ? 1 : 0
}

resource "google_cloud_scheduler_job" "subscriber_api_pre_warm" {
  name             = "subscriber-api-pre-warm"
  description      = "Increases Subscriber API service min instances to a predefined value"
  project          = var.project_id
  region           = "us-central1"
  schedule         = var.frontend_apis_pre_warm_schedule
  time_zone        = "America/New_York"
  attempt_deadline = "600s"

  http_target {
    http_method = "PATCH"
    body = base64encode(<<EOT
    {
      "launchStage":"BETA",
      "scaling": { "minInstanceCount": ${var.subscriber_api_pre_warm_min_instances} }
    }
    EOT
    )

    oauth_token {
      scope                 = "https://www.googleapis.com/auth/cloud-platform"
      service_account_email = var.cloud_run_warming_sa
    }

    uri = format("https://run.googleapis.com/v2/projects/%s/locations/us-central1/services/%s?update_mask=scaling.minInstanceCount,launchStage", var.project_id, var.subscriber_api_service_name)
  }

  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "16"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "1"
  }

  count = var.toggle_4583_5680_frontend ? 1 : 0
}

resource "google_cloud_scheduler_job" "subscriber_api_post_warm" {
  name             = "subscriber-api-post-warm"
  description      = "Decreases Subscriber API service min instances to a predefined value"
  project          = var.project_id
  region           = "us-central1"
  schedule         = var.frontend_apis_post_warm_schedule
  time_zone        = "America/New_York"
  attempt_deadline = "600s"

  http_target {
    http_method = "PATCH"
    body = base64encode(<<EOT
    {
      "launchStage":"BETA",
      "scaling": { "minInstanceCount": ${var.subscriber_api_post_warm_min_instances} }
    }
    EOT
    )

    oauth_token {
      scope                 = "https://www.googleapis.com/auth/cloud-platform"
      service_account_email = var.cloud_run_warming_sa
    }

    uri = format("https://run.googleapis.com/v2/projects/%s/locations/us-central1/services/%s?update_mask=scaling.minInstanceCount,launchStage", var.project_id, var.subscriber_api_service_name)
  }

  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "16"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "1"
  }

  count = var.toggle_4583_5680_frontend ? 1 : 0
}

resource "google_cloud_scheduler_job" "package_api_pre_warm" {
  name             = "package-api-pre-warm"
  description      = "Increases Package API service min instances to a predefined value"
  project          = var.project_id
  region           = "us-central1"
  schedule         = var.frontend_apis_pre_warm_schedule
  time_zone        = "America/New_York"
  attempt_deadline = "600s"

  http_target {
    http_method = "PATCH"
    body = base64encode(<<EOT
    {
      "launchStage":"BETA",
      "scaling": { "minInstanceCount": ${var.package_api_pre_warm_min_instances} }
    }
    EOT
    )

    oauth_token {
      scope                 = "https://www.googleapis.com/auth/cloud-platform"
      service_account_email = var.cloud_run_warming_sa
    }

    uri = format("https://run.googleapis.com/v2/projects/%s/locations/us-central1/services/%s?update_mask=scaling.minInstanceCount,launchStage", var.project_id, var.package_api_service_name)
  }

  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "16"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "1"
  }

  count = var.toggle_4583_5680_frontend ? 1 : 0
}

resource "google_cloud_scheduler_job" "package_api_post_warm" {
  name             = "package-api-post-warm"
  description      = "Decreases Package API service min instances to a predefined value"
  project          = var.project_id
  region           = "us-central1"
  schedule         = var.frontend_apis_post_warm_schedule
  time_zone        = "America/New_York"
  attempt_deadline = "600s"

  http_target {
    http_method = "PATCH"
    body = base64encode(<<EOT
    {
      "launchStage":"BETA",
      "scaling": { "minInstanceCount": ${var.package_api_post_warm_min_instances} }
    }
    EOT
    )

    oauth_token {
      scope                 = "https://www.googleapis.com/auth/cloud-platform"
      service_account_email = var.cloud_run_warming_sa
    }

    uri = format("https://run.googleapis.com/v2/projects/%s/locations/us-central1/services/%s?update_mask=scaling.minInstanceCount,launchStage", var.project_id, var.package_api_service_name)
  }

  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "16"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "1"
  }

  count = var.toggle_4583_5680_frontend ? 1 : 0
}

resource "google_cloud_scheduler_job" "login_api_pre_warm" {
  name             = "login-api-pre-warm"
  description      = "Increases Login API service min instances to a predefined value"
  project          = var.project_id
  region           = "us-central1"
  schedule         = var.frontend_apis_pre_warm_schedule
  time_zone        = "America/New_York"
  attempt_deadline = "600s"

  http_target {
    http_method = "PATCH"
    body = base64encode(<<EOT
    {
      "launchStage":"BETA",
      "scaling": { "minInstanceCount": ${var.login_api_pre_warm_min_instances} }
    }
    EOT
    )

    oauth_token {
      scope                 = "https://www.googleapis.com/auth/cloud-platform"
      service_account_email = var.cloud_run_warming_sa
    }

    uri = format("https://run.googleapis.com/v2/projects/%s/locations/us-central1/services/%s?update_mask=scaling.minInstanceCount,launchStage", var.project_id, var.login_api_service_name)
  }

  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "16"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "1"
  }

  count = var.toggle_4583_5680_frontend ? 1 : 0
}

resource "google_cloud_scheduler_job" "login_api_post_warm" {
  name             = "login-api-post-warm"
  description      = "Decreases Login API service min instances to a predefined value"
  project          = var.project_id
  region           = "us-central1"
  schedule         = var.frontend_apis_post_warm_schedule
  time_zone        = "America/New_York"
  attempt_deadline = "600s"

  http_target {
    http_method = "PATCH"
    body = base64encode(<<EOT
    {
      "launchStage":"BETA",
      "scaling": { "minInstanceCount": ${var.login_api_post_warm_min_instances} }
    }
    EOT
    )

    oauth_token {
      scope                 = "https://www.googleapis.com/auth/cloud-platform"
      service_account_email = var.cloud_run_warming_sa
    }

    uri = format("https://run.googleapis.com/v2/projects/%s/locations/us-central1/services/%s?update_mask=scaling.minInstanceCount,launchStage", var.project_id, var.login_api_service_name)
  }

  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "16"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "1"
  }

  count = var.toggle_4583_5680_frontend ? 1 : 0
}

resource "google_cloud_scheduler_job" "eagan_proxy_pre_warm" {
  name             = "eagan-proxy-pre-warm"
  description      = "Increases Eagan Proxy service min instances to a predefined value"
  project          = var.project_id
  region           = "us-central1"
  schedule         = var.frontend_apis_pre_warm_schedule
  time_zone        = "America/New_York"
  attempt_deadline = "600s"

  http_target {
    http_method = "PATCH"
    body = base64encode(<<EOT
    {
      "launchStage":"BETA",
      "scaling": { "minInstanceCount": ${var.eagan_proxy_pre_warm_min_instances} }
    }
    EOT
    )

    oauth_token {
      scope                 = "https://www.googleapis.com/auth/cloud-platform"
      service_account_email = var.cloud_run_warming_sa
    }

    uri = format("https://run.googleapis.com/v2/projects/%s/locations/us-central1/services/%s?update_mask=scaling.minInstanceCount,launchStage", var.project_id, var.eagan_proxy_service_name)
  }

  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "16"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "1"
  }

  count = var.toggle_4583_5680_frontend ? 1 : 0
}

resource "google_cloud_scheduler_job" "eagan_proxy_post_warm" {
  name             = "eagan-proxy-post-warm"
  description      = "Decreases Eagan Proxy service min instances to a predefined value"
  project          = var.project_id
  region           = "us-central1"
  schedule         = var.frontend_apis_post_warm_schedule
  time_zone        = "America/New_York"
  attempt_deadline = "600s"

  http_target {
    http_method = "PATCH"
    body = base64encode(<<EOT
    {
      "launchStage":"BETA",
      "scaling": { "minInstanceCount": ${var.eagan_proxy_post_warm_min_instances} }
    }
    EOT
    )

    oauth_token {
      scope                 = "https://www.googleapis.com/auth/cloud-platform"
      service_account_email = var.cloud_run_warming_sa
    }

    uri = format("https://run.googleapis.com/v2/projects/%s/locations/us-central1/services/%s?update_mask=scaling.minInstanceCount,launchStage", var.project_id, var.eagan_proxy_service_name)
  }

  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "16"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "1"
  }

  count = var.toggle_4583_5680_frontend ? 1 : 0
}

resource "google_cloud_scheduler_job" "consumer_portal_pre_warm" {
  name             = "consumer-portal-pre-warm"
  description      = "Increases Consumer Portal service min instances to a predefined value"
  project          = var.project_id
  region           = "us-central1"
  schedule         = var.frontend_apis_pre_warm_schedule
  time_zone        = "America/New_York"
  attempt_deadline = "600s"

  http_target {
    http_method = "PATCH"
    body = base64encode(<<EOT
    {
      "launchStage":"BETA",
      "scaling": { "minInstanceCount": ${var.consumer_portal_pre_warm_min_instances} }
    }
    EOT
    )

    oauth_token {
      scope                 = "https://www.googleapis.com/auth/cloud-platform"
      service_account_email = var.cloud_run_warming_sa
    }

    uri = format("https://run.googleapis.com/v2/projects/%s/locations/us-central1/services/%s?update_mask=scaling.minInstanceCount,launchStage", var.project_id, var.consumer_portal_service_name)
  }

  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "16"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "1"
  }

  count = var.toggle_4583_5680_frontend ? 1 : 0
}

resource "google_cloud_scheduler_job" "consumer_portal_post_warm" {
  name             = "consumer-portal-post-warm"
  description      = "Decreases Consumer Portal service min instances to a predefined value"
  project          = var.project_id
  region           = "us-central1"
  schedule         = var.frontend_apis_post_warm_schedule
  time_zone        = "America/New_York"
  attempt_deadline = "600s"

  http_target {
    http_method = "PATCH"
    body = base64encode(<<EOT
    {
      "launchStage":"BETA",
      "scaling": { "minInstanceCount": ${var.consumer_portal_post_warm_min_instances} }
    }
    EOT
    )

    oauth_token {
      scope                 = "https://www.googleapis.com/auth/cloud-platform"
      service_account_email = var.cloud_run_warming_sa
    }

    uri = format("https://run.googleapis.com/v2/projects/%s/locations/us-central1/services/%s?update_mask=scaling.minInstanceCount,launchStage", var.project_id, var.consumer_portal_service_name)
  }

  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "16"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "1"
  }

  count = var.toggle_4583_5680_frontend ? 1 : 0
}

resource "google_cloud_scheduler_job" "rmin_process_failed_package_email_notifications" {

  name             = "rmin-cloud-process-failed-package-email-notifications"
  project          = var.project_id
  region           = "us-central1"
  schedule         = "0 0 29 2 1"
  time_zone        = "America/New_York"
  attempt_deadline = "1800s"

  http_target {
    http_method = "POST"
    body        = base64encode("email")

    oidc_token {
      audience              = var.process_failed_package_notifications_url
      service_account_email = var.process_failed_package_notifications_sa_email
    }

    uri = var.process_failed_package_notifications_url

  }

  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "16"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "2"
  }
  count = var.toggle_4583_5710_apigee_hybrid ? 1 : 0
}

resource "google_cloud_scheduler_job" "rmin_process_failed_package_sms_notifications" {

  name             = "rmin-cloud-process-failed-package-sms-notifications"
  project          = var.project_id
  region           = "us-central1"
  schedule         = "0 0 29 2 1"
  time_zone        = "America/New_York"
  attempt_deadline = "1800s"

  http_target {
    http_method = "POST"
    body        = base64encode("sms")

    oidc_token {
      audience              = var.process_failed_package_notifications_url
      service_account_email = var.process_failed_package_notifications_sa_email
    }

    uri = var.process_failed_package_notifications_url

  }

  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "16"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "2"
  }
  count = var.toggle_4583_5710_apigee_hybrid ? 1 : 0
}

resource "google_cloud_scheduler_job" "rmin_redis_cache_backup_scheduler_e" {

  for_each = local.redis_caches_map

  name             = "rmin-backup-scheduler-e-${each.key}-${var.name_suffix}"
  description      = "Redis Cache Export Backup Scheduler for ${each.key}-${var.name_suffix}"
  project          = var.project_id
  region           = var.rmin_redis_export_backup_scheduler_region_invar
  schedule         = var.rmin_redis_export_backup_scheduler_schedule_invar
  time_zone        = var.rmin_redis_export_backup_scheduler_timezone_invar
  attempt_deadline = "600s"
  
  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "9"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "2"
  }

  http_target {
    http_method = "POST"
    body        = base64encode(
				<<-EOT
				{
				  "outputConfig":{
					"gcsDestination":{
					  "uri": "gs://${var.rmin_redis_export_backup_bucket_name_invar}/${each.key}-${var.name_suffix}/Redis-${each.key}-${var.name_suffix}-export.rdb"

					}
				  }
				}
				EOT
	)
	
    oauth_token {
      scope                 = "https://www.googleapis.com/auth/cloud-platform"
      service_account_email = "${var.rmin_redis_export_backup_service_account_invar}@${var.project_id}.iam.gserviceaccount.com"
    }

    uri = "https://redis.googleapis.com/v1/projects/${var.project_id}/locations/${each.value.region}/instances/${each.key}-${var.name_suffix}:export"
  }
}

resource "google_cloud_scheduler_job" "rmin_operationaldata_bigquery_export_e" {

  for_each = toset(local.bigquery_tables_list)

  name             = "rmin-backup-scheduler-e-bigquery-${lower(each.value)}-${var.name_suffix}"
  description      = "BigQuery Export Backup Scheduler for ${each.value} table"
  project          = var.project_id
  region           = var.rmin_bigquery_export_backup_scheduler_region_invar
  schedule         = var.rmin_bigquery_export_backup_scheduler_schedule_invar
  time_zone        = var.rmin_bigquery_export_backup_scheduler_timezone_invar
  attempt_deadline = "600s"
  
  retry_config {
    max_backoff_duration = "3600s"
    max_doublings        = "9"
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = "2"
  }
  
  http_target {
    http_method = "POST"
    body        = base64encode(
				<<-EOT
				{
				  "configuration": {
					"extract": {
					  "destinationUris": [
						"gs://${var.rmin_bigquery_export_backup_bucket_name_invar}/${each.value}/rmin-operationaldata-bigquery-${each.value}-export-e-${var.name_suffix}.csv"
					  ],
					  "printHeader": true,
					  "sourceTable": {
						"projectId": "${var.project_id}",
						"datasetId": "rmin_operationaldata_bigquery_e_${var.name_suffix}",
						  "tableId": "${each.value}"
					  }
					}
				  }
				}
				EOT
	)
    oauth_token {
      scope                 = "https://www.googleapis.com/auth/cloud-platform"
      service_account_email = "${var.rmin_bigquery_export_backup_service_account_invar}@${var.project_id}.iam.gserviceaccount.com"
    }

    uri = "https://bigquery.googleapis.com/bigquery/v2/projects/${var.project_id}/jobs"
  }
}

# [END google_cloud_scheduler_job]
