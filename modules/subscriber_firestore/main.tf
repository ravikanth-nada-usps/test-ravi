# [START google_project_service]

resource "google_project_service" "firestore" {
  project = var.project_id
  service = "firestore.googleapis.com"
}

# [END google_project_service]

# [START google_firestore_database]

resource "google_firestore_database" "subscribers_db" {
  project                           = var.project_id
  name                              = "subscribers"
  location_id                       = "nam5"
  type                              = "FIRESTORE_NATIVE"
  concurrency_mode                  = "PESSIMISTIC"
  app_engine_integration_mode       = "DISABLED"
  depends_on                        = [google_project_service.firestore]
  point_in_time_recovery_enablement = var.pitr_enablement
  delete_protection_state           = "DELETE_PROTECTION_ENABLED"

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0
}

# [END google_firestore_database]

# [START google_firestore_backup_schedule] 

resource "google_firestore_backup_schedule" "daily_backup" {
  project  = var.project_id
  database = google_firestore_database.subscribers_db[0].name

  retention = var.subscribers_firestore_backup_retention

  daily_recurrence {}
}

# [END google_firestore_backup_schedule] 

# [START google_firestore_field]


resource "google_firestore_field" "subscribers_last_login" {
  project    = var.project_id
  database   = google_firestore_database.subscribers_db[0].name
  collection = "subscribers"
  field      = "lastLogin"
  depends_on = [google_firestore_database.subscribers_db]
  index_config {}

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0
}

resource "google_firestore_field" "subscribers_expire_at" {
  project    = var.project_id
  database   = google_firestore_database.subscribers_db[0].name
  collection = "subscribers"
  field      = "expireAt"
  depends_on = [google_firestore_database.subscribers_db]
  index_config {}
  ttl_config {}

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0
}

resource "google_firestore_field" "timestamps_cust_reg_primary" {
  project    = var.project_id
  database   = google_firestore_database.subscribers_db[0].name
  collection = "timestamps"
  field      = "custRegTimestampPrimary"
  depends_on = [google_firestore_database.subscribers_db]
  index_config {}

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0
}

resource "google_firestore_field" "timestamps_my_usps_primary" {
  project    = var.project_id
  database   = google_firestore_database.subscribers_db[0].name
  collection = "timestamps"
  field      = "myUspsTimestampPrimary"
  depends_on = [google_firestore_database.subscribers_db]
  index_config {}

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0
}

resource "google_firestore_field" "timestamps_oracle_primary" {
  project    = var.project_id
  database   = google_firestore_database.subscribers_db[0].name
  collection = "timestamps"
  field      = "IDOracleTimestampPrimary"
  depends_on = [google_firestore_database.subscribers_db]
  index_config {}

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0
}

resource "google_firestore_field" "timestamps_cust_reg_secondary" {
  project    = var.project_id
  database   = google_firestore_database.subscribers_db[0].name
  collection = "timestamps"
  field      = "custRegTimestampSecondary"
  depends_on = [google_firestore_database.subscribers_db]
  index_config {}

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0
}

resource "google_firestore_field" "timestamps_my_usps_secondary" {
  project    = var.project_id
  database   = google_firestore_database.subscribers_db[0].name
  collection = "timestamps"
  field      = "myUspsTimestampSecondary"
  depends_on = [google_firestore_database.subscribers_db]
  index_config {}

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0
}

resource "google_firestore_field" "timestamps_oracle_secondary" {
  project    = var.project_id
  database   = google_firestore_database.subscribers_db[0].name
  collection = "timestamps"
  field      = "IDOracleTimestampSecondary"
  depends_on = [google_firestore_database.subscribers_db]
  index_config {}

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0
}

resource "google_firestore_field" "timestamps_expire_at" {
  project    = var.project_id
  database   = google_firestore_database.subscribers_db[0].name
  collection = "timestamps"
  field      = "expireAt"
  depends_on = [google_firestore_database.subscribers_db]
  index_config {}
  ttl_config {}

  count = var.toggle_4583_5680_frontend ? 1 : 0
}
# [END google_firestore_field]

# [START google_firestore_index]

resource "google_firestore_index" "primary_dn_active_composite_index" {
  project     = var.project_id
  database    =  google_firestore_database.subscribers_db[0].name
  collection  = "subscribers"
  query_scope = "COLLECTION_GROUP"

  fields {
    field_path = "physicalAddress.primaryAddress.dnOptIn"
    order      = "ASCENDING"
  }

  fields {
    field_path = "physicalAddress.primaryAddress.isActive"
    order      = "ASCENDING"
  }

  fields {
    field_path = "__name__"
    order      = "ASCENDING"
  }

  count = var.toggle_4583_5708_mdn_to_eng ? 1 : 0
}

resource "google_firestore_index" "secondary_dn_active_composite_index" {
  project     = var.project_id
  database    =  google_firestore_database.subscribers_db[0].name
  collection  = "subscribers"
  query_scope = "COLLECTION_GROUP"

  fields {
    field_path = "physicalAddress.secondaryAddress.dnOptIn"
    order      = "ASCENDING"
  }

  fields {
    field_path = "physicalAddress.secondaryAddress.isActive"
    order      = "ASCENDING"
  }

  fields {
    field_path = "__name__"
    order      = "ASCENDING"
  }

  count = var.toggle_4583_5708_mdn_to_eng ? 1 : 0
}

# [END google_firestore_index]
