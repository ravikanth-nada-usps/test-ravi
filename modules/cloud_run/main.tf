# [START google_cloud_run_v2_service]

resource "google_cloud_run_v2_service" "rmin_cloud_dashboard_event_processor_run" {
  name     = "rmin-cloud-dashboard-event-processor-run"
  location = "us-central1"
  ingress  = "INGRESS_TRAFFIC_INTERNAL_ONLY"

  template {
    scaling {
      max_instance_count = var.dashboard_event_max_instance_count
      min_instance_count = var.dashboard_event_min_instance_count
    }
    vpc_access {
      connector = var.vpc_connector
      egress    = "ALL_TRAFFIC"
    }

    service_account                  = var.dashboard_event_service_account
    execution_environment            = var.dashboard_event_execution_environment
    max_instance_request_concurrency = var.dashboard_event_max_instance_request_concurrency
    timeout                          = var.dashboard_event_timeout

    containers {

      image = var.dashboard_event_version == "" ? "us-docker.pkg.dev/cloudrun/container/hello" : format("%s:%s", var.dashboard_event_image_location, var.dashboard_event_version)


      env {
        name  = "spring.profiles.active"
        value = var.spring_profile
      }
      env {
        name  = "firestore.expiryDays"
        value = var.firestore_expiry_days
      }
      env {
        name  = "firestore.databaseId"
        value = var.dashboard_db_name
      }
      env {
        name  = "trace.ratio"
        value = var.dashboard_event_trace_ratio
      }
      env {
        name  = "trace.sample"
        value = var.dashboard_event_trace_sample
      }
      env {
        name  = "toggle.smartParcelLocker"
        value = var.dashboard_toggle_parcel_locker
      }
      env {
        name  = "zip5.done.topicId"
        value = var.dashboard_zip5_done_topic
      }
      env {
        name  = "toggle.sendToLockerAndInbound"
        value = var.dashboard_toggle_send_to_locker_and_inbound
      }
      env {
        name  = "toggle.uspsPossessionIndToggle"
        value = var.dashboard_toggle_usps_possession_ind
      }

      resources {
        limits = {
          cpu    = var.dashboard_event_cpu_value
          memory = var.dashboard_event_memory_value
        }

        startup_cpu_boost = "true"
        cpu_idle          = var.dashboard_event_cpu_idle
      }
      ports {
        container_port = 8080
      }
      startup_probe {
        initial_delay_seconds = 0
        timeout_seconds       = 240
        period_seconds        = 240
        failure_threshold     = 1
        tcp_socket {
          port = 8080
        }
      }
    }
  }

  traffic {
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
    percent = 100
  }
}

resource "google_cloud_run_v2_service" "rmin_cloud_subscriber_api" {
  name     = "rmin-cloud-subscriber-api"
  location = "us-central1"
  ingress  = "INGRESS_TRAFFIC_ALL"

  template {
    scaling {
      max_instance_count = var.subscriber_api_max_instance_count
      min_instance_count = var.subscriber_api_min_instance_count
    }
    vpc_access {
      connector = var.subscriber_vpc_connector
      egress    = "ALL_TRAFFIC"
    }

    service_account                  = var.subscriber_api_service_account
    execution_environment            = var.subscriber_api_execution_environment
    max_instance_request_concurrency = var.subscriber_api_max_instance_request_concurrency
    timeout                          = var.subscriber_api_timeout

    containers {

      image = var.subscriber_api_version == "" ? "us-docker.pkg.dev/cloudrun/container/hello" : format("%s:%s", var.subscriber_api_image_location, var.subscriber_api_version)


      env {
        name  = "spring.profiles.active"
        value = var.spring_profile
      }
      env {
        name  = "app.databaseId"
        value = var.subscribers_db_name
      }
      env {
        name  = "app.loggingTopic"
        value = var.subscriber_api_log_topic
      }
      env {
        name  = "app.digestOptInLoggingTopic"
        value = var.digest_opt_out_reason_topic
      }
      env {
        name  = "app.zip5InitiativeCache"
        value = var.zip5_initiative_cache_ip
      }

      env {
        name  = "app.proxy.baseUrl"
        value = google_cloud_run_v2_service.rmin_cloud_eagan_proxy[0].uri
      }

      env {
        name  = "app.subscriberOptInSettingsTopic"
        value = var.subscriber_opt_in_settings_topic
      }

      resources {
        limits = {
          cpu    = var.subscriber_api_cpu_value
          memory = var.subscriber_api_memory_value
        }

        startup_cpu_boost = "true"
        cpu_idle          = var.subscriber_api_cpu_idle
      }
      ports {
        container_port = 8080
      }
      startup_probe {
        initial_delay_seconds = 0
        timeout_seconds       = 240
        period_seconds        = 240
        failure_threshold     = 1
        tcp_socket {
          port = 8080
        }
      }
    }
  }

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0

  traffic {
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
    percent = 100
  }
}

