# [START google_cloudfunctions_function]

resource "google_cloudfunctions_function" "rmin_redischeck_mdnzip11s_cache_c" {
  available_memory_mb = var.rmin_redischeck_mdnzip11s_cache_c_avail_mem_mb
  entry_point         = "check_redis"

  environment_variables = {
    REDISHOST = var.rmin_redischeck_mdnzip11s_cache_c_redishost
    REDISPORT = "6379"
  }

  event_trigger {
    event_type = "google.pubsub.topic.publish"
    resource   = var.rmin_redischeck_mdnzip11s_cache_c_resource
  }

  ingress_settings              = "ALLOW_INTERNAL_ONLY"
  max_instances                 = var.rmin_redischeck_mdnzip11s_cache_c_max_instances
  name                          = "rmin-redischeck-mdnzip11s-cache-c-${var.name_suffix}"
  project                       = var.project_id
  region                        = "us-central1"
  runtime                       = "python39"
  service_account_email         = var.rmin_redischeck_mdnzip11s_cache_c_sa_email
  source_archive_bucket         = var.rmin_template_bucket
  source_archive_object         = "templates/functions/rmin-cloud-redis-func-001.zip"
  timeout                       = var.rmin_redischeck_mdnzip11s_cache_c_timeout
  vpc_connector                 = var.rmin_redischeck_mdnzip11s_cache_c_vpc_connector
  vpc_connector_egress_settings = "PRIVATE_RANGES_ONLY"

  depends_on = [google_storage_bucket_object.rmin_redis_func_zip_file]

  lifecycle {
    replace_triggered_by = [
      google_storage_bucket_object.rmin_redis_func_zip_file
    ]
  }
}

resource "google_cloudfunctions_function" "rmin_redischeck_subscriber_email_cache_c" {
  available_memory_mb = var.rmin_redischeck_subscriber_email_cache_c_avail_mem_mb
  entry_point         = "check_redis"

  environment_variables = {
    REDISHOST = var.rmin_redischeck_subscriber_email_cache_c_redishost
    REDISPORT = "6379"
  }

  event_trigger {
    event_type = "google.pubsub.topic.publish"
    resource   = var.rmin_redischeck_subscriber_email_cache_c_resource
  }

  ingress_settings              = "ALLOW_INTERNAL_ONLY"
  max_instances                 = var.rmin_redischeck_subscriber_email_cache_c_max_instances
  name                          = "rmin-redischeck-subscriber-email-cache-c-${var.name_suffix}"
  project                       = var.project_id
  region                        = "us-central1"
  runtime                       = "python39"
  service_account_email         = var.rmin_redischeck_subscriber_email_cache_c_sa_email
  source_archive_bucket         = var.rmin_template_bucket
  source_archive_object         = "templates/functions/rmin-cloud-redis-func-001.zip"
  timeout                       = var.rmin_redischeck_subscriber_email_cache_c_timeout
  vpc_connector                 = var.rmin_redischeck_subscriber_email_cache_c_vpc_connector
  vpc_connector_egress_settings = "PRIVATE_RANGES_ONLY"

  depends_on = [google_storage_bucket_object.rmin_redis_func_zip_file]

  lifecycle {
    replace_triggered_by = [
      google_storage_bucket_object.rmin_redis_func_zip_file
    ]
  }
}

resource "google_cloudfunctions_function" "rmin_redischeck_fs_subscriber_email_cache" {
  available_memory_mb = var.rmin_redischeck_fs_subscriber_email_cache_memory
  entry_point         = "check_redis"

  environment_variables = {
    REDISHOST = var.rmin_redischeck_fs_subscriber_email_cache_redishost
    REDISPORT = "6379"
  }

  event_trigger {
    event_type = "google.pubsub.topic.publish"
    resource   = var.rmin_redischeck_fs_subscriber_email_cache_resource
  }

  ingress_settings              = "ALLOW_INTERNAL_ONLY"
  max_instances                 = var.rmin_redischeck_subscriber_email_cache_c_max_instances
  name                          = "rmin-redischeck-fs-subscriber-email-cache-c-${var.name_suffix}"
  project                       = var.project_id
  region                        = "us-central1"
  runtime                       = "python39"
  service_account_email         = var.redischeck_service_account
  source_archive_bucket         = var.rmin_template_bucket
  source_archive_object         = "templates/functions/rmin-cloud-redis-func-001.zip"
  timeout                       = var.rmin_redischeck_subscriber_email_cache_c_timeout
  vpc_connector                 = var.vpc_connector
  vpc_connector_egress_settings = "PRIVATE_RANGES_ONLY"

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0

  depends_on = [google_storage_bucket_object.rmin_redis_func_zip_file]

  lifecycle {
    replace_triggered_by = [
      google_storage_bucket_object.rmin_redis_func_zip_file
    ]
  }
}

resource "google_cloudfunctions_function" "rmin_redischeck_fs_subscriber_cache" {
  available_memory_mb = var.rmin_redischeck_fs_subscriber_cache_memory
  entry_point         = "check_redis"

  environment_variables = {
    REDISHOST = var.rmin_redischeck_fs_subscriber_cache_redishost
    REDISPORT = "6379"
  }

  event_trigger {
    event_type = "google.pubsub.topic.publish"
    resource   = var.rmin_redischeck_fs_subscriber_cache_resource
  }

  ingress_settings              = "ALLOW_INTERNAL_ONLY"
  max_instances                 = var.redischeck_subscriber_cache_c_max_instance
  name                          = "rmin-redischeck-fs-subscriber-cache-c-${var.name_suffix}"
  project                       = var.project_id
  region                        = "us-central1"
  runtime                       = "python39"
  service_account_email         = var.redischeck_service_account
  source_archive_bucket         = var.rmin_template_bucket
  source_archive_object         = "templates/functions/rmin-cloud-redis-func-001.zip"
  timeout                       = var.redischeck_subscriber_cache_c_timeout
  vpc_connector                 = var.vpc_connector
  vpc_connector_egress_settings = "PRIVATE_RANGES_ONLY"

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0

  depends_on = [google_storage_bucket_object.rmin_redis_func_zip_file]

  lifecycle {
    replace_triggered_by = [
      google_storage_bucket_object.rmin_redis_func_zip_file
    ]
  }
}

resource "google_cloudfunctions_function" "rmin_alerts_e" {
  available_memory_mb = var.rmin_alerts_e_avail_mem_mb
  entry_point         = "process_alert"


  environment_variables = {
    DOMAIN_NAME = var.rmin_alerts_e_domain_name
    FROM_EMAIL  = var.rmin_alerts_e_from_email
    TO_EMAIL    = var.rmin_alerts_e_to_email
  }

  secret_environment_variables {
    key     = "API_KEY"
    secret  = var.rmin_alerts_e_secret
    version = var.rmin_alerts_e_secret_version
  }

  event_trigger {
    event_type = "google.pubsub.topic.publish"
    resource   = var.rmin_alerts_e_resource
  }

  ingress_settings              = "ALLOW_INTERNAL_ONLY"
  max_instances                 = var.rmin_alerts_e_max_instances
  name                          = "rmin-alerts-e-${var.name_suffix}"
  project                       = var.project_id
  region                        = "us-east4"
  runtime                       = "python311"
  service_account_email         = var.rmin_alerts_e_sa_email
  timeout                       = var.rmin_alerts_e_timeout
  vpc_connector                 = var.rmin_alerts_e_vpc_connector
  vpc_connector_egress_settings = "PRIVATE_RANGES_ONLY"
  source_archive_bucket         = var.rmin_template_bucket
  source_archive_object         = "templates/functions/rmin-cloud-alert-func.zip"

  depends_on = [google_storage_bucket_object.rmin_alerts_e_func_zip_file]

  timeouts {
    create = "20m"
    update = "20m"
    delete = "20m"
  }

  lifecycle {
    replace_triggered_by = [
      google_storage_bucket_object.rmin_alerts_e_func_zip_file
    ]
  }
}

