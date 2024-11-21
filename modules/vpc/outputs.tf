output "rmin_e_vpc_id" {
  value       = google_compute_network.rmin_e_vpc.id
  description = "The ID of VPC with format projects/{{project}}/global/networks/{{name}}"
}

output "rmin_e_vpc_url" {
  value       = google_compute_network.rmin_e_vpc.self_link
  description = "The URI of the VPC"
}

output "rmin_psc_ip_redis_central_name" {
  value       = google_compute_global_address.rmin_psc_ip_redis_central.name
  description = "The name of the rmin_psc_ip_redis_central resource"
}

output "rmin_e_pvt_svc_connection_name" {
  value       = google_compute_global_address.rmin_e_pvt_svc_connection.name
  description = "The name of the rmin_e_pvt_svc_connection resource"
}