resource "google_cloud_run_v2_service" "rmin_cloud_subscriber_event" {
  name     = "rmin-cloud-subscriber-event"
  location = "us-central1"
  ingress  = "INGRESS_TRAFFIC_INTERNAL_ONLY"

  template {
    scaling {
      max_instance_count = var.subscriber_event_max_instance_count
      min_instance_count = var.subscriber_event_min_instance_count
    }
    vpc_access {
      connector = var.subscriber_vpc_connector
      egress    = "ALL_TRAFFIC"
    }

    service_account                  = var.subscriber_event_service_account
    execution_environment            = var.subscriber_event_execution_environment
    max_instance_request_concurrency = var.subscriber_event_max_instance_request_concurrency
    timeout                          = var.subscriber_event_timeout

    containers {

      image = var.subscriber_event_version == "" ? "us-docker.pkg.dev/cloudrun/container/hello" : format("%s:%s", var.subscriber_event_image_location, var.subscriber_event_version)


      env {
        name  = "spring.profiles.active"
        value = var.spring_profile
      }
      env {
        name  = "firestore.expiryDays"
        value = var.firestore_subscriber_expiry_days
      }
      env {
        name  = "firestore.databaseId"
        value = var.subscribers_db_name
      }
      env {
        name  = "spring.cloud.gcp.firestore.database-id"
        value = var.subscribers_db_name
      }

      resources {
        limits = {
          cpu    = var.subscriber_event_cpu_value
          memory = var.subscriber_event_memory_value
        }

        startup_cpu_boost = "true"
        cpu_idle          = var.subscriber_event_cpu_idle
      }
      ports {
        container_port = 8080
      }
      startup_probe {
        initial_delay_seconds = 0
        timeout_seconds       = 240
        period_seconds        = 240
        failure_threshold     = 1
        tcp_socket {
          port = 8080
        }
      }
    }
  }

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0

  traffic {
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
    percent = 100
  }
}

resource "google_cloud_run_v2_service" "rmin_cloud_dashboard_api" {
  name     = "rmin-cloud-dashboard-api"
  location = "us-central1"
  ingress  = "INGRESS_TRAFFIC_ALL"

  template {
    scaling {
      max_instance_count = var.dashboard_api_max_instance_count
      min_instance_count = var.dashboard_api_min_instance_count
    }
    vpc_access {
      connector = var.vpc_connector
      egress    = "ALL_TRAFFIC"
    }

    service_account                  = var.dashboard_api_service_account
    execution_environment            = var.dashboard_api_execution_environment
    max_instance_request_concurrency = var.dashboard_api_max_instance_request_concurrency
    timeout                          = var.dashboard_api_timeout

    containers {

      image = var.dashboard_api_version == "" ? "us-docker.pkg.dev/cloudrun/container/hello" : format("%s:%s", var.dashboard_api_image_location, var.dashboard_api_version)

      env {
        name  = "SPRING_PROFILES_ACTIVE"
        value = var.spring_profile
      }
      env {
        name  = "app.mailCampaignCache"
        value = coalesce(var.mailCampaignCache_read_ext_ip, var.mailCampaignCache_ext_ip)
      }
      env {
        name  = "app.packageCampaignCache"
        value = coalesce(var.packageCampaignCache_read_ext_ip, var.packageCampaignCache_ext_ip)
      }
      env {
        name  = "app.internalImageApiUrl"
        value = google_cloud_run_v2_service.rmin_cloud_image_api.uri
      }
      env {
        name  = "app.mailCampaignImageBucket"
        value = var.mail_campaign_image_bucket_ext
      }
      env {
        name  = "app.packageCampaignImageBucket"
        value = var.package_campaign_image_bucket_ext
      }
      env {
        name  = "app.loggingTopic"
        value = var.dashboard_api_logs_topic_name
      }
      env {
        name  = "app.databaseId"
        value = var.dashboard_db_name
      }
      env {
        name  = "app.externalImageApiUrl"
        value = var.image_api_external_url
      }

      env {
        name  = "app.mailTrackingCloudUrlToggle"
        value = var.dashboard_api_toggle_mail_tracking_cloud_url
      }

      env {
        name  = "app.proxy.baseUrl"
        value = google_cloud_run_v2_service.rmin_cloud_eagan_proxy[0].uri
      }

      env {
        name  = "app.toggleFraudLogic"
        value = var.dashboard_api_toggle_fraud_logic_external
      }

      env {
        name  = "app.toggleParcelLogic"
        value = var.dashboard_api_toggle_parcel_logic_external
      }

      env {
        name  = "app.projectId"
        value = var.project_id
      }

      resources {
        limits = {
          cpu    = var.dashboard_api_cpu_value
          memory = var.dashboard_api_memory_value
        }

        startup_cpu_boost = "true"
        cpu_idle          = var.dashboard_api_cpu_idle
      }
      ports {
        container_port = 8080
      }
      startup_probe {
        initial_delay_seconds = 0
        timeout_seconds       = 240
        period_seconds        = 240
        failure_threshold     = 1
        tcp_socket {
          port = 8080
        }
      }
    }
  }

  traffic {
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
    percent = 100
  }
}