resource "google_cloudfunctions_function" "rmin_redischeck_flats_cache_c" {
  available_memory_mb = var.rmin_redischeck_flats_cache_c_avail_mem_mb
  entry_point         = "check_redis"

  environment_variables = {
    REDISHOST = var.rmin_redischeck_flats_cache_c_redishost
    REDISPORT = "6379"
  }

  event_trigger {
    event_type = "google.pubsub.topic.publish"
    resource   = var.rmin_redischeck_flats_cache_c_resource
  }

  ingress_settings              = "ALLOW_INTERNAL_ONLY"
  max_instances                 = var.rmin_redischeck_flats_cache_c_max_instances
  name                          = "rmin-redischeck-flats-cache-c-${var.name_suffix}"
  project                       = var.project_id
  region                        = "us-central1"
  runtime                       = "python39"
  service_account_email         = var.rmin_redischeck_flats_cache_c_sa_email
  source_archive_bucket         = var.rmin_template_bucket
  source_archive_object         = "templates/functions/rmin-cloud-redis-func-001.zip"
  timeout                       = var.rmin_redischeck_flats_cache_c_timeout
  vpc_connector                 = var.rmin_redischeck_flats_cache_c_vpc_connector
  vpc_connector_egress_settings = "PRIVATE_RANGES_ONLY"

  depends_on = [google_storage_bucket_object.rmin_redis_func_zip_file]

  lifecycle {
    replace_triggered_by = [
      google_storage_bucket_object.rmin_redis_func_zip_file
    ]
  }
}

resource "google_cloudfunctions_function" "rmin_redischeck_relay_cache_c" {
  available_memory_mb = var.rmin_redischeck_relay_cache_c_avail_mem_mb
  entry_point         = "check_redis"

  environment_variables = {
    REDISHOST = var.rmin_redischeck_relay_cache_c_redishost
    REDISPORT = "6379"
  }

  event_trigger {
    event_type = "google.pubsub.topic.publish"
    resource   = var.rmin_redischeck_relay_cache_c_resource
  }

  ingress_settings              = "ALLOW_INTERNAL_ONLY"
  max_instances                 = var.rmin_redischeck_relay_cache_c_max_instances
  name                          = "rmin-redischeck-relay-cache-c-${var.name_suffix}"
  project                       = var.project_id
  region                        = "us-central1"
  runtime                       = "python39"
  service_account_email         = var.rmin_redischeck_relay_cache_c_sa_email
  source_archive_bucket         = var.rmin_template_bucket
  source_archive_object         = "templates/functions/rmin-cloud-redis-func-001.zip"
  timeout                       = var.rmin_redischeck_relay_cache_c_timeout
  vpc_connector                 = var.rmin_redischeck_relay_cache_c_vpc_connector
  vpc_connector_egress_settings = "PRIVATE_RANGES_ONLY"

  depends_on = [google_storage_bucket_object.rmin_redis_func_zip_file]

  lifecycle {
    replace_triggered_by = [
      google_storage_bucket_object.rmin_redis_func_zip_file
    ]
  }
}

resource "google_cloudfunctions_function" "rmin_redischeck_saturation_data_cache_e" {
  available_memory_mb = var.rmin_redischeck_saturation_data_cache_e_avail_mem_mb
  entry_point         = "check_redis"

  environment_variables = {
    REDISHOST = var.rmin_redischeck_saturation_data_cache_e_redishost
    REDISPORT = "6379"
  }

  event_trigger {
    event_type = "google.pubsub.topic.publish"
    resource   = var.rmin_redischeck_saturation_data_cache_e_resource
  }

  ingress_settings = "ALLOW_INTERNAL_ONLY"

  max_instances                 = var.rmin_redischeck_saturation_data_cache_e_max_instances
  name                          = "rmin-redischeck-saturation-data-cache-e-${var.name_suffix}"
  project                       = var.project_id
  region                        = "us-east4"
  runtime                       = "python39"
  service_account_email         = var.rmin_redischeck_saturation_data_cache_e_sa_email
  source_archive_bucket         = var.rmin_template_bucket
  source_archive_object         = "templates/functions/rmin-cloud-redis-func-001.zip"
  timeout                       = var.rmin_redischeck_saturation_data_cache_e_timeout
  vpc_connector                 = var.rmin_redischeck_saturation_data_cache_e_vpc_connector
  vpc_connector_egress_settings = "PRIVATE_RANGES_ONLY"

  depends_on = [google_storage_bucket_object.rmin_redis_func_zip_file]

  lifecycle {
    replace_triggered_by = [
      google_storage_bucket_object.rmin_redis_func_zip_file
    ]
  }
}

resource "google_cloudfunctions_function" "rmin_redischeck_zip5_initiatives_cache" {
  available_memory_mb = 256
  entry_point         = "check_redis"

  environment_variables = {
    REDISHOST = var.rmin_redischeck_zip5_initiatives_cache_redishost
    REDISPORT = "6379"
  }

  event_trigger {
    event_type = "google.pubsub.topic.publish"
    resource   = var.rmin_redischeck_zip5_initiatives_cache_resource
  }

  ingress_settings              = "ALLOW_INTERNAL_ONLY"
  max_instances                 = 1
  name                          = "rmin-redischeck-zip5-initiatives-cache-c-${var.name_suffix}"
  project                       = var.project_id
  region                        = "us-central1"
  runtime                       = "python39"
  service_account_email         = var.redischeck_service_account
  source_archive_bucket         = var.rmin_template_bucket
  source_archive_object         = "templates/functions/rmin-cloud-redis-func-001.zip"
  timeout                       = 60
  vpc_connector                 = var.vpc_connector
  vpc_connector_egress_settings = "PRIVATE_RANGES_ONLY"

  count = var.toggle_4583_5681_consumer_portal ? 1 : 0

  depends_on = [google_storage_bucket_object.rmin_redis_func_zip_file]

  lifecycle {
    replace_triggered_by = [
      google_storage_bucket_object.rmin_redis_func_zip_file
    ]
  }
}

# [END google_cloudfunctions_function]

# [START google_cloudfunctions2_function]

resource "google_cloudfunctions2_function" "rmin_mics_extract_function" {
  name        = "rmin-cloud-mics-extract-function-${var.name_suffix}"
  location    = "us-central1"
  description = "Function that calls the cloud run service to generate mics subscriber zip11 files"

  build_config {
    runtime     = "java17"
    entry_point = "com.function.MicsExtractFunction"

    source {
      storage_source {
        bucket = var.rmin_template_bucket
        object = google_storage_bucket_object.rmin_cloud_mics_extract_function_zip_file[0].name
      }
    }
  }
  service_config {
    min_instance_count               = "0"
    max_instance_count               = var.rmin_mics_extract_max_instances
    available_memory                 = var.rmin_mics_extract_avail_mem_mb
    timeout_seconds                  = var.rmin_mics_extract_timeout
    max_instance_request_concurrency = var.rmin_mics_extract_max_concurrency
    available_cpu                    = var.rmin_mics_extract_cpu
    environment_variables = {
      LOG_EXECUTION_ID = "true",
      bigQueryTable    = format("%s.%s", var.project_id, var.rmin_mics_extract_table)
      projectId        = var.project_id
      url              = var.rmin_mics_subscriber_cloud_run_url
      maxRetryCount    = var.rmin_mics_extract_max_retry
      queueId          = var.rmin_mics_extract_queue_id
      locationId       = var.rmin_mics_extract_location_id
      serviceAccount   = var.rmin_mics_extract_sa_email
    }
    ingress_settings               = "ALLOW_INTERNAL_ONLY"
    all_traffic_on_latest_revision = true
    service_account_email          = var.rmin_mics_extract_sa_email
    vpc_connector                  = var.rmin_mics_extract_vpc_connector
    vpc_connector_egress_settings  = "PRIVATE_RANGES_ONLY"
  }

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0

  lifecycle {
    ignore_changes = [
      build_config[0].docker_repository,
    ]
    replace_triggered_by = [
      google_storage_bucket_object.rmin_cloud_mics_extract_function_zip_file
    ]
  }
}

