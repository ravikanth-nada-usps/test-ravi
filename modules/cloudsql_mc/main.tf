# [START google_sql_database_instance] 

resource "google_sql_database_instance" "mc_db_instance" {
  database_version = "POSTGRES_14"
  name             = "idc-${var.environment}-rmin-mail-campaign"
  project          = var.project_id
  region           = "us-east4"
  root_password    = random_password.mc_db_instance_root_pwd.result
  settings {
    activation_policy           = "ALWAYS"
    availability_type           = var.mc_db_instance_availability_type
    deletion_protection_enabled = true

    backup_configuration {
      backup_retention_settings {
        retained_backups = var.mc_db_instance_retained_backups_count
        retention_unit   = "COUNT"
      }

      enabled                        = true
      location                       = "us"
      point_in_time_recovery_enabled = true
      start_time                     = "05:00"
      transaction_log_retention_days = var.mc_db_instance_log_rentention_days
    }

    disk_autoresize       = var.mc_db_instance_disk_autoresize
    disk_autoresize_limit = var.mc_db_instance_disk_autoresize_limit
    disk_size             = var.mc_db_instance_disk_size_gb
    disk_type             = "PD_SSD"

    insights_config {
      query_insights_enabled  = var.mc_db_instance_query_insights_enabled
      query_string_length     = var.mc_db_instance_query_string_length
      record_application_tags = var.mc_db_instance_record_application_tags
      record_client_address   = var.mc_db_instance_record_client_address
    }

    ip_configuration {
      ipv4_enabled                                  = "false"
      private_network                               = var.mc_db_instance_private_network
      require_ssl                                   = "true"
      ssl_mode                                      = "TRUSTED_CLIENT_CERTIFICATE_REQUIRED"
      allocated_ip_range                            = var.mc_db_instance_allocated_ip_range
      enable_private_path_for_google_cloud_services = true
    }

    database_flags {
      name  = "max_connections"
      value = "5000"
    }

    maintenance_window {
      day          = 7
      hour         = 18
      update_track = var.mc_db_instance_maint_update_track
    }

    tier    = var.mc_db_instance_tier
    edition = "ENTERPRISE"
  }

  lifecycle {
    ignore_changes = [settings[0].ip_configuration[0].allocated_ip_range, settings[0].backup_configuration[0].binary_log_enabled, settings[0].disk_size]
    precondition {
      condition     = (var.mc_db_instance_retained_backups_count >= var.mc_db_instance_log_rentention_days)
      error_message = "backup retention should be >= transaction log retention"
    }
  }
}

# [END google_sql_database_instance] 

# [START google_sql_database] 

resource "google_sql_database" "rmin_mc_db" {
  charset   = "UTF8"
  collation = "en_US.UTF8"
  instance  = google_sql_database_instance.mc_db_instance.name
  name      = "rmin_mail_campaign_db"
  project   = var.project_id
}

# [END google_sql_database] 

# [START google_sql_user] 
resource "google_sql_user" "rmin_mc_db_user" {
  name     = var.rmin_mc_db_user_name
  instance = google_sql_database_instance.mc_db_instance.name
  password = random_password.rmin_mc_db_user_pwd.result

  lifecycle {
    ignore_changes = [password]
  }
}

# [END google_sql_user] 

# [START google_sql_ssl_cert] 

resource "google_sql_ssl_cert" "mc_db_instance_cert" {
  common_name = "cloud-sql-mc-db-${var.project_id}"
  instance    = google_sql_database_instance.mc_db_instance.name
}

# [END google_sql_ssl_cert] 

# [START random_password] 

resource "random_password" "mc_db_instance_root_pwd" {
  length           = 16
  override_special = "#$_"
  special          = true
  lower            = true
  numeric          = true
  upper            = true
  min_upper        = 1
  min_numeric      = 1
  min_special      = 1
  lifecycle {
    ignore_changes = all
  }
}

resource "random_password" "rmin_mc_db_user_pwd" {
  length           = 16
  override_special = "#$_"
  special          = true
  lower            = true
  numeric          = true
  upper            = true
  min_upper        = 1
  min_numeric      = 1
  min_special      = 1
  lifecycle {
    ignore_changes = all
  }
}

# [END random_password] 

# [START google_secret_manager_secret] 

resource "google_secret_manager_secret" "rmin_mc_db_user_secret" {
  secret_id = format("rmin-mail-campaign-%s-key", var.rmin_mc_db_user_name)
  replication {
    user_managed {
      replicas {
        location = "us-east4"
      }
    }
  }
}

resource "google_secret_manager_secret" "mc_db_instance_root_serect" {
  secret_id = "rmin-mail-campaign-postgres-key"
  replication {
    user_managed {
      replicas {
        location = "us-east4"
      }
    }
  }
}

# [END google_secret_manager_secret] 

# [START google_secret_manager_secret_version] 
resource "google_secret_manager_secret_version" "rmin_mc_db_user_secret_latest" {
  secret      = google_secret_manager_secret.rmin_mc_db_user_secret.id
  secret_data = google_sql_user.rmin_mc_db_user.password

  lifecycle {
    ignore_changes = [secret_data]
  }
}


resource "google_secret_manager_secret_version" "mc_db_instance_root_serect_latest" {
  secret      = google_secret_manager_secret.mc_db_instance_root_serect.id
  secret_data = google_sql_database_instance.mc_db_instance.root_password
}

# [END google_secret_manager_secret_version] 

# [START google_bigquery_connection] 
resource "google_bigquery_connection" "rmin_mc_db_external_connection" {
  connection_id = "rmin_mail_campaign_db_connection"
  friendly_name = "RMIN Mail Campaign Cloud SQL External Connection"
  description   = "RMIN Mail Campaign Cloud SQL External Connection"
  location      = "us-east4"
  cloud_sql {
    instance_id = google_sql_database_instance.mc_db_instance.connection_name
    database    = google_sql_database.rmin_mc_db.name
    type        = "POSTGRES"
    credential {
      username = google_sql_user.rmin_mc_db_user.name
      password = google_sql_user.rmin_mc_db_user.password
    }
  }
}

# [END google_bigquery_connection] 
