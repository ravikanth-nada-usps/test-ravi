# [START google_compute_address] 
resource "google_compute_address" "external_nat_ip" {

  name        = var.external_nat_ip_name
  description = "NAT router static IP"
  region      = "us-east4"
}

# [END google_compute_address] 

# [START google_compute_router] 
resource "google_compute_router" "router" {

  name    = var.router_name
  network = var.router_network
  region  = "us-east4"

  depends_on = [
    google_compute_address.external_nat_ip
  ]
}

# [END google_compute_router] 


# [START google_compute_router_nat] 
resource "google_compute_router_nat" "cloud_nat" {
  name                               = var.cloud_nat_name
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  nat_ips = [
    google_compute_address.external_nat_ip.self_link
  ]
  nat_ip_allocate_option              = "MANUAL_ONLY"
  min_ports_per_vm                    = 64
  max_ports_per_vm                    = 65536
  udp_idle_timeout_sec                = 30
  icmp_idle_timeout_sec               = 30
  tcp_established_idle_timeout_sec    = 1200
  tcp_transitory_idle_timeout_sec     = 30
  enable_dynamic_port_allocation      = true
  enable_endpoint_independent_mapping = false
  log_config {
    enable = false
    filter = "ALL"
  }

  subnetwork {
    name                    = var.cloud_nat_subnetwork_cloudrun_email_name
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  subnetwork {
    name                    = var.cloud_nat_subnetwork_email_name
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  subnetwork {
    name                    = var.cloud_nat_subnetwork_dataflow_email_name
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  router = google_compute_router.router.name
  region = "us-east4"

  depends_on = [
    google_compute_router.router
  ]
}

# [END google_compute_router_nat] 
