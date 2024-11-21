output "mail_campaign_db_name" {
  value       = google_firestore_database.mail_campaign_db.name
  description = "Mail Campaign database name"
}