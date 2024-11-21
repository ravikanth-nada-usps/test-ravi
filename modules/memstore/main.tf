# [START google_redis_instance]

resource "google_redis_instance" "rmin_mail_campaign_cache_c" {
  alternative_location_id = "us-central1-b"
  auth_enabled            = "false"
  authorized_network      = var.authorized_network
  connect_mode            = "PRIVATE_SERVICE_ACCESS"
  location_id             = "us-central1-a"
  memory_size_gb          = var.rmin_mail_campaign_cache_c_memory_size_gb
  name                    = "rmin-mail-campaign-cache-c-${var.name_suffix}"
  project                 = var.project_id
  redis_version           = "REDIS_7_0"
  region                  = "us-central1"
  reserved_ip_range       = var.redis_reserved_ip_range_central
  tier                    = "STANDARD_HA"
  transit_encryption_mode = "DISABLED"
  read_replicas_mode      = var.rmin_mail_campaign_cache_c_replica_enabled ? "READ_REPLICAS_ENABLED" : "READ_REPLICAS_DISABLED"
  replica_count           = var.rmin_mail_campaign_cache_c_replica_count

  persistence_config {
    persistence_mode        = "RDB"
    rdb_snapshot_period     = "TWENTY_FOUR_HOURS"
    rdb_snapshot_start_time = "2024-01-01T04:00:00Z"
  }

  maintenance_policy {
    weekly_maintenance_window {
      day = "SUNDAY"

      start_time {
        hours   = 17
        minutes = 0
        nanos   = 0
        seconds = 0
      }
    }
  }

  timeouts {
    create = "40m"
    update = "40m"
    delete = "40m"
  }

  lifecycle {
    prevent_destroy = true
    ignore_changes  = [alternative_location_id, location_id, reserved_ip_range]
    precondition {
      condition     = (tostring(var.rmin_mail_campaign_cache_c_replica_enabled) == "true" && tonumber(var.rmin_mail_campaign_cache_c_memory_size_gb) >= 5 && tonumber(var.rmin_mail_campaign_cache_c_replica_count) >= 1) || (tostring(var.rmin_mail_campaign_cache_c_replica_enabled) == "false" && tonumber(var.rmin_mail_campaign_cache_c_replica_count) == 1)
      error_message = "If replica_enabled=true then cache_memory_size_gb must be >=5 and replica_count must be >=1 or If replica_enabled=false then replica_count must be 1"
    }
  }
}

resource "google_redis_instance" "rmin_mail_campaign_cache_ext_c" {
  alternative_location_id = "us-central1-b"
  auth_enabled            = "false"
  authorized_network      = var.authorized_network
  connect_mode            = "PRIVATE_SERVICE_ACCESS"
  location_id             = "us-central1-a"
  memory_size_gb          = var.rmin_mail_campaign_cache_ext_c_memory_size_gb
  name                    = "rmin-mail-campaign-cache-ext-c-${var.name_suffix}"
  project                 = var.project_id
  redis_version           = "REDIS_7_0"
  region                  = "us-central1"
  reserved_ip_range       = var.redis_reserved_ip_range_central
  tier                    = "STANDARD_HA"
  transit_encryption_mode = "DISABLED"
  read_replicas_mode      = var.rmin_mail_campaign_cache_ext_c_replica_enabled ? "READ_REPLICAS_ENABLED" : "READ_REPLICAS_DISABLED"
  replica_count           = var.rmin_mail_campaign_cache_ext_c_replica_count

  persistence_config {
    persistence_mode        = "RDB"
    rdb_snapshot_period     = "TWENTY_FOUR_HOURS"
    rdb_snapshot_start_time = "2024-01-01T04:00:00Z"
  }

  maintenance_policy {
    weekly_maintenance_window {
      day = "SUNDAY"

      start_time {
        hours   = 17
        minutes = 0
        nanos   = 0
        seconds = 0
      }
    }
  }

  timeouts {
    create = "40m"
    update = "40m"
    delete = "40m"
  }

  lifecycle {
    prevent_destroy = true
    ignore_changes  = [alternative_location_id, location_id, reserved_ip_range]
    precondition {
      condition     = (tostring(var.rmin_mail_campaign_cache_ext_c_replica_enabled) == "true" && tonumber(var.rmin_mail_campaign_cache_ext_c_memory_size_gb) >= 5 && tonumber(var.rmin_mail_campaign_cache_ext_c_replica_count) >= 1) || (tostring(var.rmin_mail_campaign_cache_ext_c_replica_enabled) == "false" && tonumber(var.rmin_mail_campaign_cache_ext_c_replica_count) == 1)
      error_message = "If replica_enabled=true then cache_memory_size_gb must be >=5 and replica_count must be >=1 or If replica_enabled=false then replica_count must be 1"
    }
  }

  count = var.toggle_4583_xxxx_ext_caches ? 1 : 0
}