//Prob needs to have its own set of variables, but for times sake just adding the necessary ones for consumer portal
resource "google_cloud_run_v2_service" "rmin_cloud_dashboard_api_internal" {
  name     = "rmin-cloud-dashboard-api-internal"
  location = "us-central1"
  ingress  = "INGRESS_TRAFFIC_INTERNAL_ONLY"

  template {
    scaling {
      max_instance_count = var.dashboard_api_internal_max_instance_count
      min_instance_count = var.dashboard_api_internal_min_instance_count
    }
    vpc_access {
      connector = var.api_vpc_connector
      egress    = "ALL_TRAFFIC"
    }

    service_account                  = var.dashboard_api_service_account
    execution_environment            = var.dashboard_api_execution_environment
    max_instance_request_concurrency = var.dashboard_api_internal_max_instance_request_concurrency
    timeout                          = var.dashboard_api_internal_timeout

    containers {

      image = var.dashboard_api_internal_version == "" ? "us-docker.pkg.dev/cloudrun/container/hello" : format("%s:%s", var.dashboard_api_image_location, var.dashboard_api_internal_version)

      env {
        name  = "SPRING_PROFILES_ACTIVE"
        value = var.spring_profile
      }
      env {
        name  = "app.mailCampaignCache"
        value = coalesce(var.mailCampaignCache_read_ip, var.mailCampaignCache_ip)
      }
      env {
        name  = "app.packageCampaignCache"
        value = coalesce(var.packageCampaignCache_read_ip, var.packageCampaignCache_ip)
      }
      env {
        name  = "app.internalImageApiUrl"
        value = google_cloud_run_v2_service.rmin_cloud_image_api.uri
      }
      env {
        name  = "app.mailCampaignImageBucket"
        value = var.mail_campaign_image_bucket
      }
      env {
        name  = "app.packageCampaignImageBucket"
        value = var.package_campaign_image_bucket
      }
      env {
        name  = "app.loggingTopic"
        value = var.dashboard_api_logs_topic_name
      }
      env {
        name  = "app.databaseId"
        value = var.dashboard_db_name
      }

      env {
        name  = "app.mailTrackingCloudUrlToggle"
        value = var.dashboard_api_toggle_mail_tracking_cloud_url
      }

      env {
        name  = "app.toggleFraudLogic"
        value = var.dashboard_api_toggle_fraud_logic_internal
      }

      env {
        name  = "app.toggleParcelLogic"
        value = var.dashboard_api_toggle_parcel_logic_internal
      }

      env {
        name  = "app.encryptPremDigestCampaignClicks"
        value = var.dashboard_api_toggle_ecrypt_prem_digest_campaign_clicks
      }

      resources {
        limits = {
          cpu    = var.dashboard_api_internal_cpu_value
          memory = var.dashboard_api_internal_memory_value
        }

        startup_cpu_boost = "true"
        cpu_idle          = var.dashboard_api_internal_cpu_idle
      }
      ports {
        container_port = 8080
      }
      startup_probe {
        initial_delay_seconds = 0
        timeout_seconds       = 240
        period_seconds        = 240
        failure_threshold     = 1
        tcp_socket {
          port = 8080
        }
      }
    }
  }

  traffic {
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
    percent = 100
  }
}

resource "google_cloud_run_v2_service" "rmin_cloud_eagan_proxy" {
  name     = "rmin-cloud-eagan-proxy"
  location = "us-central1"
  ingress  = "INGRESS_TRAFFIC_INTERNAL_ONLY"

  template {
    scaling {
      max_instance_count = var.eagan_proxy_max_instance_count
      min_instance_count = var.eagan_proxy_min_instance_count
    }
    vpc_access {
      connector = var.package_vpc_connector
      egress    = "ALL_TRAFFIC"
    }

    service_account                  = var.eagan_proxy_service_account
    execution_environment            = var.eagan_proxy_execution_environment
    max_instance_request_concurrency = var.eagan_proxy_max_instance_request_concurrency
    timeout                          = var.eagan_proxy_timeout

    containers {

      image = var.eagan_proxy_version == "" ? "us-docker.pkg.dev/cloudrun/container/hello" : format("%s:%s", var.eagan_proxy_image_location, var.eagan_proxy_version)

      env {
        name  = "SPRING_PROFILES_ACTIVE"
        value = var.spring_profile
      }

      env {
        name  = "app.loggingTopic"
        value = var.eagan_proxy_logs_topic_name
      }

      resources {
        limits = {
          cpu    = var.eagan_proxy_cpu_value
          memory = var.eagan_proxy_memory_value
        }

        startup_cpu_boost = "true"
        cpu_idle          = var.eagan_proxy_cpu_idle
      }
      ports {
        container_port = 8080
      }
      startup_probe {
        initial_delay_seconds = 0
        timeout_seconds       = 240
        period_seconds        = 240
        failure_threshold     = 1
        tcp_socket {
          port = 8080
        }
      }
    }
  }

  count = var.toggle_4583_5681_consumer_portal ? 1 : 0

  traffic {
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
    percent = 100
  }
}

