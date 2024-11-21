output "vpc_connector_uri" {
  value       = google_vpc_access_connector.rmin_dashboard_conn.id
  description = "VPC Connector uri"
}

output "rmin_peripheral_conn_id" {
  value       = google_vpc_access_connector.rmin_peripheral_conn.id
  description = "VPC Connector uri"
}

output "subscriber_connector_uri" {
  value       = var.toggle_4583_1111_subscriber_services ? google_vpc_access_connector.rmin_subscriber_conn[0].id : null
  description = "Subscriber VPC Access Connector URI"
}

output "api_connector_uri" {
  value       = google_vpc_access_connector.rmin_api_conn.id
  description = "Dashboard API connector uri"
}

output "package_connector_uri" {
  value       = var.toggle_4583_5673_myusps_migration ? google_vpc_access_connector.rmin_package_conn[0].id : null
  description = "Subscriber VPC Access Connector URI"
}