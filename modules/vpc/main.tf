# [START google_compute_network] 
resource "google_compute_network" "rmin_e_vpc" {
  name                    = var.rmin_e_vpc_name
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"

  lifecycle {
    ignore_changes = [description, enable_ula_internal_ipv6]
  }
}

# [END google_compute_network] 

# [START google_compute_firewall] 
resource "google_compute_firewall" "default_dataflow_rule" {
  project = var.project_id
  name    = "default-dataflow-rule"
  network = google_compute_network.rmin_e_vpc.self_link

  allow {
    protocol = "tcp"
    ports    = ["12345-12346"]
  }

  direction   = "INGRESS"
  priority    = 0
  source_tags = ["dataflow"]
  target_tags = ["dataflow"]

}

# [END google_compute_firewall] 

# [START google_compute_global_address] 

resource "google_compute_global_address" "rmin_e_pvt_svc_connection" {
  name          = var.rmin_e_pvt_svc_connection_name
  address_type  = "INTERNAL"
  purpose       = "VPC_PEERING"
  network       = google_compute_network.rmin_e_vpc.id
  address       = "10.100.1.0"
  prefix_length = 24
}

resource "google_compute_global_address" "rmin_psc_ip_redis_central" {
  name          = "rmin-psc-ip-redis-central"
  address_type  = "INTERNAL"
  purpose       = "VPC_PEERING"
  network       = google_compute_network.rmin_e_vpc.id
  address       = "10.200.1.0"
  prefix_length = 24
}

resource "google_compute_global_address" "rmin_psc_ip_cloud_sql" {
  name          = "rmin-psc-ip-cloud-sql"
  address_type  = "INTERNAL"
  purpose       = "VPC_PEERING"
  network       = google_compute_network.rmin_e_vpc.id
  prefix_length = 24
}

resource "google_compute_global_address" "rmin_psc_ip_cloud_sql_central" {
  name          = "rmin-psc-ip-cloud-sql-central"
  address_type  = "INTERNAL"
  purpose       = "VPC_PEERING"
  network       = google_compute_network.rmin_e_vpc.id
  prefix_length = 24
}

# [END google_compute_global_address]


# [START google_service_networking_connection]
resource "google_service_networking_connection" "default" {
  network = google_compute_network.rmin_e_vpc.id
  service = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [
    google_compute_global_address.rmin_e_pvt_svc_connection.name,
    google_compute_global_address.rmin_psc_ip_cloud_sql.name,
    google_compute_global_address.rmin_psc_ip_cloud_sql_central.name,
    google_compute_global_address.rmin_psc_ip_redis_central.name,
  ]

  lifecycle {
    ignore_changes = [network]
  }
}

# [END google_service_networking_connection]