resource "google_cloud_run_v2_service" "rmin_cloud_image_api" {
  name     = "rmin-cloud-image-api"
  location = "us-central1"
  ingress  = "INGRESS_TRAFFIC_ALL"

  template {
    scaling {
      max_instance_count = var.image_api_max_instance_count
      min_instance_count = var.image_api_min_instance_count
    }
    vpc_access {
      connector = var.vpc_connector
      egress    = "ALL_TRAFFIC"
    }

    service_account                  = var.image_api_service_account
    execution_environment            = var.image_api_execution_environment
    max_instance_request_concurrency = var.image_api_max_instance_request_concurrency
    timeout                          = var.image_api_timeout

    containers {

      image = var.image_api_version == "" ? "us-docker.pkg.dev/cloudrun/container/hello" : format("%s:%s", var.image_api_image_location, var.image_api_version)

      env {
        name  = "SPRING_PROFILES_ACTIVE"
        value = var.spring_profile
      }
      env {
        name  = "app.decryptionKey"
        value = var.dashboard_api_decryptionKey
      }
      env {
        name  = "app.mailCampaignImageBucket"
        value = var.mail_campaign_image_bucket_ext
      }
      env {
        name  = "app.packageCampaignImageBucket"
        value = var.package_campaign_image_bucket_ext
      }
      env {
        name  = "app.loggingTopic"
        value = var.image_api_logs_topic_name
      }
      env {
        name  = "app.subscriberDropboxBucket"
        value = var.subscriber_dropbox_bucket
      }
      resources {
        limits = {
          cpu    = var.image_api_cpu_value
          memory = var.image_api_memory_value
        }

        startup_cpu_boost = "true"
        cpu_idle          = var.image_api_cpu_idle
      }
      ports {
        container_port = 8080
      }
      startup_probe {
        initial_delay_seconds = 0
        timeout_seconds       = 240
        period_seconds        = 240
        failure_threshold     = 1
        tcp_socket {
          port = 8080
        }
      }
    }
  }

  traffic {
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
    percent = 100
  }
}

resource "google_cloud_run_v2_service" "rmin_cloud_login_api" {
  name     = "rmin-cloud-login-api"
  location = "us-central1"
  ingress  = "INGRESS_TRAFFIC_ALL"

  template {
    scaling {
      max_instance_count = var.login_api_max_instance_count
      min_instance_count = var.login_api_min_instance_count
    }
    vpc_access {
      connector = var.vpc_connector
      egress    = "ALL_TRAFFIC"
    }

    service_account                  = var.login_api_service_account
    execution_environment            = var.login_api_execution_environment
    max_instance_request_concurrency = var.login_api_max_instance_request_concurrency
    timeout                          = var.login_api_timeout

    containers {

      image = var.login_api_version == "" ? "us-docker.pkg.dev/cloudrun/container/hello" : format("%s:%s", var.login_api_image_location, var.login_api_version)

      env {
        name  = "SPRING_PROFILES_ACTIVE"
        value = var.spring_profile
      }

      env {
        name  = "app.bqTopic"
        value = var.login_api_logs_topic
      }

      env {
        name  = "app.projectID"
        value = var.project_id
      }

      env {
        name  = "app.firestoreTopic"
        value = var.subscriber_event_topic
      }

      resources {
        limits = {
          cpu    = var.login_api_cpu_value
          memory = var.login_api_memory_value
        }

        startup_cpu_boost = "true"
        cpu_idle          = var.login_api_cpu_idle
      }
      ports {
        container_port = 8080
      }
      startup_probe {
        initial_delay_seconds = 0
        timeout_seconds       = 240
        period_seconds        = 240
        failure_threshold     = 1
        tcp_socket {
          port = 8080
        }
      }
    }
  }

  count = var.toggle_4583_5681_consumer_portal ? 1 : 0

  traffic {
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
    percent = 100
  }
}

resource "google_cloud_run_v2_service" "rmin_mics_subscriber_extract" {
  name     = "rmin-cloud-mics-subscriber-extract"
  location = "us-central1"
  ingress  = "INGRESS_TRAFFIC_INTERNAL_ONLY"

  template {
    scaling {
      max_instance_count = var.mics_subscriber_max_instance_count
      min_instance_count = var.mics_subscriber_min_instance_count
    }
    vpc_access {
      connector = var.subscriber_vpc_connector
      egress    = "ALL_TRAFFIC"
    }

    service_account                  = var.mics_subscriber_service_account
    execution_environment            = var.mics_subscriber_execution_environment
    max_instance_request_concurrency = var.mics_subscriber_max_instance_request_concurrency
    timeout                          = var.mics_subscriber_timeout

    containers {

      image = var.mics_subscriber_version == "" ? "us-docker.pkg.dev/cloudrun/container/hello" : format("%s:%s", var.mics_subscriber_image_location, var.mics_subscriber_version)

      env {
        name  = "SPRING_PROFILES_ACTIVE"
        value = var.spring_profile
      }
      env {
        name  = "app.outputBucket"
        value = var.mics_subscriber_bucket
      }
      env {
        name  = "app.projectId"
        value = var.project_id
      }
      env {
        name  = "app.outputDataset"
        value = var.dataset
      }
      env {
        name  = "app.outputTable"
        value = var.mics_subscriber_table
      }
      env {
        name  = "app.subscriberCache"
        value = var.subscriber_cache_ip
      }

      resources {
        limits = {
          cpu    = var.mics_subscriber_cpu_value
          memory = var.mics_subscriber_memory_value
        }

        startup_cpu_boost = "true"
        cpu_idle          = var.mics_subscriber_cpu_idle
      }
      ports {
        container_port = 8080
      }
      startup_probe {
        initial_delay_seconds = 0
        timeout_seconds       = 240
        period_seconds        = 240
        failure_threshold     = 1
        tcp_socket {
          port = 8080
        }
      }
    }
  }

  traffic {
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
    percent = 100
  }

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0
}

