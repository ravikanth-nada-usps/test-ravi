output "subscribers_db_name" {
  value       = var.toggle_4583_1111_subscriber_services ? google_firestore_database.subscribers_db[0].name : null
  description = "Subscribers database name"
}

output "subscribers_location_id" {
  value       = var.toggle_4583_1111_subscriber_services ? google_firestore_database.subscribers_db[0].location_id : null
  description = "Subscribers database location"
}