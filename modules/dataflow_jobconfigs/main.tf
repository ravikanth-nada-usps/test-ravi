# [START data] 
data "google_project" "project" {
  project_id = var.project_id
}

data "google_cloud_run_v2_service" "dashboard_api_internal" {
  name     = "rmin-cloud-dashboard-api-internal"
  location = "us-central1"
  project  = var.project_id
}

data "google_redis_instance" "rmin_subscriber_cache_c" {
  name    = "rmin-subscriber-cache-c-${var.name_suffix}"
  region  = "us-central1"
  project = var.project_id
}

data "google_sql_database_instance" "digest_db_instance" {
  name    = "idc-${var.environment}-rmin-digest"
  project = var.project_id
}

data "google_sql_database_instance" "mc_db_instance" {
  name    = "idc-${var.environment}-rmin-mail-campaign"
  project = var.project_id
}

data "google_sql_database_instance" "mdn_db_instance" {
  name    = "idc-${var.environment}-rmin-mail-delivery-notification-c"
  project = var.project_id
}

data "google_secret_manager_secret_version" "digest_db_user_secret_latest" {
  secret  = format("rmin-digest-%s-key", var.db_user)
  project = var.project_id
}

data "google_secret_manager_secret_version" "mc_db_user_secret_latest" {
  secret  = format("rmin-mail-campaign-%s-key", var.db_user)
  project = var.project_id
}

data "google_secret_manager_secret_version" "mdn_db_user_secret_latest" {
  secret  = format("rmin-mail-delivery-notification-%s-key-c", var.db_user)
  project = var.project_id
}

# [END data] 

# [START local_file] 

resource "local_file" "rmin_cloud_campaigns_config" {
  content = templatefile("${path.module}/templates/rmin-cloud-campaigns-config.tftpl", {
    rmin_saturation_data_cache_e_ip = data.google_redis_instance.rmin_subscriber_cache_c.host
    project_id                      = var.project_id
    environment                     = var.environment
    db_user                         = var.db_user
    mc_db_host_ip                   = data.google_sql_database_instance.mc_db_instance.private_ip_address
    project_num                     = data.google_project.project.number
    mc_db_user_secret_ver_num       = replace(data.google_secret_manager_secret_version.mc_db_user_secret_latest.name, "/.*versions./", "")
    }
  )
  filename = "${path.module}/jsons/rmin-cloud-campaigns-config-${var.spring_profile}-v${var.rmin_cloud_campaigns_config_version}.json"
}

resource "local_file" "rmin_cloud_locale_key_ingest_config" {
  content = templatefile("${path.module}/templates/rmin-cloud-locale-key-ingest-config.tftpl", {
    project_id                = var.project_id
    environment               = var.environment
    db_user                   = var.db_user
    mc_db_host_ip             = data.google_sql_database_instance.mc_db_instance.private_ip_address
    project_num               = data.google_project.project.number
    mc_db_user_secret_ver_num = replace(data.google_secret_manager_secret_version.mc_db_user_secret_latest.name, "/.*versions./", "")
    }
  )
  filename = "${path.module}/jsons/rmin-cloud-locale-key-ingest-config-${var.spring_profile}-v${var.rmin_cloud_locale_key_ingest_config_version}.json"
}

resource "local_file" "rmin_cloud_mdn_event_log_processor_config" {
  content = templatefile("${path.module}/templates/rmin-cloud-mdn-event-log-processor-config.tftpl", {
    project_id                 = var.project_id
    environment                = var.environment
    db_user                    = var.db_user
    mdn_db_host_ip             = data.google_sql_database_instance.mdn_db_instance.private_ip_address
    project_num                = data.google_project.project.number
    mdn_db_user_secret_ver_num = replace(data.google_secret_manager_secret_version.mdn_db_user_secret_latest.name, "/.*versions./", "")
    }
  )
  filename = "${path.module}/jsons/rmin-cloud-mdn-event-log-processor-config-${var.spring_profile}-v${var.rmin_cloud_mdn_event_log_processor_config_version}.json"
}

resource "local_file" "rmin_cloud_ninetynine_m_barcode_ingest_config" {
  content = templatefile("${path.module}/templates/rmin-cloud-ninetynine-m-barcode-ingest-config.tftpl", {
    project_id                = var.project_id
    environment               = var.environment
    db_user                   = var.db_user
    mc_db_host_ip             = data.google_sql_database_instance.mc_db_instance.private_ip_address
    project_num               = data.google_project.project.number
    mc_db_user_secret_ver_num = replace(data.google_secret_manager_secret_version.mc_db_user_secret_latest.name, "/.*versions./", "")
    }
  )
  filename = "${path.module}/jsons/rmin-cloud-ninetynine-m-barcode-ingest-config-${var.spring_profile}-v${var.rmin_cloud_ninetynine_m_barcode_ingest_config_version}.json"
}

resource "local_file" "rmin_cloud_digest_event_processor_config" {
  content = templatefile("${path.module}/templates/rmin-cloud-digest-event-processor-config.tftpl", {
    project_id                    = var.project_id
    name_suffix                   = var.name_suffix
    environment                   = var.environment
    db_user                       = var.db_user
    digest_db_host_ip             = data.google_sql_database_instance.digest_db_instance.private_ip_address
    project_num                   = data.google_project.project.number
    digest_db_user_secret_ver_num = replace(data.google_secret_manager_secret_version.digest_db_user_secret_latest.name, "/.*versions./", "")
    apiUrl                        = data.google_cloud_run_v2_service.dashboard_api_internal.uri
    }
  )
  filename = "${path.module}/jsons/rmin-cloud-digest-event-processor-config-${var.spring_profile}-v${var.rmin_cloud_digest_event_processor_config_version}.json"
}

# [END local_file] 
