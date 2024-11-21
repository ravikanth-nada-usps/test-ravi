output "rmin_dev_dashboard_serverless" {
  value       = google_compute_subnetwork.rmin_dashboard_serverless.name
  description = "The name of the resource"
}
output "rmin_peripheral" {
  value       = google_compute_subnetwork.rmin_peripheral.name
  description = "The name of the resource"
}
output "rmin_email_serverless" {
  value       = google_compute_subnetwork.rmin_email_serverless.name
  description = "The name of the resource"
}

output "rmin_subscriber_serverless" {
  value       = var.toggle_4583_1111_subscriber_services ? google_compute_subnetwork.rmin_subscriber_serverless[0].name : null
  description = "The name of the resource"
}

output "rmin_peripheral_serverless" {
  value       = google_compute_subnetwork.rmin_peripheral_serverless.name
  description = "The name of the resource"
}

output "rmin_e_dataflow_peripheral_name" {
  value       = google_compute_subnetwork.rmin_e_dataflow_peripheral.name
  description = "The name of the resource"
}

output "rmin_e_dataflow_email_name" {
  value       = google_compute_subnetwork.rmin_e_dataflow_email.name
  description = "The name of the resource"
}

output "rmin_e_serverless_connector_name" {
  value       = google_compute_subnetwork.rmin_e_serverless_connector.name
  description = "The name of the resource"
}

output "rmin_e_serverless_email_name" {
  value       = google_compute_subnetwork.rmin_e_serverless_email.name
  description = "The name of the resource"
}

output "idc_cloudrun_email_serverless_name" {
  value       = google_compute_subnetwork.idc_cloudrun_email_serverless.name
  description = "The name of the resource"
}

output "rmin_api_serverless_name" {
  value       = google_compute_subnetwork.rmin_api_serverless.name
  description = "The name of the resource"
}

output "rmin_dev_dashboard_serverless_id" {
  value       = google_compute_subnetwork.rmin_dashboard_serverless.id
  description = "the ID of the resource with format projects/{{project}}/regions/{{region}}/subnetworks/{{name}}"
}
output "rmin_peripheral_id" {
  value       = google_compute_subnetwork.rmin_peripheral.id
  description = "the ID of the resource with format projects/{{project}}/regions/{{region}}/subnetworks/{{name}}"
}
output "rmin_email_serverless_id" {
  value       = google_compute_subnetwork.rmin_email_serverless.id
  description = "the ID of the resource with format projects/{{project}}/regions/{{region}}/subnetworks/{{name}}"
}
output "rmin_peripheral_serverless_id" {
  value       = google_compute_subnetwork.rmin_peripheral_serverless.id
  description = "the ID of the resource with format projects/{{project}}/regions/{{region}}/subnetworks/{{name}}"
}

output "rmin_e_dataflow_peripheral_id" {
  value       = google_compute_subnetwork.rmin_e_dataflow_peripheral.id
  description = "the ID of the resource with format projects/{{project}}/regions/{{region}}/subnetworks/{{name}}"
}

output "rmin_e_dataflow_email_id" {
  value       = google_compute_subnetwork.rmin_e_dataflow_email.id
  description = "the ID of the resource with format projects/{{project}}/regions/{{region}}/subnetworks/{{name}}"
}

output "rmin_e_serverless_connector_id" {
  value       = google_compute_subnetwork.rmin_e_serverless_connector.id
  description = "the ID of the resource with format projects/{{project}}/regions/{{region}}/subnetworks/{{name}}"
}

output "rmin_e_serverless_email_id" {
  value       = google_compute_subnetwork.rmin_e_serverless_email.id
  description = "the ID of the resource with format projects/{{project}}/regions/{{region}}/subnetworks/{{name}}"
}

output "idc_cloudrun_email_serverless_id" {
  value       = google_compute_subnetwork.idc_cloudrun_email_serverless.id
  description = "the ID of the resource with format projects/{{project}}/regions/{{region}}/subnetworks/{{name}}"
}

output "rmin_subscriber_peripheral_id" {
  value       = var.toggle_4583_1111_subscriber_services ? google_compute_subnetwork.rmin_subscriber_peripheral[0].id : null
  description = "the ID of the resource with format projects/{{project}}/regions/{{region}}/subnetworks/{{name}}"
}

output "rmin_api_serverless_id" {
  value       = google_compute_subnetwork.rmin_api_serverless.id
  description = "the ID of the resource with format projects/{{project}}/regions/{{region}}/subnetworks/{{name}}"
}