resource "google_cloud_run_v2_service" "rmin_cloud_package_api" {
  name     = "rmin-cloud-package-api"
  location = "us-central1"
  ingress  = "INGRESS_TRAFFIC_ALL"

  template {
    scaling {
      max_instance_count = var.package_api_max_instance_count
      min_instance_count = var.package_api_min_instance_count
    }
    vpc_access {
      connector = var.vpc_connector
      egress    = "ALL_TRAFFIC"
    }

    service_account                  = var.package_api_service_account
    execution_environment            = var.package_api_execution_environment
    max_instance_request_concurrency = var.package_api_max_instance_request_concurrency
    timeout                          = var.package_api_timeout

    containers {

      image = var.package_api_version == "" ? "us-docker.pkg.dev/cloudrun/container/hello" : format("%s:%s", var.package_api_image_location, var.package_api_version)

      env {
        name  = "SPRING_PROFILES_ACTIVE"
        value = var.spring_profile
      }
      env {
        name  = "app.loggingTopic"
        value = var.package_api_logs_topic
      }
      env {
        name  = "app.ivsAppName"
        value = var.spring_profile == "00p" || var.spring_profile == "00c" || var.spring_profile == "01c" ? "InformedDelivery" : "DotCom"
      }
      env {
        name  = "app.uspsBaseUrl"
        value = var.package_api_usps_base_url
      }

      env {
        name  = "app.proxy.baseUrl"
        value = google_cloud_run_v2_service.rmin_cloud_eagan_proxy[0].uri
      }

      env {
        name  = "app.subscriberCache"
        value = var.subscriber_cache_ip
      }

      resources {
        limits = {
          cpu    = var.package_api_cpu_value
          memory = var.package_api_memory_value
        }

        startup_cpu_boost = "true"
        cpu_idle          = var.package_api_cpu_idle
      }
      ports {
        container_port = 8080
      }
      startup_probe {
        initial_delay_seconds = 0
        timeout_seconds       = 240
        period_seconds        = 240
        failure_threshold     = 1
        tcp_socket {
          port = 8080
        }
      }
    }
  }

  traffic {
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
    percent = 100
  }

  count = var.toggle_4583_5673_myusps_migration ? 1 : 0
}

resource "google_cloud_run_v2_service" "rmin_cloud_package_event_processor" {
  name     = "rmin-cloud-package-event-processor"
  location = "us-central1"
  ingress  = "INGRESS_TRAFFIC_INTERNAL_ONLY"

  template {
    scaling {
      max_instance_count = var.package_event_max_instance_count
      min_instance_count = var.package_event_min_instance_count
    }
    vpc_access {
      connector = var.rmin_peripheral_connector
      egress    = "ALL_TRAFFIC"
    }

    service_account                  = var.package_event_service_account
    execution_environment            = var.package_event_execution_environment
    max_instance_request_concurrency = var.package_event_max_instance_request_concurrency
    timeout                          = var.package_event_timeout

    containers {

      image = var.package_event_version == "" ? "us-docker.pkg.dev/cloudrun/container/hello" : format("%s:%s", var.package_event_image_location, var.package_event_version)

      env {
        name  = "SPRING_PROFILES_ACTIVE"
        value = var.spring_profile
      }

      env {
        name  = "app.projectId"
        value = var.project_id
      }

      env {
        name  = "firestore.databaseId"
        value = var.dashboard_db_name
      }

      resources {
        limits = {
          cpu    = var.package_event_cpu_value
          memory = var.package_event_memory_value
        }

        startup_cpu_boost = "true"
        cpu_idle          = var.package_event_cpu_idle
      }
      ports {
        container_port = 8080
      }
      startup_probe {
        initial_delay_seconds = 0
        timeout_seconds       = 240
        period_seconds        = 240
        failure_threshold     = 1
        tcp_socket {
          port = 8080
        }
      }
    }
  }

  traffic {
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
    percent = 100
  }

  count = var.toggle_4583_5673_myusps_migration ? 1 : 0
}

resource "google_cloud_run_v2_service" "rmin_cloud_package_notification_processor" {
  name     = "rmin-cloud-package-notification-processor"
  location = "us-central1"
  ingress  = "INGRESS_TRAFFIC_INTERNAL_ONLY"

  template {
    scaling {
      max_instance_count = var.package_notification_max_instance_count
      min_instance_count = var.package_notification_min_instance_count
    }
    vpc_access {
      connector = var.package_vpc_connector
      egress    = "ALL_TRAFFIC"
    }

    service_account                  = var.package_notification_service_account
    execution_environment            = var.package_notification_execution_environment
    max_instance_request_concurrency = var.package_notification_max_instance_request_concurrency
    timeout                          = var.package_notification_timeout

    containers {

      image = var.package_notification_version == "" ? "us-docker.pkg.dev/cloudrun/container/hello" : format("%s:%s", var.package_notification_image_location, var.package_notification_version)

      env {
        name  = "SPRING_PROFILES_ACTIVE"
        value = var.spring_profile
      }

      env {
        name  = "app.projectID"
        value = var.project_id
      }

      env {
        name  = "app.topicID"
        value = var.package_notification_logs_topic
      }

      env {
        name  = "app.authToggle"
        value = true
      }

      resources {
        limits = {
          cpu    = var.package_notification_cpu_value
          memory = var.package_notification_memory_value
        }

        startup_cpu_boost = "true"
        cpu_idle          = var.package_notification_cpu_idle
      }
      ports {
        container_port = 8080
      }
      startup_probe {
        initial_delay_seconds = 0
        timeout_seconds       = 240
        period_seconds        = 240
        failure_threshold     = 1
        tcp_socket {
          port = 8080
        }
      }
    }
  }

  traffic {
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
    percent = 100
  }

  count = var.toggle_4583_5673_myusps_migration ? 1 : 0
}