resource "google_cloudfunctions2_function" "rmin_cloud_image_dimension_func_c" {
  name        = var.image_dimension_function_name
  location    = "us-central1"
  description = "Function to get image dimensions from GCS objects"

  build_config {
    runtime     = "python39"
    entry_point = "receive_firestore_event"

    source {
      storage_source {
        bucket = var.rmin_template_bucket
        object = google_storage_bucket_object.rmin_cloud_image_dimension_func_zip_file.name
      }
    }
  }

  service_config {
    min_instance_count               = var.image_dimension_min_instance
    max_instance_count               = var.image_dimension_max_instance
    available_memory                 = var.image_dimension_memory
    timeout_seconds                  = var.image_dimension_timeout
    max_instance_request_concurrency = var.image_dimension_max_concurrency
    available_cpu                    = var.image_dimension_cpu
    environment_variables = {
      LOG_EXECUTION_ID = "true",
      DATABASE         = var.dashboard_db_name
    }
    ingress_settings               = "ALLOW_INTERNAL_ONLY"
    all_traffic_on_latest_revision = true
    service_account_email          = var.image_dimension_service_account
    vpc_connector                  = var.vpc_connector
    vpc_connector_egress_settings  = "PRIVATE_RANGES_ONLY"
  }

  event_trigger {
    trigger_region        = var.dashboard_db_location
    event_type            = "google.cloud.firestore.document.v1.created"
    retry_policy          = "RETRY_POLICY_DO_NOT_RETRY"
    service_account_email = var.image_dimension_service_account

    event_filters {
      attribute = "database"
      value     = var.dashboard_db_name
    }

    event_filters {
      attribute = "document"
      operator  = "match-path-pattern"
      value     = "dashboards/{zip11}/mailpieces/{uniqueCode}"
    }
  }

  lifecycle {
    ignore_changes = [
      build_config[0].docker_repository,
    ]
    replace_triggered_by = [
      google_storage_bucket_object.rmin_cloud_image_dimension_func_zip_file
    ]
  }
}

resource "google_cloudfunctions2_function" "rmin_cloud_subscriber_update_func" {
  name        = var.subscriber_update_function_name
  location    = "us-central1"
  description = "Function to process Firestore subscriber changes"

  build_config {
    runtime     = "python311"
    entry_point = "process_subscriber_change"

    source {
      storage_source {
        bucket = var.rmin_template_bucket
        object = google_storage_bucket_object.rmin_cloud_subscriber_update_func_zip_file[0].name
      }
    }
  }

  service_config {
    min_instance_count               = var.subscriber_update_function_min_instance
    max_instance_count               = var.subscriber_update_function_max_instance
    available_memory                 = var.subscriber_update_function_memory
    timeout_seconds                  = var.subscriber_update_function_timeout
    max_instance_request_concurrency = var.subscriber_update_function_max_concurrency
    available_cpu                    = var.subscriber_update_function_cpu
    environment_variables = {
      LOG_EXECUTION_ID                = "true",
      DATABASE                        = var.subscribers_db_name
      SUBSCRIBERS_IP                  = var.firestore_subscribers_cache_ip
      SUBSCRIBERS_EMAIL_IP            = var.firestore_subscribers_email_cache_ip
      PROJECT_ID                      = var.project_id
      ACCOUNT_REVISION_TOPIC          = var.account_revision_topic
      PHYSICAL_ADDRESS_REVISION_TOPIC = var.physical_address_revision_topic
      PACKAGE_NOTIFICATION_TOPIC      = var.package_notification_update_topic
      PROCESS_MY_USPS_FIELDS          = var.toggle_4583_5673_myusps_migration
      APIGEE_HYBRID_TOGGLE            = var.toggle_4583_5710_apigee_hybrid
      SUBSCRIBER_OPT_IN_TOPIC         = var.subscriber_opt_in_topic
    }
    ingress_settings               = "ALLOW_INTERNAL_ONLY"
    all_traffic_on_latest_revision = true
    service_account_email          = var.subscriber_update_function_service_account
    vpc_connector                  = var.subscriber_vpc_connector
    vpc_connector_egress_settings  = "PRIVATE_RANGES_ONLY"
  }

  event_trigger {
    trigger_region        = var.subscribers_db_location
    event_type            = "google.cloud.firestore.document.v1.written"
    retry_policy          = "RETRY_POLICY_DO_NOT_RETRY"
    service_account_email = var.subscriber_update_function_service_account

    event_filters {
      attribute = "database"
      value     = var.subscribers_db_name
    }

    event_filters {
      attribute = "document"
      operator  = "match-path-pattern"
      value     = "subscribers/{principalId}"
    }
  }

  lifecycle {
    ignore_changes = [
      build_config[0].docker_repository,
    ]
    replace_triggered_by = [
      google_storage_bucket_object.rmin_cloud_subscriber_update_func_zip_file[0]
    ]
  }
  count = var.toggle_4583_1111_subscriber_services ? 1 : 0
}

resource "google_cloudfunctions2_function" "rmin_cloud_package_notification_trigger" {
  name        = var.package_notification_trigger_function_name
  location    = "us-central1"
  description = "Function to process Dashboard Package creation"

  build_config {
    runtime     = "java21"
    entry_point = "com.function.CloudFunction"

    source {
      storage_source {
        bucket = var.rmin_template_bucket
        object = google_storage_bucket_object.rmin_cloud_package_notification_trigger_zip_file[0].name
      }
    }
  }

  service_config {
    min_instance_count               = var.package_notification_trigger_function_min_instance
    max_instance_count               = var.package_notification_trigger_function_max_instance
    available_memory                 = var.package_notification_trigger_function_memory
    timeout_seconds                  = var.package_notification_trigger_function_timeout
    max_instance_request_concurrency = var.package_notification_trigger_function_max_concurrency
    available_cpu                    = var.package_notification_trigger_function_cpu
    environment_variables = {
      LOG_EXECUTION_ID  = "true",
      projectId         = var.project_id
      emailTopic        = var.package_notification_topic
      redisHost         = coalesce(var.firestore_subscribers_cache_read_ip, var.firestore_subscribers_cache_ip)
      redisPort         = "6379"
      mpToggle          = var.package_notification_trigger_mp_toggle
      smsTopic          = var.package_sms_notification_topic_name
      publishSmsMessage = var.toggle_4583_5710_apigee_hybrid
    }
    ingress_settings               = "ALLOW_INTERNAL_ONLY"
    all_traffic_on_latest_revision = true
    service_account_email          = var.package_notification_trigger_function_service_account
    vpc_connector                  = var.package_notification_connector
    vpc_connector_egress_settings  = "PRIVATE_RANGES_ONLY"
  }

  event_trigger {
    trigger_region        = var.dashboard_db_location
    event_type            = "google.cloud.firestore.document.v1.created"
    retry_policy          = "RETRY_POLICY_DO_NOT_RETRY"
    service_account_email = var.package_notification_trigger_function_service_account

    event_filters {
      attribute = "database"
      value     = var.dashboard_db_name
    }

    event_filters {
      attribute = "document"
      operator  = "match-path-pattern"
      value     = "dashboards/{zip11}/inboundPackages/{impb}"
    }
  }

  lifecycle {
    ignore_changes = [
      build_config[0].docker_repository,
    ]
    replace_triggered_by = [
      google_storage_bucket_object.rmin_cloud_package_notification_trigger_zip_file[0]
    ]
  }
  count = var.toggle_4583_5673_myusps_migration ? 1 : 0
}