resource "google_redis_instance" "rmin_mdn_zip11s_cache_c" {
  alternative_location_id = "us-central1-c"
  auth_enabled            = "false"
  authorized_network      = var.authorized_network
  connect_mode            = "PRIVATE_SERVICE_ACCESS"
  location_id             = "us-central1-a"
  memory_size_gb          = var.rmin_mdn_zip11s_cache_c_memory_size_gb
  name                    = "rmin-mdn-zip11s-cache-c-${var.name_suffix}"
  project                 = var.project_id
  redis_version           = "REDIS_7_0"
  region                  = "us-central1"
  reserved_ip_range       = var.redis_reserved_ip_range_central
  tier                    = "STANDARD_HA"
  transit_encryption_mode = "DISABLED"
  read_replicas_mode      = var.rmin_mdn_zip11s_cache_c_replica_enabled ? "READ_REPLICAS_ENABLED" : "READ_REPLICAS_DISABLED"
  replica_count           = var.rmin_mdn_zip11s_cache_c_replica_count

  persistence_config {
    persistence_mode        = "RDB"
    rdb_snapshot_period     = "TWENTY_FOUR_HOURS"
    rdb_snapshot_start_time = "2024-01-01T04:00:00Z"
  }

  maintenance_policy {
    weekly_maintenance_window {
      day = "SUNDAY"

      start_time {
        hours   = 17
        minutes = 0
        nanos   = 0
        seconds = 0
      }
    }
  }

  timeouts {
    create = "40m"
    update = "40m"
    delete = "40m"
  }

  lifecycle {
    prevent_destroy = true
    ignore_changes  = [alternative_location_id, location_id, reserved_ip_range]
    precondition {
      condition     = (tostring(var.rmin_mdn_zip11s_cache_c_replica_enabled) == "true" && tonumber(var.rmin_mdn_zip11s_cache_c_memory_size_gb) >= 5 && tonumber(var.rmin_mdn_zip11s_cache_c_replica_count) >= 1) || (tostring(var.rmin_mdn_zip11s_cache_c_replica_enabled) == "false" && tonumber(var.rmin_mdn_zip11s_cache_c_replica_count) == 1)
      error_message = "If replica_enabled=true then cache_memory_size_gb must be >=5 and replica_count must be >=1 or If replica_enabled=false then replica_count must be 1"
    }
  }
}