resource "google_cloud_run_v2_service" "rmin_cloud_package_sms_notification_processor" {
  name     = "rmin-cloud-package-sms-notification-processor"
  location = "us-central1"
  ingress  = "INGRESS_TRAFFIC_INTERNAL_ONLY"

  template {
    scaling {
      max_instance_count = var.package_notification_sms_max_instance_count
      min_instance_count = var.package_notification_sms_min_instance_count
    }
    vpc_access {
      connector = var.package_vpc_connector
      egress    = "ALL_TRAFFIC"
    }

    service_account                  = var.package_notification_service_account
    execution_environment            = var.package_notification_sms_execution_environment
    max_instance_request_concurrency = var.package_notification_sms_max_instance_request_concurrency
    timeout                          = var.package_notification_sms_timeout

    containers {

      image = var.package_notification_version == "" ? "us-docker.pkg.dev/cloudrun/container/hello" : format("%s:%s", var.package_notification_image_location, var.package_notification_version)

      env {
        name  = "SPRING_PROFILES_ACTIVE"
        value = var.spring_profile
      }

      env {
        name  = "app.projectID"
        value = var.project_id
      }

      env {
        name  = "app.topicID"
        value = var.package_notification_logs_topic
      }

      env {
        name  = "app.authToggle"
        value = true
      }

      resources {
        limits = {
          cpu    = var.package_notification_sms_cpu_value
          memory = var.package_notification_sms_memory_value
        }

        startup_cpu_boost = "true"
        cpu_idle          = var.package_notification_sms_cpu_idle
      }
      ports {
        container_port = 8080
      }
      startup_probe {
        initial_delay_seconds = 0
        timeout_seconds       = 240
        period_seconds        = 240
        failure_threshold     = 1
        tcp_socket {
          port = 8080
        }
      }
    }
  }

  traffic {
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
    percent = 100
  }

  count = var.toggle_4583_5710_apigee_hybrid ? 1 : 0
}

resource "google_cloud_run_v2_service" "rmin_cloud_package_notification_update_processor" {
  name     = "rmin-cloud-package-notification-update-processor"
  location = "us-central1"
  ingress  = "INGRESS_TRAFFIC_INTERNAL_ONLY"

  template {
    scaling {
      max_instance_count = var.package_notification_update_max_instance_count
      min_instance_count = var.package_notification_update_min_instance_count
    }
    vpc_access {
      connector = var.rmin_peripheral_connector
      egress    = "ALL_TRAFFIC"
    }

    service_account                  = var.package_notification_update_service_account
    execution_environment            = var.package_notification_update_execution_environment
    max_instance_request_concurrency = var.package_notification_update_max_instance_request_concurrency
    timeout                          = var.package_notification_update_timeout

    containers {

      image = var.package_notification_update_version == "" ? "us-docker.pkg.dev/cloudrun/container/hello" : format("%s:%s", var.package_notification_update_image_location, var.package_notification_update_version)

      env {
        name  = "SPRING_PROFILES_ACTIVE"
        value = var.spring_profile
      }

      env {
        name  = "spring.cloud.gcp.project-id"
        value = var.project_id
      }

      env {
        name  = "firestore.databaseId"
        value = var.dashboard_db_name
      }

      env {
        name  = "pubsub.topic"
        value = var.package_notification_topic
      }

      env {
        name  = "pubsub.smsTopic"
        value = var.package_sms_notification_topic
      }

      env {
        name  = "toggle.publishSmsMessage"
        value = var.toggle_4583_5710_apigee_hybrid
      }

      resources {
        limits = {
          cpu    = var.package_notification_update_cpu_value
          memory = var.package_notification_update_memory_value
        }

        startup_cpu_boost = "true"
        cpu_idle          = var.package_notification_cpu_idle
      }
      ports {
        container_port = 8080
      }
      startup_probe {
        initial_delay_seconds = 0
        timeout_seconds       = 240
        period_seconds        = 240
        failure_threshold     = 1
        tcp_socket {
          port = 8080
        }
      }
    }
  }

  traffic {
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
    percent = 100
  }

  count = var.toggle_4583_5673_myusps_migration ? 1 : 0
}