resource "google_cloudfunctions2_function" "rmin_redischeck_subscriber_cache_c" {
  name        = var.redischeck_subscriber_cache_c_function_name
  location    = "us-central1"
  description = "Function to check subscribe redis cache in central"

  build_config {
    runtime     = "python311"
    entry_point = "check_redis"

    source {
      storage_source {
        bucket = var.redischeck_source_bucket
        object = var.redischeck_zip_file_name
      }
    }
  }

  service_config {
    min_instance_count               = var.redischeck_subscriber_cache_c_min_instance
    max_instance_count               = var.redischeck_subscriber_cache_c_max_instance
    available_memory                 = var.redischeck_subscriber_cache_c_memory
    timeout_seconds                  = var.redischeck_subscriber_cache_c_timeout
    max_instance_request_concurrency = var.redischeck_subscriber_cache_c_max_concurrency
    available_cpu                    = var.redischeck_subscriber_cache_c_cpu
    environment_variables = {
      LOG_EXECUTION_ID = "true",
      REDISHOST        = var.rmin_subscriber_cache_c_ip,
      REDISPORT        = 6379
    }
    ingress_settings               = "ALLOW_INTERNAL_ONLY"
    all_traffic_on_latest_revision = true
    service_account_email          = var.redischeck_service_account
    vpc_connector                  = var.vpc_connector
    vpc_connector_egress_settings  = "PRIVATE_RANGES_ONLY"
  }

  event_trigger {
    trigger_region = "us-central1"
    event_type     = "google.cloud.pubsub.topic.v1.messagePublished"
    pubsub_topic   = var.redischeck_subscriber_cache_c_topic
    retry_policy   = "RETRY_POLICY_RETRY"
  }

  lifecycle {
    ignore_changes = [
      build_config[0].docker_repository,
    ]
  }
}

resource "google_cloudfunctions2_function" "rmin_redischeck_mail_campaign_cache_c" {
  name        = var.redischeck_mail_campaign_function_name
  location    = "us-central1"
  description = "Function to check mail campaign redis cache"

  build_config {
    runtime     = "python311"
    entry_point = "check_redis"

    source {
      storage_source {
        bucket = var.redischeck_source_bucket
        object = var.redischeck_zip_file_name
      }
    }
  }

  service_config {
    min_instance_count               = var.redischeck_mail_campaign_min_instance
    max_instance_count               = var.redischeck_mail_campaign_max_instance
    available_memory                 = var.redischeck_mail_campaign_memory
    timeout_seconds                  = var.redischeck_mail_campaign_timeout
    max_instance_request_concurrency = var.redischeck_mail_campaign_max_concurrency
    available_cpu                    = var.redischeck_mail_campaign_cpu
    environment_variables = {
      LOG_EXECUTION_ID = "true",
      REDISHOST        = var.rmin_mail_campaign_cache_c_ip,
      REDISPORT        = 6379
    }
    ingress_settings               = "ALLOW_INTERNAL_ONLY"
    all_traffic_on_latest_revision = true
    service_account_email          = var.redischeck_service_account
    vpc_connector                  = var.vpc_connector
    vpc_connector_egress_settings  = "PRIVATE_RANGES_ONLY"
  }

  event_trigger {
    trigger_region = "us-central1"
    event_type     = "google.cloud.pubsub.topic.v1.messagePublished"
    pubsub_topic   = var.redischeck_mail_campaign_topic
    retry_policy   = "RETRY_POLICY_RETRY"
  }

  lifecycle {
    ignore_changes = [
      build_config[0].docker_repository,
    ]
  }
}

resource "google_cloudfunctions2_function" "rmin_redischeck_mail_campaign_cache_ext_c" {
  name        = "rmin-redischeck-mail-campaign-cache-ext-c-${var.name_suffix}"
  location    = "us-central1"
  description = "Function to check mail campaign redis cache"

  build_config {
    runtime     = "python311"
    entry_point = "check_redis"

    source {
      storage_source {
        bucket = var.redischeck_source_bucket
        object = var.redischeck_zip_file_name
      }
    }
  }

  service_config {
    min_instance_count               = var.redischeck_mail_campaign_min_instance
    max_instance_count               = var.redischeck_mail_campaign_max_instance
    available_memory                 = var.redischeck_mail_campaign_memory
    timeout_seconds                  = var.redischeck_mail_campaign_timeout
    max_instance_request_concurrency = var.redischeck_mail_campaign_max_concurrency
    available_cpu                    = var.redischeck_mail_campaign_cpu
    environment_variables = {
      LOG_EXECUTION_ID = "true",
      REDISHOST        = var.rmin_mail_campaign_cache_ext_c_ip,
      REDISPORT        = 6379
    }
    ingress_settings               = "ALLOW_INTERNAL_ONLY"
    all_traffic_on_latest_revision = true
    service_account_email          = var.redischeck_service_account
    vpc_connector                  = var.vpc_connector
    vpc_connector_egress_settings  = "PRIVATE_RANGES_ONLY"
  }

  event_trigger {
    trigger_region = "us-central1"
    event_type     = "google.cloud.pubsub.topic.v1.messagePublished"
    pubsub_topic   = var.redischeck_mail_campaign_ext_topic
    retry_policy   = "RETRY_POLICY_RETRY"
  }

  lifecycle {
    ignore_changes = [
      build_config[0].docker_repository,
    ]
  }

  count = var.toggle_4583_xxxx_ext_caches ? 1 : 0
}

resource "google_cloudfunctions2_function" "rmin_redischeck_package_campaign_cache_c" {
  name        = var.redischeck_package_campaign_function_name
  location    = "us-central1"
  description = "Function to check package campaign redis cache"

  build_config {
    runtime     = "python311"
    entry_point = "check_redis"

    source {
      storage_source {
        bucket = var.redischeck_source_bucket
        object = var.redischeck_zip_file_name
      }
    }
  }

  service_config {
    min_instance_count               = var.redischeck_package_campaign_min_instance
    max_instance_count               = var.redischeck_package_campaign_max_instance
    available_memory                 = var.redischeck_package_campaign_memory
    timeout_seconds                  = var.redischeck_package_campaign_timeout
    max_instance_request_concurrency = var.redischeck_package_campaign_max_concurrency
    available_cpu                    = var.redischeck_package_campaign_cpu
    environment_variables = {
      LOG_EXECUTION_ID = "true",
      REDISHOST        = var.rmin_package_campaign_cache_c_ip,
      REDISPORT        = 6379
    }
    ingress_settings               = "ALLOW_INTERNAL_ONLY"
    all_traffic_on_latest_revision = true
    service_account_email          = var.redischeck_service_account
    vpc_connector                  = var.vpc_connector
    vpc_connector_egress_settings  = "PRIVATE_RANGES_ONLY"
  }

  event_trigger {
    trigger_region = "us-central1"
    event_type     = "google.cloud.pubsub.topic.v1.messagePublished"
    pubsub_topic   = var.redischeck_package_campaign_topic
    retry_policy   = "RETRY_POLICY_RETRY"
  }

  lifecycle {
    ignore_changes = [
      build_config[0].docker_repository,
    ]
  }
}