resource "google_redis_instance" "rmin_mics_locks_cache_c" {
  alternative_location_id = "us-central1-b"
  auth_enabled            = "false"
  authorized_network      = var.authorized_network
  connect_mode            = "PRIVATE_SERVICE_ACCESS"
  location_id             = "us-central1-a"
  memory_size_gb          = var.rmin_mics_locks_cache_c_memory_size_gb
  name                    = "rmin-mics-locks-cache-c-${var.name_suffix}"
  project                 = var.project_id
  redis_version           = "REDIS_7_0"
  region                  = "us-central1"
  reserved_ip_range       = var.redis_reserved_ip_range_central
  tier                    = "STANDARD_HA"
  transit_encryption_mode = "DISABLED"
  read_replicas_mode      = var.rmin_mics_locks_cache_c_replica_enabled ? "READ_REPLICAS_ENABLED" : "READ_REPLICAS_DISABLED"
  replica_count           = var.rmin_mics_locks_cache_c_replica_count

  persistence_config {
    persistence_mode        = "RDB"
    rdb_snapshot_period     = "TWENTY_FOUR_HOURS"
    rdb_snapshot_start_time = "2024-01-01T04:00:00Z"
  }

  maintenance_policy {
    weekly_maintenance_window {
      day = "SUNDAY"

      start_time {
        hours   = 17
        minutes = 0
        nanos   = 0
        seconds = 0
      }
    }
  }

  timeouts {
    create = "40m"
    update = "40m"
    delete = "40m"
  }

  lifecycle {
    prevent_destroy = true
    ignore_changes  = [alternative_location_id, location_id, reserved_ip_range]
    precondition {
      condition     = (tostring(var.rmin_mics_locks_cache_c_replica_enabled) == "true" && tonumber(var.rmin_mics_locks_cache_c_memory_size_gb) >= 5 && tonumber(var.rmin_mics_locks_cache_c_replica_count) >= 1) || (tostring(var.rmin_mics_locks_cache_c_replica_enabled) == "false" && tonumber(var.rmin_mics_locks_cache_c_replica_count) == 1)
      error_message = "If replica_enabled=true then cache_memory_size_gb must be >=5 and replica_count must be >=1 or If replica_enabled=false then replica_count must be 1"
    }
  }
}

resource "google_redis_instance" "rmin_package_campaign_cache_c" {
  alternative_location_id = "us-central1-b"
  auth_enabled            = "false"
  authorized_network      = var.authorized_network
  connect_mode            = "PRIVATE_SERVICE_ACCESS"
  location_id             = "us-central1-a"
  memory_size_gb          = var.rmin_package_campaign_cache_c_memory_size_gb
  name                    = "rmin-package-campaign-cache-c-${var.name_suffix}"
  project                 = var.project_id
  redis_version           = "REDIS_7_0"
  region                  = "us-central1"
  reserved_ip_range       = var.redis_reserved_ip_range_central
  tier                    = "STANDARD_HA"
  transit_encryption_mode = "DISABLED"
  read_replicas_mode      = var.rmin_package_campaign_cache_c_replica_enabled ? "READ_REPLICAS_ENABLED" : "READ_REPLICAS_DISABLED"
  replica_count           = var.rmin_package_campaign_cache_c_replica_count

  persistence_config {
    persistence_mode        = "RDB"
    rdb_snapshot_period     = "TWENTY_FOUR_HOURS"
    rdb_snapshot_start_time = "2024-01-01T04:00:00Z"
  }

  maintenance_policy {
    weekly_maintenance_window {
      day = "SUNDAY"

      start_time {
        hours   = 17
        minutes = 0
        nanos   = 0
        seconds = 0
      }
    }
  }

  timeouts {
    create = "40m"
    update = "40m"
    delete = "40m"
  }

  lifecycle {
    prevent_destroy = true
    ignore_changes  = [alternative_location_id, location_id, reserved_ip_range]
    precondition {
      condition     = (tostring(var.rmin_package_campaign_cache_c_replica_enabled) == "true" && tonumber(var.rmin_package_campaign_cache_c_memory_size_gb) >= 5 && tonumber(var.rmin_package_campaign_cache_c_replica_count) >= 1) || (tostring(var.rmin_package_campaign_cache_c_replica_enabled) == "false" && tonumber(var.rmin_package_campaign_cache_c_replica_count) == 1)
      error_message = "If replica_enabled=true then cache_memory_size_gb must be >=5 and replica_count must be >=1 or If replica_enabled=false then replica_count must be 1"
    }
  }
}