resource "google_cloud_run_v2_service" "rmin_cloud_mc_report_service" {
  name     = "rmin-cloud-mc-report-service"
  location = "us-central1"
  ingress  = "INGRESS_TRAFFIC_INTERNAL_ONLY"

  template {
    scaling {
      max_instance_count = var.mc_report_max_instance_count
      min_instance_count = var.mc_report_min_instance_count
    }
    vpc_access {
      connector = var.rmin_peripheral_connector
      egress    = "ALL_TRAFFIC"
    }

    service_account                  = var.mc_report_service_account
    execution_environment            = var.mc_report_execution_environment
    max_instance_request_concurrency = var.mc_report_max_instance_request_concurrency
    timeout                          = var.mc_report_timeout

    containers {

      image = var.mc_report_version == "" ? "us-docker.pkg.dev/cloudrun/container/hello" : format("%s:%s", var.mc_report_image_location, var.mc_report_version)


      env {
        name  = "spring.profiles.active"
        value = var.spring_profile
      }

      env {
        name  = "outputDataset"
        value = var.dataset
      }

      env {
        name  = "cloudMailCampaignReportingJobLogsBQTable"
        value = var.mc_cloud_mail_campaign_reporting_job_logs_bq_table
      }

      env {
        name  = "mailCampaignRedisHost"
        value = coalesce(var.mailCampaignCache_read_ip, var.mailCampaignCache_ip)
      }

      env {
        name  = "projectId"
        value = var.project_id
      }

      env {
        name  = "mailCampaignFirestoreDB"
        value = var.mc_mail_campaign_firestore_db
      }

      env {
        name  = "poCampaignReportingTopicName"
        value = var.mc_po_campaign_reporting_topic_name
      }


      resources {
        limits = {
          cpu    = var.mc_report_cpu_value
          memory = var.mc_report_memory_value
        }

        startup_cpu_boost = "true"
        cpu_idle          = var.mc_report_cpu_idle
      }
      ports {
        container_port = 8080
      }
      startup_probe {
        initial_delay_seconds = 0
        timeout_seconds       = 240
        period_seconds        = 240
        failure_threshold     = 1
        tcp_socket {
          port = 8080
        }
      }
    }
  }

  traffic {
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
    percent = 100
  }
}

resource "google_cloud_run_v2_service" "rmin_cloud_mc_api" {
  name     = "rmin-cloud-mc-api"
  location = "us-central1"
  ingress  = "INGRESS_TRAFFIC_ALL"

  template {
    scaling {
      max_instance_count = var.mc_report_max_instance_count
      min_instance_count = var.mc_report_min_instance_count
    }
    vpc_access {
      connector = var.rmin_peripheral_connector
      egress    = "ALL_TRAFFIC"
    }

    service_account                  = var.mc_api_service_account
    execution_environment            = var.mc_api_execution_environment
    max_instance_request_concurrency = var.mc_api_max_instance_request_concurrency
    timeout                          = var.mc_api_timeout

    containers {

      image = var.mc_api_version == "" ? "us-docker.pkg.dev/cloudrun/container/hello" : format("%s:%s", var.mc_api_image_location, var.mc_api_version)


      env {
        name  = "spring.profiles.active"
        value = var.spring_profile
      }

      env {
        name  = "toggleSummaryReportByDetailRecords"
        value = var.mc_api_toggle_summary_by_detail
      }


      resources {
        limits = {
          cpu    = var.mc_api_cpu_value
          memory = var.mc_api_memory_value
        }

        startup_cpu_boost = "true"
        cpu_idle          = var.mc_api_cpu_idle
      }
      ports {
        container_port = 8080
      }
      startup_probe {
        initial_delay_seconds = 0
        timeout_seconds       = 240
        period_seconds        = 240
        failure_threshold     = 1
        tcp_socket {
          port = 8080
        }
      }
    }
  }

  traffic {
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
    percent = 100
  }

  count = var.toggle_4583_xxxx_mc_reporting ? 1 : 0

}

resource "google_cloud_run_v2_service" "rmin_cloud_qr_code_service" {
  name     = "rmin-cloud-qr-code-service"
  location = "us-central1"
  ingress  = "INGRESS_TRAFFIC_INTERNAL_ONLY"

  template {
    scaling {
      max_instance_count = var.qr_code_max_instance_count
      min_instance_count = var.qr_code_min_instance_count
    }

    service_account                  = var.qr_code_service_account
    execution_environment            = var.qr_code_execution_environment
    max_instance_request_concurrency = var.qr_code_max_instance_request_concurrency
    timeout                          = var.qr_code_timeout

    containers {

      image = var.qr_code_version == "" ? "us-docker.pkg.dev/cloudrun/container/hello" : format("%s:%s", var.qr_code_image_location, var.qr_code_version)


      env {
        name  = "spring.profiles.active"
        value = var.spring_profile
      }

      env {
        name  = "outputDataset"
        value = var.dataset
      }

      env {
        name  = "tableQRCodeRetrievalServiceLogs"
        value = var.qr_code_service_job_logs_bq_table
      }

      env {
        name  = "gcpProjectId"
        value = var.project_id
      }

      env {
        name  = "qrCodeRestEndPoint"
        value = var.qr_code_rest_endpoint
      }

      env {
        name  = "dashboardEventTopicName"
        value = var.dashboard_event_topic_name
      }

      env {
        name  = "qrCodeImageBucketName"
        value = var.qr_code_image_bucket_name
      }

      env {
        name  = "missingQrCodeRetry.toggle"
        value = var.qr_code_toggle_retry
      }

      env {
        name  = "uspsPossessionIndToggle.toggle"
        value = var.qr_code_toggle_usps_possession_ind
      }


      resources {
        limits = {
          cpu    = var.qr_code_cpu_value
          memory = var.qr_code_memory_value
        }

        startup_cpu_boost = "true"
        cpu_idle          = var.qr_code_cpu_idle
      }
      ports {
        container_port = 8080
      }
      startup_probe {
        initial_delay_seconds = 0
        timeout_seconds       = 240
        period_seconds        = 240
        failure_threshold     = 1
        tcp_socket {
          port = 8080
        }
      }
    }
  }

  traffic {
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
    percent = 100
  }

  count = var.toggle_4583_5666_redesign_phase2 ? 1 : 0
}

