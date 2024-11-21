output "dashboard_db_name" {
  value       = google_firestore_database.database.name
  description = "Dashboards database name"
}

output "dashboard_db_location_id" {
  value       = google_firestore_database.database.location_id
  description = "Dashboards database location"
}