resource "google_redis_instance" "rmin_package_campaign_cache_ext_c" {
  alternative_location_id = "us-central1-b"
  auth_enabled            = "false"
  authorized_network      = var.authorized_network
  connect_mode            = "PRIVATE_SERVICE_ACCESS"
  location_id             = "us-central1-a"
  memory_size_gb          = var.rmin_package_campaign_cache_ext_c_memory_size_gb
  name                    = "rmin-package-campaign-cache-ext-c-${var.name_suffix}"
  project                 = var.project_id
  redis_version           = "REDIS_7_0"
  region                  = "us-central1"
  reserved_ip_range       = var.redis_reserved_ip_range_central
  tier                    = "STANDARD_HA"
  transit_encryption_mode = "DISABLED"
  read_replicas_mode      = var.rmin_package_campaign_cache_ext_c_replica_enabled ? "READ_REPLICAS_ENABLED" : "READ_REPLICAS_DISABLED"
  replica_count           = var.rmin_package_campaign_cache_ext_c_replica_count

  persistence_config {
    persistence_mode        = "RDB"
    rdb_snapshot_period     = "TWENTY_FOUR_HOURS"
    rdb_snapshot_start_time = "2024-01-01T04:00:00Z"
  }

  maintenance_policy {
    weekly_maintenance_window {
      day = "SUNDAY"

      start_time {
        hours   = 17
        minutes = 0
        nanos   = 0
        seconds = 0
      }
    }
  }

  timeouts {
    create = "40m"
    update = "40m"
    delete = "40m"
  }

  lifecycle {
    prevent_destroy = true
    ignore_changes  = [alternative_location_id, location_id, reserved_ip_range]
    precondition {
      condition     = (tostring(var.rmin_package_campaign_cache_ext_c_replica_enabled) == "true" && tonumber(var.rmin_package_campaign_cache_ext_c_memory_size_gb) >= 5 && tonumber(var.rmin_package_campaign_cache_ext_c_replica_count) >= 1) || (tostring(var.rmin_package_campaign_cache_ext_c_replica_enabled) == "false" && tonumber(var.rmin_package_campaign_cache_ext_c_replica_count) == 1)
      error_message = "If replica_enabled=true then cache_memory_size_gb must be >=5 and replica_count must be >=1 or If replica_enabled=false then replica_count must be 1"
    }
  }

  count = var.toggle_4583_xxxx_ext_caches ? 1 : 0
}

resource "google_redis_instance" "rmin_subscriber_cache_c" {
  alternative_location_id = "us-central1-b"
  auth_enabled            = "false"
  authorized_network      = var.authorized_network
  connect_mode            = "PRIVATE_SERVICE_ACCESS"
  location_id             = "us-central1-a"
  memory_size_gb          = var.rmin_subscriber_cache_c_memory_size_gb
  name                    = "rmin-subscriber-cache-c-${var.name_suffix}"
  project                 = var.project_id
  redis_version           = "REDIS_7_0"
  region                  = "us-central1"
  reserved_ip_range       = var.redis_reserved_ip_range_central
  tier                    = "STANDARD_HA"
  transit_encryption_mode = "DISABLED"
  read_replicas_mode      = var.rmin_subscriber_cache_c_replica_enabled ? "READ_REPLICAS_ENABLED" : "READ_REPLICAS_DISABLED"
  replica_count           = var.rmin_subscriber_cache_c_replica_count

  persistence_config {
    persistence_mode        = "RDB"
    rdb_snapshot_period     = "TWENTY_FOUR_HOURS"
    rdb_snapshot_start_time = "2024-01-01T04:00:00Z"
  }

  maintenance_policy {
    weekly_maintenance_window {
      day = "SUNDAY"

      start_time {
        hours   = 17
        minutes = 0
        nanos   = 0
        seconds = 0
      }
    }
  }

  timeouts {
    create = "40m"
    update = "40m"
    delete = "40m"
  }

  lifecycle {
    prevent_destroy = true
    ignore_changes  = [alternative_location_id, location_id, reserved_ip_range]
    precondition {
      condition     = (tostring(var.rmin_subscriber_cache_c_replica_enabled) == "true" && tonumber(var.rmin_subscriber_cache_c_memory_size_gb) >= 5 && tonumber(var.rmin_subscriber_cache_c_replica_count) >= 1) || (tostring(var.rmin_subscriber_cache_c_replica_enabled) == "false" && tonumber(var.rmin_subscriber_cache_c_replica_count) == 1)
      error_message = "If replica_enabled=true then cache_memory_size_gb must be >=5 and replica_count must be >=1 or If replica_enabled=false then replica_count must be 1"
    }
  }
}