#new
resource "google_cloud_run_v2_service" "rmin_cloud_digest_tracking" {
  name     = "rmin-cloud-digest-tracking"
  location = "us-central1"
  ingress  = "INGRESS_TRAFFIC_INTERNAL_LOAD_BALANCER"

  template {
    scaling {
      max_instance_count = var.digest_tracking_max_instance_count
      min_instance_count = var.digest_tracking_min_instance_count
    }
    vpc_access {
      connector = var.rmin_peripheral_connector
      egress    = "ALL_TRAFFIC"
    }

    service_account                  = var.digest_tracking_service_account
    execution_environment            = var.digest_tracking_execution_environment
    max_instance_request_concurrency = var.digest_tracking_max_instance_request_concurrency
    timeout                          = var.digest_tracking_timeout

    containers {

      image = var.digest_tracking_version == "" ? "us-docker.pkg.dev/cloudrun/container/hello" : format("%s:%s", var.digest_tracking_image_location, var.digest_tracking_version)


      env {
        name  = "spring.profiles.active"
        value = var.spring_profile
      }

      env {
        name  = "outputDataset"
        value = var.dataset
      }

      env {
        name  = "pubsub.projectId"
        value = var.project_id
      }

      env {
        name  = "app.digestEventTopic"
        value = var.digest_tracking_event_topic
      }

      env {
        name  = "app.digestClickTopic"
        value = var.digest_tracking_click_topic
      }

      env {
        name  = "app.digestTrackingErrorTopic"
        value = var.digest_tracking_error_topic
      }

      env {
        name  = "app.mailCampaignClickEventTopic"
        value = var.digest_tracking_mc_click_data_sync_topic
      }

      env {
        name  = "app.app.mcClickTopic"
        value = var.digest_tracking_mc_click_topic
      }

      env {
        name  = "app.redirectHttpsEnvUrl"
        value = var.digest_tracking_redirect_https_env_url
      }

      env {
        name  = "app.cloudUrlEncryptedToggle"
        value = var.digest_tracking_cloud_url_encrypted_toggle
      }

      env {
        name  = "app.baseUrlRidealongClick"
        value = var.digest_tracking_base_url_ridealong_click
      }

      env {
        name  = "app.baseUrlClickTrack"
        value = var.digest_tracking_base_url_click_track
      }

      resources {
        limits = {
          cpu    = var.digest_tracking_cpu_value
          memory = var.digest_tracking_memory_value
        }

        startup_cpu_boost = "true"
        cpu_idle          = var.digest_tracking_cpu_idle
      }
      ports {
        container_port = 8080
      }
      startup_probe {
        initial_delay_seconds = 0
        timeout_seconds       = 240
        period_seconds        = 240
        failure_threshold     = 1
        tcp_socket {
          port = 8080
        }
      }
    }
  }

  traffic {
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
    percent = 100
  }

  count = var.toggle_4583_5666_redesign_phase2 ? 1 : 0
}

resource "google_cloud_run_v2_service" "rmin_cloud_consumer_portal_frontend" {
  name     = "rmin-cloud-consumer-portal-frontend"
  location = "us-central1"
  ingress  = "INGRESS_TRAFFIC_INTERNAL_LOAD_BALANCER"

  template {
    scaling {
      max_instance_count = var.consumer_portal_max_instance_count
      min_instance_count = var.consumer_portal_min_instance_count
    }
    vpc_access {
      connector = var.package_vpc_connector
      egress    = "ALL_TRAFFIC"
    }

    service_account                  = var.consumer_portal_service_account
    execution_environment            = var.consumer_portal_execution_environment
    max_instance_request_concurrency = var.consumer_portal_max_instance_request_concurrency
    timeout                          = var.consumer_portal_timeout

    containers {

      image = var.consumer_portal_version == "" ? "us-docker.pkg.dev/cloudrun/container/hello" : format("%s:%s", var.consumer_portal_image_location, var.consumer_portal_version)
      volume_mounts {
        name       = "global-elements"
        mount_path = "/var/global-elements"
      }

      env {
        name  = "SPRING_PROFILES_ACTIVE"
        value = var.spring_profile
      }

      resources {
        limits = {
          cpu    = var.consumer_portal_cpu_value
          memory = var.consumer_portal_memory_value
        }

        startup_cpu_boost = "true"
        cpu_idle          = var.consumer_portal_cpu_idle
      }
      ports {
        container_port = 8080
      }
      startup_probe {
        initial_delay_seconds = 0
        timeout_seconds       = 240
        period_seconds        = 240
        failure_threshold     = 1
        tcp_socket {
          port = 8080
        }
      }
    }

    volumes {
      name = "global-elements"
      gcs {
        bucket    = var.rmin_global_elements_bucket_c_name
        read_only = true
      }
    }
  }

  count = var.toggle_4583_5680_frontend ? 1 : 0

  traffic {
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
    percent = 100
  }
}

# [END google_cloud_run_v2_service]