resource "google_cloudfunctions2_function" "rmin_redischeck_package_campaign_cache_ext_c" {
  name        = "rmin-redischeck-package-campaign-cache-ext-c-${var.name_suffix}"
  location    = "us-central1"
  description = "Function to check package campaign redis cache"

  build_config {
    runtime     = "python311"
    entry_point = "check_redis"

    source {
      storage_source {
        bucket = var.redischeck_source_bucket
        object = var.redischeck_zip_file_name
      }
    }
  }

  service_config {
    min_instance_count               = var.redischeck_package_campaign_min_instance
    max_instance_count               = var.redischeck_package_campaign_max_instance
    available_memory                 = var.redischeck_package_campaign_memory
    timeout_seconds                  = var.redischeck_package_campaign_timeout
    max_instance_request_concurrency = var.redischeck_package_campaign_max_concurrency
    available_cpu                    = var.redischeck_package_campaign_cpu
    environment_variables = {
      LOG_EXECUTION_ID = "true",
      REDISHOST        = var.rmin_package_campaign_cache_ext_c_ip,
      REDISPORT        = 6379
    }
    ingress_settings               = "ALLOW_INTERNAL_ONLY"
    all_traffic_on_latest_revision = true
    service_account_email          = var.redischeck_service_account
    vpc_connector                  = var.vpc_connector
    vpc_connector_egress_settings  = "PRIVATE_RANGES_ONLY"
  }

  event_trigger {
    trigger_region = "us-central1"
    event_type     = "google.cloud.pubsub.topic.v1.messagePublished"
    pubsub_topic   = var.redischeck_package_campaign_ext_topic
    retry_policy   = "RETRY_POLICY_RETRY"
  }

  lifecycle {
    ignore_changes = [
      build_config[0].docker_repository,
    ]
  }

  count = var.toggle_4583_xxxx_ext_caches ? 1 : 0
}

resource "google_cloudfunctions2_function" "rmin_redischeck_mics_locks_cache_c" {
  name        = var.redischeck_mics_locks_c_function_name
  location    = "us-central1"
  description = "Function to check locks cache"

  build_config {
    runtime     = "python311"
    entry_point = "check_redis"

    source {
      storage_source {
        bucket = var.redischeck_source_bucket
        object = var.redischeck_zip_file_name
      }
    }
  }

  service_config {
    min_instance_count               = var.redischeck_mics_locks_c_min_instance
    max_instance_count               = var.redischeck_mics_locks_c_max_instance
    available_memory                 = var.redischeck_mics_locks_c_memory
    timeout_seconds                  = var.redischeck_mics_locks_c_timeout
    max_instance_request_concurrency = var.redischeck_mics_locks_c_max_concurrency
    available_cpu                    = var.redischeck_mics_locks_c_cpu
    environment_variables = {
      LOG_EXECUTION_ID = "true",
      REDISHOST        = var.rmin_mics_locks_cache_c_ip,
      REDISPORT        = 6379
    }
    ingress_settings               = "ALLOW_INTERNAL_ONLY"
    all_traffic_on_latest_revision = true
    service_account_email          = var.redischeck_service_account
    vpc_connector                  = var.vpc_connector
    vpc_connector_egress_settings  = "PRIVATE_RANGES_ONLY"
  }

  event_trigger {
    trigger_region = "us-central1"
    event_type     = "google.cloud.pubsub.topic.v1.messagePublished"
    pubsub_topic   = var.redischeck_mics_locks_c_topic
    retry_policy   = "RETRY_POLICY_RETRY"
  }

  lifecycle {
    ignore_changes = [
      build_config[0].docker_repository,
    ]
  }
}

resource "google_cloudfunctions2_function" "rmin_cloud_zip5_timezone_func_c" {
  name        = "rmin-cloud-zip5-timezone-func-c"
  location    = "us-central1"
  description = "zip5 timezone function in us-central1"

  build_config {
    runtime     = "java21"
    entry_point = "com.function.CloudFunction"
    source {
      storage_source {
        bucket = var.rmin_template_bucket
        object = google_storage_bucket_object.rmin_cloud_zip5_timezone_func_zip_file.name
      }
    }
  }

  service_config {
    min_instance_count               = var.rmin_cloud_zip5_timezone_func_c_min_instance
    max_instance_count               = var.rmin_cloud_zip5_timezone_func_c_max_instance
    available_memory                 = var.rmin_cloud_zip5_timezone_func_c_memory
    timeout_seconds                  = var.rmin_cloud_zip5_timezone_func_c_timeout
    max_instance_request_concurrency = var.rmin_cloud_zip5_timezone_func_c_max_concurrency
    available_cpu                    = var.rmin_cloud_zip5_timezone_func_c_available_cpu
    environment_variables = {
      LOG_EXECUTION_ID = "true",
      REDIS_HOST       = var.rmin_cloud_zip5_timezone_func_c_redis_ip,
      REDIS_PORT       = 6379,
      REDIS_TTL        = 259200,
      OUTPUT_PROJ      = var.project_id,
      BIGQUERY_TABLE   = var.rmin_cloud_zip5_timezone_func_c_bigquery_table
    }

    ingress_settings               = "ALLOW_INTERNAL_ONLY"
    all_traffic_on_latest_revision = true
    service_account_email          = var.rmin_cloud_zip5_timezone_func_c_sa_email
    vpc_connector                  = var.rmin_cloud_zip5_timezone_func_c_vpc_connector
    vpc_connector_egress_settings  = "PRIVATE_RANGES_ONLY"
  }

  lifecycle {
    ignore_changes = [
      build_config[0].docker_repository,
    ]
    replace_triggered_by = [
      google_storage_bucket_object.rmin_cloud_zip5_timezone_func_zip_file
    ]
  }

  depends_on = [google_storage_bucket_object.rmin_cloud_zip5_timezone_func_zip_file]

  timeouts {
    create = "20m"
    update = "20m"
    delete = "20m"
  }
}

