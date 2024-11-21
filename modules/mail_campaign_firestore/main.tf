# [START google_project_service] 

resource "google_project_service" "firestore" {
  project = var.project_id
  service = "firestore.googleapis.com"
}

# [END google_project_service] 

# [START google_firestore_database] 

resource "google_firestore_database" "mail_campaign_db" {
  project                           = var.project_id
  name                              = "mail-campaign"
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
  database = google_firestore_database.mail_campaign_db.name

  retention = var.mail_campaign_firestore_backup_retention

  daily_recurrence {}
}

# [END google_firestore_backup_schedule] 

# [START google_firestore_field] 

resource "google_firestore_field" "campaign_summary_clicks_count" {
  project    = var.project_id
  database   = google_firestore_database.mail_campaign_db.name
  collection = "campaignSummary"
  field      = "clicksCount"
  depends_on = [google_firestore_database.mail_campaign_db]
  index_config {}
}


resource "google_firestore_field" "campaign_summary_email_opens_count" {
  project    = var.project_id
  database   = google_firestore_database.mail_campaign_db.name
  collection = "campaignSummary"
  field      = "emailOpensCount"
  depends_on = [google_firestore_database.mail_campaign_db]
  index_config {}
}


resource "google_firestore_field" "campaign_summary_emails_count" {
  project    = var.project_id
  database   = google_firestore_database.mail_campaign_db.name
  collection = "campaignSummary"
  field      = "emailsCount"
  depends_on = [google_firestore_database.mail_campaign_db]
  index_config {}
}


resource "google_firestore_field" "campaign_summary_pieces_count" {
  project    = var.project_id
  database   = google_firestore_database.mail_campaign_db.name
  collection = "campaignSummary"
  field      = "piecesCount"
  depends_on = [google_firestore_database.mail_campaign_db]
  index_config {}
}


resource "google_firestore_field" "click_details_click_date_time" {
  project    = var.project_id
  database   = google_firestore_database.mail_campaign_db.name
  collection = "clickDetails"
  field      = "clickDatetime"
  depends_on = [google_firestore_database.mail_campaign_db]
  index_config {}
}

resource "google_firestore_field" "emails_email_sent_time" {
  project    = var.project_id
  database   = google_firestore_database.mail_campaign_db.name
  collection = "emails"
  field      = "emailSentTime"
  depends_on = [google_firestore_database.mail_campaign_db]
  index_config {}
}

# [END google_firestore_field] 