resource "google_redis_instance" "rmin_firestore_subscriber_cache_c" {
  alternative_location_id = "us-central1-b"
  auth_enabled            = "false"
  authorized_network      = var.authorized_network
  connect_mode            = "PRIVATE_SERVICE_ACCESS"
  location_id             = "us-central1-a"
  memory_size_gb          = var.rmin_fs_subscriber_cache_memory_size_gb
  name                    = "rmin-fs-subscriber-cache-c-${var.name_suffix}"
  project                 = var.project_id
  redis_version           = "REDIS_7_0"
  region                  = "us-central1"
  reserved_ip_range       = var.redis_reserved_ip_range_central
  tier                    = "STANDARD_HA"
  transit_encryption_mode = "DISABLED"
  read_replicas_mode      = var.rmin_fs_subscriber_cache_replica_enabled ? "READ_REPLICAS_ENABLED" : "READ_REPLICAS_DISABLED"
  replica_count           = var.rmin_fs_subscriber_cache_replica_count

  persistence_config {
    persistence_mode        = "RDB"
    rdb_snapshot_period     = "TWENTY_FOUR_HOURS"
    rdb_snapshot_start_time = "2024-01-01T04:00:00Z"
  }

  maintenance_policy {
    weekly_maintenance_window {
      day = "SUNDAY"

      start_time {
        hours   = 17
        minutes = 0
        nanos   = 0
        seconds = 0
      }
    }
  }

  timeouts {
    create = "40m"
    update = "40m"
    delete = "40m"
  }

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0

  labels = {
    release = "subscriber-services"
  }

  lifecycle {
    prevent_destroy = true
    ignore_changes  = [alternative_location_id, location_id, reserved_ip_range]
    precondition {
      condition     = (tostring(var.rmin_fs_subscriber_cache_replica_enabled) == "true" && tonumber(var.rmin_fs_subscriber_cache_memory_size_gb) >= 5 && tonumber(var.rmin_fs_subscriber_cache_replica_count) >= 1) || (tostring(var.rmin_fs_subscriber_cache_replica_enabled) == "false" && tonumber(var.rmin_fs_subscriber_cache_replica_count) == 1)
      error_message = "If replica_enabled=true then cache_memory_size_gb must be >=5 and replica_count must be >=1 or If replica_enabled=false then replica_count must be 1"
    }
  }
}

resource "google_redis_instance" "rmin_subscriber_email_cache_c" {
  alternative_location_id = "us-central1-f"
  auth_enabled            = "false"
  authorized_network      = var.authorized_network
  connect_mode            = "PRIVATE_SERVICE_ACCESS"
  location_id             = "us-central1-b"
  memory_size_gb          = var.rmin_subscriber_email_cache_c_memory_size_gb
  name                    = "rmin-subscriber-email-cache-c-${var.name_suffix}"
  project                 = var.project_id
  redis_version           = "REDIS_7_0"
  region                  = "us-central1"
  reserved_ip_range       = var.redis_reserved_ip_range_central
  tier                    = "STANDARD_HA"
  transit_encryption_mode = "DISABLED"
  read_replicas_mode      = var.rmin_subscriber_email_cache_c_replica_enabled ? "READ_REPLICAS_ENABLED" : "READ_REPLICAS_DISABLED"
  replica_count           = var.rmin_subscriber_email_cache_c_replica_count

  persistence_config {
    persistence_mode        = "RDB"
    rdb_snapshot_period     = "TWENTY_FOUR_HOURS"
    rdb_snapshot_start_time = "2024-01-01T04:00:00Z"
  }

  maintenance_policy {
    weekly_maintenance_window {
      day = "SUNDAY"

      start_time {
        hours   = 17
        minutes = 0
        nanos   = 0
        seconds = 0
      }
    }
  }

  timeouts {
    create = "40m"
    update = "40m"
    delete = "40m"
  }

  lifecycle {
    prevent_destroy = true
    ignore_changes  = [alternative_location_id, location_id, reserved_ip_range]
    precondition {
      condition     = (tostring(var.rmin_subscriber_email_cache_c_replica_enabled) == "true" && tonumber(var.rmin_subscriber_email_cache_c_memory_size_gb) >= 5 && tonumber(var.rmin_subscriber_email_cache_c_replica_count) >= 1) || (tostring(var.rmin_subscriber_email_cache_c_replica_enabled) == "false" && tonumber(var.rmin_subscriber_email_cache_c_replica_count) == 1)
      error_message = "If replica_enabled=true then cache_memory_size_gb must be >=5 and replica_count must be >=1 or If replica_enabled=false then replica_count must be 1"
    }
  }
}

