# [START google_project_service] 

resource "google_project_service" "firestore" {
  project = var.project_id
  service = "firestore.googleapis.com"
}

# [END google_project_service] 

# [START google_firestore_database] 

resource "google_firestore_database" "database" {
  project                           = var.project_id
  name                              = "dashboard"
  location_id                       = "nam5"
  type                              = "FIRESTORE_NATIVE"
  concurrency_mode                  = "PESSIMISTIC"
  app_engine_integration_mode       = "DISABLED"
  point_in_time_recovery_enablement = var.pitr_enablement
  delete_protection_state           = "DELETE_PROTECTION_ENABLED"

  depends_on = [google_project_service.firestore]
}

# [END google_firestore_database] 

# [START google_firestore_backup_schedule] 

resource "google_firestore_backup_schedule" "daily_backup" {
  project  = var.project_id
  database = google_firestore_database.database.name

  retention = var.dashboard_firestore_backup_retention

  daily_recurrence {}
}

# [END google_firestore_backup_schedule] 

# [START google_firestore_field]

resource "google_firestore_field" "inbound_package_expire_at" {
  project    = var.project_id
  database   = google_firestore_database.database.name
  collection = "inboundPackages"
  field      = "expireAt"
  depends_on = [google_firestore_database.database]
  index_config {}
  ttl_config {}
}

resource "google_firestore_field" "inbound_package_event_timestamp" {
  project    = var.project_id
  database   = google_firestore_database.database.name
  collection = "inboundPackages"
  field      = "eventTimeStamp"
  depends_on = [google_firestore_field.inbound_package_expire_at]
  index_config {
    indexes {
      order = "ASCENDING"
    }
  }
}

resource "google_firestore_field" "outbound_package_expire_at" {
  project    = var.project_id
  database   = google_firestore_database.database.name
  collection = "outboundPackages"
  field      = "expireAt"
  depends_on = [google_firestore_field.inbound_package_event_timestamp]
  index_config {}
  ttl_config {}
}

resource "google_firestore_field" "outbound_package_event_timestamp" {
  project    = var.project_id
  database   = google_firestore_database.database.name
  collection = "outboundPackages"
  field      = "eventTimeStamp"
  depends_on = [google_firestore_field.outbound_package_expire_at]
  index_config {}
}

resource "google_firestore_field" "iv_flats_expire_at" {
  project    = var.project_id
  database   = google_firestore_database.database.name
  collection = "ivFlats"
  field      = "expireAt"
  depends_on = [google_firestore_field.outbound_package_event_timestamp]
  index_config {}
  ttl_config {}
}

resource "google_firestore_field" "iv_flats_scan_date_time" {
  project    = var.project_id
  database   = google_firestore_database.database.name
  collection = "ivFlats"
  field      = "scanDateTime"
  depends_on = [google_firestore_field.iv_flats_expire_at]
  index_config {}
}

resource "google_firestore_field" "mailpieces_expire_at" {
  project    = var.project_id
  database   = google_firestore_database.database.name
  collection = "mailpieces"
  field      = "expireAt"
  depends_on = [google_firestore_field.iv_flats_scan_date_time]
  index_config {}
  ttl_config {}
}

resource "google_firestore_field" "saturation_expire_at" {
  project    = var.project_id
  database   = google_firestore_database.database.name
  collection = "saturation"
  field      = "expireAt"
  depends_on = [google_firestore_field.mailpieces_expire_at]
  index_config {}
  ttl_config {}
}

resource "google_firestore_field" "inbound_packages_additional_package_details" {
  project    = var.project_id
  database   = google_firestore_database.database.name
  collection = "inboundPackages"
  field      = "additionalPackageDetails"

  index_config {}

  count = var.toggle_4583_5673_myusps_migration ? 1 : 0
}

resource "google_firestore_field" "primary_updated_on" {
  project    = var.project_id
  database   = google_firestore_database.database.name
  collection = "addedPackages-1"
  field      = "updatedOn"

  index_config {}

  count = var.toggle_4583_5673_myusps_migration ? 1 : 0
}

resource "google_firestore_field" "primary_expire_at" {
  project    = var.project_id
  database   = google_firestore_database.database.name
  collection = "addedPackages-1"
  field      = "expireAt"

  index_config {}
  ttl_config {}

  count = var.toggle_4583_5673_myusps_migration ? 1 : 0
}

resource "google_firestore_field" "secondary_updated_on" {
  project    = var.project_id
  database   = google_firestore_database.database.name
  collection = "addedPackages-0"
  field      = "updatedOn"

  index_config {}

  count = var.toggle_4583_5673_myusps_migration ? 1 : 0
}

resource "google_firestore_field" "secondary_expire_at" {
  project    = var.project_id
  database   = google_firestore_database.database.name
  collection = "addedPackages-0"
  field      = "expireAt"

  index_config {}
  ttl_config {}

  count = var.toggle_4583_5673_myusps_migration ? 1 : 0
}

resource "google_firestore_field" "inbound_packages_impb" {
  project    = var.project_id
  database   = google_firestore_database.database.name
  collection = "inboundPackages"
  field      = "impb"
  index_config {
    indexes {
      order       = "ASCENDING"
      query_scope = "COLLECTION_GROUP"
    }
    indexes {
      order = "ASCENDING"
    }
    indexes {
      order = "DESCENDING"
    }
    indexes {
      array_config = "CONTAINS"
    }
  }
}

resource "google_firestore_field" "locker_packages_impb" {
  project    = var.project_id
  database   = google_firestore_database.database.name
  collection = "lockerPackages"
  field      = "impb"
  index_config {
    indexes {
      order       = "ASCENDING"
      query_scope = "COLLECTION_GROUP"
    }
    indexes {
      order = "ASCENDING"
    }
    indexes {
      order = "DESCENDING"
    }
    indexes {
      array_config = "CONTAINS"
    }
  }

  count = var.toggle_4583_5681_consumer_portal ? 1 : 0
}

resource "google_firestore_field" "locker_package_event_timestamp" {
  project    = var.project_id
  database   = google_firestore_database.database.name
  collection = "lockerPackages"
  field      = "eventTimeStamp"
  index_config {
    indexes {
      order = "ASCENDING"
    }
  }

  count = var.toggle_4583_5681_consumer_portal ? 1 : 0
}

resource "google_firestore_field" "primary_event_timestamp" {
  project    = var.project_id
  database   = google_firestore_database.database.name
  collection = "addedPackages-1"
  field      = "eventTimeStamp"

  index_config {
    indexes {
      order = "ASCENDING"
    }
  }

  count = var.toggle_4583_5681_consumer_portal ? 1 : 0
}

resource "google_firestore_field" "secondary_event_timestamp" {
  project    = var.project_id
  database   = google_firestore_database.database.name
  collection = "addedPackages-0"
  field      = "eventTimeStamp"

  index_config {
    indexes {
      order = "ASCENDING"
    }
  }

  count = var.toggle_4583_5681_consumer_portal ? 1 : 0
}

resource "google_firestore_field" "added_packages_impb" {
  project    = var.project_id
  database   = google_firestore_database.database.name
  collection = "addedPackages-1"
  field      = "impb"
  index_config {
    indexes {
      order       = "ASCENDING"
      query_scope = "COLLECTION_GROUP"
    }
    indexes {
      order = "ASCENDING"
    }
    indexes {
      order = "DESCENDING"
    }
    indexes {
      array_config = "CONTAINS"
    }
  }

  count = var.toggle_4583_5681_consumer_portal ? 1 : 0
}

# [END google_firestore_field]