resource "google_cloudfunctions2_function" "rmin_cloudsql_runpartman_digest" {
  name        = "rmin-cloudsql-runpartman-digest"
  location    = "us-central1"
  description = "Digest Partition Maintenance Function"

  build_config {
    runtime     = "nodejs20"
    entry_point = "triggerPostgresCommand"
    source {
      storage_source {
        bucket = var.rmin_template_bucket
        object = google_storage_bucket_object.runpartman_func_zip_file.name
      }
    }
  }

  service_config {
    min_instance_count               = var.rmin_cloudsql_runpartman_digest_min_instance
    max_instance_count               = var.rmin_cloudsql_runpartman_digest_max_instance
    available_memory                 = var.rmin_cloudsql_runpartman_digest_memory
    timeout_seconds                  = var.rmin_cloudsql_runpartman_digest_timeout
    max_instance_request_concurrency = var.rmin_cloudsql_runpartman_digest_max_concurrency
    available_cpu                    = var.rmin_cloudsql_runpartman_digest_available_cpu
    environment_variables = {
      LOG_EXECUTION_ID = "true",
      DB_KEY           = var.rmin_cloudsql_runpartman_digest_secret,
      DB_HOST          = var.rmin_cloudsql_runpartman_digest_db_host,
      DB_PORT          = var.rmin_cloudsql_runpartman_digest_db_port,
      DB_NAME          = var.rmin_cloudsql_runpartman_digest_db_name,
      DB_USER          = var.rmin_cloudsql_runpartman_digest_db_user
    }

    secret_volumes {
      mount_path = var.rmin_cloudsql_runpartman_digest_mount_path
      project_id = var.project_id
      secret     = var.rmin_cloudsql_runpartman_digest_secret
    }

    ingress_settings               = "ALLOW_INTERNAL_ONLY"
    all_traffic_on_latest_revision = true
    service_account_email          = var.rmin_cloudsql_runpartman_digest_sa_email
    vpc_connector                  = var.rmin_cloudsql_runpartman_digest_vpc_connector
    vpc_connector_egress_settings  = "PRIVATE_RANGES_ONLY"
  }

  lifecycle {
    ignore_changes = [
      build_config[0].docker_repository,
    ]
    replace_triggered_by = [
      google_storage_bucket_object.runpartman_func_zip_file
    ]
  }

  depends_on = [google_storage_bucket_object.runpartman_func_zip_file, var.cloudsql_digest_secret_version]

  timeouts {
    create = "20m"
    update = "20m"
    delete = "20m"
  }
}


resource "google_cloudfunctions2_function" "rmin_cloudsql_runpartman_c" {
  name        = "rmin-cloudsql-runpartman-c"
  location    = "us-central1"
  description = "MDN Partition Maintenance Function"

  build_config {
    runtime     = "nodejs20"
    entry_point = "triggerPostgresCommand"
    source {
      storage_source {
        bucket = var.rmin_template_bucket
        object = google_storage_bucket_object.runpartman_func_zip_file.name
      }
    }
  }

  service_config {
    min_instance_count               = var.rmin_cloudsql_runpartman_c_min_instance
    max_instance_count               = var.rmin_cloudsql_runpartman_c_max_instance
    available_memory                 = var.rmin_cloudsql_runpartman_c_memory
    timeout_seconds                  = var.rmin_cloudsql_runpartman_c_timeout
    max_instance_request_concurrency = var.rmin_cloudsql_runpartman_c_max_concurrency
    available_cpu                    = var.rmin_cloudsql_runpartman_c_available_cpu

    environment_variables = {
      LOG_EXECUTION_ID = "true",
      DB_KEY           = var.rmin_cloudsql_runpartman_c_secret,
      DB_HOST          = var.rmin_cloudsql_runpartman_c_db_host,
      DB_PORT          = var.rmin_cloudsql_runpartman_c_db_port,
      DB_NAME          = var.rmin_cloudsql_runpartman_c_db_name,
      DB_USER          = var.rmin_cloudsql_runpartman_c_db_user

    }

    secret_volumes {
      mount_path = var.rmin_cloudsql_runpartman_c_mount_path
      project_id = var.project_id
      secret     = var.rmin_cloudsql_runpartman_c_secret
    }

    ingress_settings               = "ALLOW_INTERNAL_ONLY"
    all_traffic_on_latest_revision = true
    service_account_email          = var.rmin_cloudsql_runpartman_c_sa_email
    vpc_connector                  = var.rmin_cloudsql_runpartman_c_vpc_connector
    vpc_connector_egress_settings  = "PRIVATE_RANGES_ONLY"
  }

  lifecycle {
    ignore_changes = [
      build_config[0].docker_repository,
    ]
    replace_triggered_by = [
      google_storage_bucket_object.runpartman_func_zip_file
    ]
  }

  depends_on = [google_storage_bucket_object.runpartman_func_zip_file, var.cloudsql_mdn_secret_version]

  timeouts {
    create = "20m"
    update = "20m"
    delete = "20m"
  }
}


resource "google_cloudfunctions2_function" "rmin_cloud_zip5_initiatives_sync_function_c" {
  name        = "rmin-cloud-zip5-initiatives-sync-function-c"
  location    = "us-central1"
  description = "zip5 initiatives sync function"

  build_config {
    runtime     = "java21"
    entry_point = "com.function.Zip5SyncFunction"
    source {
      storage_source {
        bucket = var.rmin_template_bucket
        object = google_storage_bucket_object.rmin_cloud_zip5_initiatives_sync_function_zip_file[0].name
      }
    }
  }

  service_config {
    min_instance_count               = var.rmin_cloud_zip5_initiatives_sync_function_c_min_instance
    max_instance_count               = var.rmin_cloud_zip5_initiatives_sync_function_c_max_instance
    available_memory                 = var.rmin_cloud_zip5_initiatives_sync_function_c_memory
    timeout_seconds                  = var.rmin_cloud_zip5_initiatives_sync_function_c_timeout
    max_instance_request_concurrency = var.rmin_cloud_zip5_initiatives_sync_function_c_max_concurrency
    available_cpu                    = var.rmin_cloud_zip5_initiatives_sync_function_c_available_cpu
    environment_variables = {
      LOG_EXECUTION_ID = "true",
      REDIS_HOST       = var.rmin_cloud_zip5_initiatives_sync_function_c_redis_ip,
      REDIS_PORT       = 6379,
      OUTPUT_PROJ      = var.project_id,
      BIGQUERY_TABLE   = var.rmin_cloud_zip5_initiatives_sync_function_c_bigquery_table
    }

    ingress_settings               = "ALLOW_INTERNAL_ONLY"
    all_traffic_on_latest_revision = true
    service_account_email          = var.rmin_cloud_zip5_initiatives_sync_function_c_sa_email
    vpc_connector                  = var.rmin_cloud_zip5_initiatives_sync_function_c_vpc_connector
    vpc_connector_egress_settings  = "PRIVATE_RANGES_ONLY"
  }

  lifecycle {
    ignore_changes = [
      build_config[0].docker_repository,
    ]
    replace_triggered_by = [
      google_storage_bucket_object.rmin_cloud_zip5_initiatives_sync_function_zip_file
    ]
  }

  depends_on = [google_storage_bucket_object.rmin_cloud_zip5_initiatives_sync_function_zip_file]

  timeouts {
    create = "20m"
    update = "20m"
    delete = "20m"
  }
  count = var.toggle_4583_5681_consumer_portal ? 1 : 0
}


resource "google_cloudfunctions2_function" "rmin_cloud_inbound_package_sync_trigger" {
  name        = var.inbound_package_sync_trigger_function_name
  location    = "us-central1"
  description = "Function to process Dashboard Inbound Package data sync"

  build_config {
    runtime     = "java21"
    entry_point = "com.function.CloudFunction"

    source {
      storage_source {
        bucket = var.rmin_template_bucket
        object = google_storage_bucket_object.rmin_cloud_inbound_package_sync_trigger_zip_file[0].name
      }
    }
  }

  service_config {
    min_instance_count               = var.inbound_package_sync_trigger_function_min_instance
    max_instance_count               = var.inbound_package_sync_trigger_function_max_instance
    available_memory                 = var.inbound_package_sync_trigger_function_memory
    timeout_seconds                  = var.inbound_package_sync_trigger_function_timeout
    max_instance_request_concurrency = var.inbound_package_sync_trigger_function_max_concurrency
    available_cpu                    = var.inbound_package_sync_trigger_function_cpu
    environment_variables = {
      LOG_EXECUTION_ID         = "true",
      projectId                = var.project_id
      topicId                  = var.inbound_package_sync_topic
      inboundPackagePartitions = var.inbound_package_sync_trigger_function_partitions
    }
    ingress_settings               = "ALLOW_INTERNAL_ONLY"
    all_traffic_on_latest_revision = true
    service_account_email          = var.inbound_package_sync_trigger_function_service_account
    vpc_connector                  = var.inbound_package_sync_connector
    vpc_connector_egress_settings  = "PRIVATE_RANGES_ONLY"
  }

  event_trigger {
    trigger_region        = var.dashboard_db_location
    event_type            = "google.cloud.firestore.document.v1.written"
    retry_policy          = "RETRY_POLICY_DO_NOT_RETRY"
    service_account_email = var.inbound_package_sync_trigger_function_service_account

    event_filters {
      attribute = "database"
      value     = var.dashboard_db_name
    }

    event_filters {
      attribute = "document"
      operator  = "match-path-pattern"
      value     = "dashboards/{zip11}/inboundPackages/{impb}"
    }
  }

  lifecycle {
    ignore_changes = [
      build_config[0].docker_repository,
    ]
    replace_triggered_by = [
      google_storage_bucket_object.rmin_cloud_inbound_package_sync_trigger_zip_file[0]
    ]
  }
  count = var.toggle_4583_5690_ptr2 ? 1 : 0
}