resource "google_redis_instance" "rmin_firestore_subscriber_email_cache_c" {
  alternative_location_id = "us-central1-f"
  auth_enabled            = "false"
  authorized_network      = var.authorized_network
  connect_mode            = "PRIVATE_SERVICE_ACCESS"
  location_id             = "us-central1-b"
  memory_size_gb          = var.rmin_fs_subscriber_email_cache_memory_size_gb
  name                    = "rmin-fs-subscriber-email-cache-c-${var.name_suffix}"
  project                 = var.project_id
  redis_version           = "REDIS_7_0"
  region                  = "us-central1"
  reserved_ip_range       = var.redis_reserved_ip_range_central
  tier                    = "STANDARD_HA"
  transit_encryption_mode = "DISABLED"
  read_replicas_mode      = var.rmin_fs_subscriber_email_cache_replica_enabled ? "READ_REPLICAS_ENABLED" : "READ_REPLICAS_DISABLED"
  replica_count           = var.rmin_fs_subscriber_email_cache_replica_count

  labels = {
    release = "subscriber-services"
  }

  persistence_config {
    persistence_mode        = "RDB"
    rdb_snapshot_period     = "TWENTY_FOUR_HOURS"
    rdb_snapshot_start_time = "2024-01-01T04:00:00Z"
  }

  maintenance_policy {
    weekly_maintenance_window {
      day = "SUNDAY"

      start_time {
        hours   = 17
        minutes = 0
        nanos   = 0
        seconds = 0
      }
    }
  }

  timeouts {
    create = "40m"
    update = "40m"
    delete = "40m"
  }

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0

  lifecycle {
    prevent_destroy = true
    ignore_changes  = [alternative_location_id, location_id, reserved_ip_range]
    precondition {
      condition     = (tostring(var.rmin_fs_subscriber_email_cache_replica_enabled) == "true" && tonumber(var.rmin_fs_subscriber_email_cache_memory_size_gb) >= 5 && tonumber(var.rmin_fs_subscriber_email_cache_replica_count) >= 1) || (tostring(var.rmin_fs_subscriber_email_cache_replica_enabled) == "false" && tonumber(var.rmin_fs_subscriber_email_cache_replica_count) == 1)
      error_message = "If replica_enabled=true then cache_memory_size_gb must be >=5 and replica_count must be >=1 or If replica_enabled=false then replica_count must be 1"
    }
  }
}