//Note this has the same exact settings and code as the other package notification trigger, so I decided to re-use the variables
resource "google_cloudfunctions2_function" "rmin_cloud_added_package_notification_trigger" {
  name        = format("rmin-cloud-added-package-notification-trigger-c-%s", var.name_suffix)
  location    = "us-central1"
  description = "Function to process a Principal ID Primary Address Added Package creation"

  build_config {
    runtime     = "java21"
    entry_point = "com.function.CloudFunction"

    source {
      storage_source {
        bucket = var.rmin_template_bucket
        object = google_storage_bucket_object.rmin_cloud_added_package_notification_trigger_zip_file[0].name
      }
    }
  }

  service_config {
    min_instance_count               = var.package_notification_trigger_function_min_instance
    max_instance_count               = var.package_notification_trigger_function_max_instance
    available_memory                 = var.package_notification_trigger_function_memory
    timeout_seconds                  = var.package_notification_trigger_function_timeout
    max_instance_request_concurrency = var.package_notification_trigger_function_max_concurrency
    available_cpu                    = var.package_notification_trigger_function_cpu
    environment_variables = {
      LOG_EXECUTION_ID  = "true",
      projectId         = var.project_id
      emailTopic        = var.package_notification_topic
      redisHost         = coalesce(var.firestore_subscribers_cache_read_ip, var.firestore_subscribers_cache_ip)
      redisPort         = "6379"
      mpToggle          = var.package_notification_trigger_mp_toggle
      database          = var.subscribers_db_name
      smsTopic          = var.package_sms_notification_topic_name
      publishSmsMessage = var.toggle_4583_5710_apigee_hybrid
    }
    ingress_settings               = "ALLOW_INTERNAL_ONLY"
    all_traffic_on_latest_revision = true
    service_account_email          = var.package_notification_trigger_function_service_account
    vpc_connector                  = var.package_notification_connector
    vpc_connector_egress_settings  = "PRIVATE_RANGES_ONLY"
  }

  event_trigger {
    trigger_region        = var.dashboard_db_location
    event_type            = "google.cloud.firestore.document.v1.created"
    retry_policy          = "RETRY_POLICY_DO_NOT_RETRY"
    service_account_email = var.package_notification_trigger_function_service_account

    event_filters {
      attribute = "database"
      value     = var.dashboard_db_name
    }

    event_filters {
      attribute = "document"
      operator  = "match-path-pattern"
      value     = "principalIds/{principalIds}/addedPackages-1/{impb}"
    }
  }

  lifecycle {
    ignore_changes = [
      build_config[0].docker_repository,
    ]
    replace_triggered_by = [
      google_storage_bucket_object.rmin_cloud_added_package_notification_trigger_zip_file[0]
    ]
  }
  count = var.toggle_4583_5680_frontend ? 1 : 0
}

resource "google_cloudfunctions2_function" "rmin_cloud_process_failed_package_notifications" {
  name        = format("rmin-cloud-process-failed-package-notifications-c-%s", var.name_suffix)
  location    = "us-central1"
  description = "Function to process failed package notifications off of the DLT subscription"

  build_config {
    runtime     = "java21"
    entry_point = "com.function.CloudFunction"
    source {
      storage_source {
        bucket = var.rmin_template_bucket
        object = google_storage_bucket_object.rmin_cloud_process_failed_package_notifications_zip_file[0].name
      }
    }
  }

  service_config {
    min_instance_count               = var.process_failed_package_notif_function_c_min_instance
    max_instance_count               = var.process_failed_package_notif_function_c_max_instance
    available_memory                 = var.process_failed_package_notif_function_c_memory
    timeout_seconds                  = var.process_failed_package_notif_function_c_timeout
    max_instance_request_concurrency = var.process_failed_package_notif_function_c_max_concurrency
    available_cpu                    = var.process_failed_package_notif_function_c_available_cpu
    environment_variables = {
      LOG_EXECUTION_ID  = "true",
      emailSubscription = var.package_email_notification_dlq_subscription_name,
      emailTopic        = var.package_email_notification_topic_name,
      projectId         = var.project_id,
      smsSubscription   = var.package_sms_notification_dlq_subscription_name,
      smsTopic          = var.package_sms_notification_topic_name
    }

    ingress_settings               = "ALLOW_INTERNAL_ONLY"
    all_traffic_on_latest_revision = true
    service_account_email          = var.process_failed_package_notif_function_c_sa_email
    vpc_connector                  = var.package_notification_connector
    vpc_connector_egress_settings  = "PRIVATE_RANGES_ONLY"
  }

  lifecycle {
    ignore_changes = [
      build_config[0].docker_repository,
    ]
    replace_triggered_by = [google_storage_bucket_object.rmin_cloud_process_failed_package_notifications_zip_file]
  }

  depends_on = [google_storage_bucket_object.rmin_cloud_process_failed_package_notifications_zip_file]

  timeouts {
    create = "20m"
    update = "20m"
    delete = "20m"
  }
  count = var.toggle_4583_5710_apigee_hybrid ? 1 : 0
}