resource "google_redis_instance" "rmin_flats_lock_cache_c" {
  alternative_location_id = "us-central1-b"
  auth_enabled            = "false"
  authorized_network      = var.authorized_network
  connect_mode            = "PRIVATE_SERVICE_ACCESS"
  location_id             = "us-central1-a"
  memory_size_gb          = var.rmin_flats_lock_cache_c_memory_size_gb
  name                    = "rmin-flats-lock-cache-c-${var.name_suffix}"
  project                 = var.project_id
  redis_version           = "REDIS_7_0"
  region                  = "us-central1"
  reserved_ip_range       = var.redis_reserved_ip_range_central
  tier                    = "STANDARD_HA"
  transit_encryption_mode = "DISABLED"
  read_replicas_mode      = var.rmin_flats_lock_cache_c_replica_enabled ? "READ_REPLICAS_ENABLED" : "READ_REPLICAS_DISABLED"
  replica_count           = var.rmin_flats_lock_cache_c_replica_count

  persistence_config {
    persistence_mode        = "RDB"
    rdb_snapshot_period     = "TWENTY_FOUR_HOURS"
    rdb_snapshot_start_time = "2024-01-01T04:00:00Z"
  }

  maintenance_policy {
    weekly_maintenance_window {
      day = "SUNDAY"

      start_time {
        hours   = 17
        minutes = 0
        nanos   = 0
        seconds = 0
      }
    }
  }

  timeouts {
    create = "40m"
    update = "40m"
    delete = "40m"
  }

  lifecycle {
    prevent_destroy = true
    ignore_changes  = [alternative_location_id, location_id, reserved_ip_range]
    precondition {
      condition     = (tostring(var.rmin_flats_lock_cache_c_replica_enabled) == "true" && tonumber(var.rmin_flats_lock_cache_c_memory_size_gb) >= 5 && tonumber(var.rmin_flats_lock_cache_c_replica_count) >= 1) || (tostring(var.rmin_flats_lock_cache_c_replica_enabled) == "false" && tonumber(var.rmin_flats_lock_cache_c_replica_count) == 1)
      error_message = "If replica_enabled=true then cache_memory_size_gb must be >=5 and replica_count must be >=1 or If replica_enabled=false then replica_count must be 1"
    }
  }
}

resource "google_redis_instance" "rmin_relay_locks_cache_c" {
  auth_enabled            = "false"
  authorized_network      = var.authorized_network
  connect_mode            = "PRIVATE_SERVICE_ACCESS"
  location_id             = "us-central1-b"
  memory_size_gb          = var.rmin_relay_locks_cache_c_memory_size_gb
  name                    = "rmin-relay-locks-cache-c-${var.name_suffix}"
  project                 = var.project_id
  redis_version           = "REDIS_7_0"
  region                  = "us-central1"
  reserved_ip_range       = var.redis_reserved_ip_range_central
  tier                    = "BASIC"
  transit_encryption_mode = "DISABLED"
  read_replicas_mode      = var.rmin_relay_locks_cache_c_replica_enabled ? "READ_REPLICAS_ENABLED" : "READ_REPLICAS_DISABLED"
  replica_count           = 0

  persistence_config {
    persistence_mode        = "RDB"
    rdb_snapshot_period     = "TWENTY_FOUR_HOURS"
    rdb_snapshot_start_time = "2024-01-01T04:00:00Z"
  }

  maintenance_policy {
    weekly_maintenance_window {
      day = "SUNDAY"

      start_time {
        hours   = 17
        minutes = 0
        nanos   = 0
        seconds = 0
      }
    }
  }

  timeouts {
    create = "40m"
    update = "40m"
    delete = "40m"
  }

  lifecycle {
    prevent_destroy = true
    ignore_changes  = [alternative_location_id, location_id, reserved_ip_range]
  }
}
resource "google_redis_instance" "rmin_saturation_data_cache_e" {
  alternative_location_id = "us-east4-c"
  auth_enabled            = "false"
  authorized_network      = var.authorized_network
  connect_mode            = "PRIVATE_SERVICE_ACCESS"
  location_id             = "us-east4-a"
  memory_size_gb          = var.rmin_saturation_data_cache_e_memory_size_gb
  name                    = "rmin-saturation-data-cache-e-${var.name_suffix}"
  project                 = var.project_id
  redis_version           = "REDIS_7_0"
  region                  = "us-east4"
  reserved_ip_range       = var.redis_reserved_ip_range_east
  tier                    = "STANDARD_HA"
  transit_encryption_mode = "DISABLED"
  read_replicas_mode      = var.rmin_saturation_data_cache_e_replica_enabled ? "READ_REPLICAS_ENABLED" : "READ_REPLICAS_DISABLED"
  replica_count           = var.rmin_saturation_data_cache_e_replica_count

  persistence_config {
    persistence_mode        = "RDB"
    rdb_snapshot_period     = "TWENTY_FOUR_HOURS"
    rdb_snapshot_start_time = "2024-01-01T04:00:00Z"
  }

  maintenance_policy {
    weekly_maintenance_window {
      day = "SUNDAY"

      start_time {
        hours   = 17
        minutes = 0
        nanos   = 0
        seconds = 0
      }
    }
  }

  timeouts {
    create = "40m"
    update = "40m"
    delete = "40m"
  }

  lifecycle {
    prevent_destroy = true
    ignore_changes  = [alternative_location_id, location_id, reserved_ip_range]
    precondition {
      condition     = (tostring(var.rmin_saturation_data_cache_e_replica_enabled) == "true" && tonumber(var.rmin_saturation_data_cache_e_memory_size_gb) >= 5 && tonumber(var.rmin_saturation_data_cache_e_replica_count) >= 1) || (tostring(var.rmin_saturation_data_cache_e_replica_enabled) == "false" && tonumber(var.rmin_saturation_data_cache_e_replica_count) == 1)
      error_message = "If replica_enabled=true then cache_memory_size_gb must be >=5 and replica_count must be >=1 or If replica_enabled=false then replica_count must be 1"
    }
  }
}

resource "google_redis_instance" "rmin_zip5_initiatives_sync_cache_c" {
  alternative_location_id = "us-central1-b"
  auth_enabled            = "false"
  authorized_network      = var.authorized_network
  connect_mode            = "PRIVATE_SERVICE_ACCESS"
  location_id             = "us-central1-a"
  memory_size_gb          = var.rmin_zip5_initiatives_cache_c_memory_size_gb
  name                    = "rmin-zip5-initiatives-cache-c-${var.name_suffix}"
  project                 = var.project_id
  redis_version           = "REDIS_7_0"
  region                  = "us-central1"
  reserved_ip_range       = var.redis_reserved_ip_range_central
  tier                    = "STANDARD_HA"
  transit_encryption_mode = "DISABLED"
  read_replicas_mode      = var.rmin_zip5_initiatives_cache_c_replica_enabled ? "READ_REPLICAS_ENABLED" : "READ_REPLICAS_DISABLED"
  replica_count           = var.rmin_zip5_initiatives_cache_c_replica_count

  persistence_config {
    persistence_mode        = "RDB"
    rdb_snapshot_period     = "TWENTY_FOUR_HOURS"
    rdb_snapshot_start_time = "2024-01-01T04:00:00Z"
  }

  maintenance_policy {
    weekly_maintenance_window {
      day = "SUNDAY"

      start_time {
        hours   = 17
        minutes = 0
        nanos   = 0
        seconds = 0
      }
    }
  }

  timeouts {
    create = "40m"
    update = "40m"
    delete = "40m"
  }
  count = var.toggle_4583_5681_consumer_portal ? 1 : 0

  lifecycle {
    prevent_destroy = true
    ignore_changes  = [alternative_location_id, location_id, reserved_ip_range]
    precondition {
      condition     = (tostring(var.rmin_zip5_initiatives_cache_c_replica_enabled) == "true" && tonumber(var.rmin_zip5_initiatives_cache_c_memory_size_gb) >= 5 && tonumber(var.rmin_zip5_initiatives_cache_c_replica_count) >= 1) || (tostring(var.rmin_zip5_initiatives_cache_c_replica_enabled) == "false" && tonumber(var.rmin_zip5_initiatives_cache_c_replica_count) == 1)
      error_message = "If replica_enabled=true then cache_memory_size_gb must be >=5 and replica_count must be >=1 or If replica_enabled=false then replica_count must be 1"
    }
  }
}

# [END google_redis_instance]