resource "google_cloudfunctions2_function" "rmin_cloud_mdn_eng_feed_func" {
  name        = "rmin-cloud-mdn-eng-feed-func"
  location    = "us-central1"
  description = "Function to copy mdn zip11 csv to engeneering."

  build_config {
    runtime     = "java17"
    entry_point = "com.function.CloudFunction"

    source {
      storage_source {
        bucket = var.rmin_template_bucket
        object = google_storage_bucket_object.rmin_cloud_mdn_eng_feed_func_zip_file[0].name
      }
    }
  }

  service_config {
    min_instance_count               = var.mdn_eng_feed_function_min_instance
    max_instance_count               = var.mdn_eng_feed_function_max_instance
    available_memory                 = var.mdn_eng_feed_function_memory
    timeout_seconds                  = var.mdn_eng_feed_function_timeout
    max_instance_request_concurrency = var.mdn_eng_feed_function_max_concurrency
    available_cpu                    = var.mdn_eng_feed_function_cpu
    environment_variables = {
      LOG_EXECUTION_ID = "true",
      PROJ_ID          = var.project_id
      ENG_TOGGLE       = var.mdn_eng_feed_function_eng_toggle
      BIGQUERY_TABLE   = var.mdn_eng_feed_function_table_id
      AZURE_ACCT       = var.mdn_eng_feed_function_azure_acct
      AZURE_CNTR       = var.mdn_eng_feed_function_azure_cntr
      AZURE_FILE       = var.mdn_eng_feed_function_azure_file
	  FILE_BUCKET      = var.mdn_eng_feed_function_file_bucket
	  TEMP_BUCKET      = var.mdn_eng_feed_function_temp_bucket
	  SECRET_KEY       = "Eng-azure-sas-token"
    }
	
	secret_volumes {
	  mount_path = var.mdn_eng_feed_function_mount_path
	  project_id = var.project_id
	  secret     = var.mdn_eng_feed_function_secret
	}

    ingress_settings               = "ALLOW_INTERNAL_ONLY"
    all_traffic_on_latest_revision = true
    service_account_email          = var.mdn_eng_feed_function_service_account
    vpc_connector                  = var.mdn_eng_feed_function_connector
    vpc_connector_egress_settings  = "PRIVATE_RANGES_ONLY"
  }

  event_trigger {
    trigger_region        = "us-central1"
    event_type            = "google.cloud.dataflow.job.v1beta3.statusChanged"
    retry_policy          = "RETRY_POLICY_DO_NOT_RETRY"
    service_account_email = var.mdn_eng_feed_function_service_account

    event_filters {
      attribute = "job"
      value     = "rmin-cloud-mdn-eng-feed"
    }
  }

  lifecycle {
    ignore_changes = [
      build_config[0].docker_repository,
    ]
    replace_triggered_by = [
      google_storage_bucket_object.rmin_cloud_mdn_eng_feed_func_zip_file[0]
    ]
  }
  count = var.toggle_4583_5708_mdn_to_eng ? 1 : 0
}


# [END google_cloudfunctions2_function]


# [START google_storage_bucket_object]

# Used to upload function Alerts function source code to gcs bucket
resource "google_storage_bucket_object" "rmin_alerts_e_func_zip_file" {
  name         = "templates/functions/rmin-cloud-alert-func.zip"
  bucket       = var.rmin_template_bucket
  source       = "${path.module}/function_sources/rmin-cloud-alert-func.zip"
  content_type = "application/x-zip-compressed"
}

# Used to upload function ZIP5 Timezone function source code to gcs bucket
resource "google_storage_bucket_object" "rmin_cloud_zip5_timezone_func_zip_file" {
  name         = "templates/functions/rmin-cloud-zip5-timezone-func.zip"
  bucket       = var.rmin_template_bucket
  source       = "${path.module}/function_sources/rmin-cloud-zip5-timezone-func.zip"
  content_type = "application/x-zip-compressed"
}

# Used to upload function runpartman function source code to gcs bucket
resource "google_storage_bucket_object" "runpartman_func_zip_file" {
  name         = "templates/functions/rmin-cloudsql-runpartman_function-source.zip"
  bucket       = var.rmin_template_bucket
  source       = "${path.module}/function_sources/rmin-cloudsql-runpartman_function-source.zip"
  content_type = "application/x-zip-compressed"
}

# Used to upload mics extract function source code to gcs bucket
resource "google_storage_bucket_object" "rmin_cloud_mics_extract_function_zip_file" {
  name         = "templates/functions/rmin-cloud-mics-extract-function.zip"
  bucket       = var.rmin_template_bucket
  source       = "${path.module}/function_sources/rmin-cloud-mics-extract-function.zip"
  content_type = "application/x-zip-compressed"

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0
}

# Used to upload subscriber update function source code to gcs bucket
resource "google_storage_bucket_object" "rmin_cloud_subscriber_update_func_zip_file" {
  name         = var.subscriber_update_function_zip_file_name
  bucket       = var.rmin_template_bucket
  source       = "${path.module}/function_sources/rmin-cloud-subscriber-update-func-main.zip"
  content_type = "application/x-zip-compressed"

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0
}

# Used to upload image dimension function source code to gcs bucket
resource "google_storage_bucket_object" "rmin_cloud_image_dimension_func_zip_file" {
  name         = var.image_dimension_zip_file_name
  bucket       = var.rmin_template_bucket
  source       = "${path.module}/function_sources/rmin-cloud-image-dimension-func-main.zip"
  content_type = "application/x-zip-compressed"
}

# Used to upload package notification trigger function source code to gcs bucket
resource "google_storage_bucket_object" "rmin_cloud_package_notification_trigger_zip_file" {
  name         = var.package_notification_trigger_function_zip_file_name
  bucket       = var.rmin_template_bucket
  source       = "${path.module}/function_sources/rmin-cloud-package-notification-trigger-main.zip"
  content_type = "application/x-zip-compressed"

  count = var.toggle_4583_5673_myusps_migration ? 1 : 0
}

# Used to upload function ZIP5 Timezone function source code to gcs bucket
resource "google_storage_bucket_object" "rmin_cloud_zip5_initiatives_sync_function_zip_file" {
  name         = "templates/functions/rmin-cloud-zip5-initiatives-sync-function.zip"
  bucket       = var.rmin_template_bucket
  source       = "${path.module}/function_sources/rmin-cloud-zip5-initiatives-sync-function.zip"
  content_type = "application/x-zip-compressed"

  count = var.toggle_4583_5681_consumer_portal ? 1 : 0
}

# Used to upload inbound package sync trigger function source code to gcs bucket
resource "google_storage_bucket_object" "rmin_cloud_inbound_package_sync_trigger_zip_file" {
  name         = var.inbound_package_sync_trigger_function_zip_file_name
  bucket       = var.rmin_template_bucket
  source       = "${path.module}/function_sources/rmin-cloud-inbound-package-sync-trigger-main.zip"
  content_type = "application/x-zip-compressed"

  count = var.toggle_4583_5690_ptr2 ? 1 : 0
}

# Used to upload package notification trigger function source code to gcs bucket
resource "google_storage_bucket_object" "rmin_cloud_added_package_notification_trigger_zip_file" {
  name         = "templates/functions/rmin-cloud-added-package-notification-trigger-main.zip"
  bucket       = var.rmin_template_bucket
  source       = "${path.module}/function_sources/rmin-cloud-added-package-notification-trigger-main.zip"
  content_type = "application/x-zip-compressed"

  count = var.toggle_4583_5680_frontend ? 1 : 0
}

# Used to upload redis check function source code to gcs bucket
resource "google_storage_bucket_object" "rmin_redis_func_zip_file" {
  name         = "templates/functions/rmin-cloud-redis-func-001.zip"
  bucket       = var.rmin_template_bucket
  source       = "${path.module}/function_sources/rmin-cloud-redis-func-001.zip"
  content_type = "application/x-zip-compressed"

}

# Used to upload process failed package notifications function source code to gcs bucket
resource "google_storage_bucket_object" "rmin_cloud_process_failed_package_notifications_zip_file" {
  name         = "templates/functions/rmin-cloud-process-failed-package-notifications-main.zip"
  bucket       = var.rmin_template_bucket
  source       = "${path.module}/function_sources/rmin-cloud-process-failed-package-notifications-main.zip"
  content_type = "application/x-zip-compressed"

  count = var.toggle_4583_5710_apigee_hybrid ? 1 : 0
}
resource "google_storage_bucket_object" "rmin_cloud_mdn_eng_feed_func_zip_file" {
  name         = "templates/functions/rmin-cloud-mdn-eng-feed-func.zip"
  bucket       = var.rmin_template_bucket
  source       = "${path.module}/function_sources/rmin-cloud-mdn-eng-feed-func.zip"
  content_type = "application/x-zip-compressed"

  count = var.toggle_4583_5708_mdn_to_eng ? 1 : 0

}

# [END google_storage_bucket_object]


# [START null_resource]

# [END null_resource]
