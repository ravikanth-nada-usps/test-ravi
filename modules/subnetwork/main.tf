# [START google_compute_subnetwork] 

resource "google_compute_subnetwork" "rmin_dashboard_serverless" {
  description   = "rmin-dashboard-serverless"
  ip_cidr_range = var.rmin_dashboard_serverless_ip_cidr_range

  log_config {
    aggregation_interval = "INTERVAL_5_SEC"
    flow_sampling        = "0.5"
    metadata             = "INCLUDE_ALL_METADATA"
  }

  name                       = var.rmin_dashboard_serverless_vpc_name
  network                    = var.authorized_network
  private_ip_google_access   = "true"
  private_ipv6_google_access = "DISABLE_GOOGLE_ACCESS"
  project                    = var.project_id
  purpose                    = "PRIVATE"
  region                     = "us-central1"
  stack_type                 = "IPV4_ONLY"
}

resource "google_compute_subnetwork" "rmin_subscriber_serverless" {
  description   = "rmin-subscriber-serverless"
  ip_cidr_range = var.rmin_subscriber_serverless_ip_cidr_range

  log_config {
    aggregation_interval = "INTERVAL_5_SEC"
    metadata             = "INCLUDE_ALL_METADATA"
    flow_sampling        = "0.5"

  }
  name                       = var.rmin_subscriber_serverless_vpc_name
  network                    = var.authorized_network
  private_ip_google_access   = "true"
  private_ipv6_google_access = "DISABLE_GOOGLE_ACCESS"
  project                    = var.project_id
  purpose                    = "PRIVATE"
  region                     = "us-central1"
  stack_type                 = "IPV4_ONLY"

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0
}

resource "google_compute_subnetwork" "rmin_peripheral" {
  description   = "rmin-peripheral"
  ip_cidr_range = var.rmin_peripheral_ip_cidr_range

  log_config {
    aggregation_interval = "INTERVAL_5_SEC"
    flow_sampling        = "0.5"
    metadata             = "INCLUDE_ALL_METADATA"
  }

  name                       = var.rmin_peripheral_vpc_name
  network                    = var.authorized_network
  private_ip_google_access   = "true"
  private_ipv6_google_access = "DISABLE_GOOGLE_ACCESS"
  project                    = var.project_id
  purpose                    = "PRIVATE"
  region                     = "us-central1"
  stack_type                 = "IPV4_ONLY"
}

resource "google_compute_subnetwork" "rmin_email_serverless" {
  description   = "rmin-email-serverless"
  ip_cidr_range = var.rmin_email_serverless_ip_cidr_range

  log_config {
    aggregation_interval = "INTERVAL_5_SEC"
    flow_sampling        = "0.5"
    metadata             = "INCLUDE_ALL_METADATA"
  }

  name                       = var.rmin_email_serverless_vpc_name
  network                    = var.authorized_network
  private_ip_google_access   = "true"
  private_ipv6_google_access = "DISABLE_GOOGLE_ACCESS"
  project                    = var.project_id
  purpose                    = "PRIVATE"
  region                     = "us-central1"
  stack_type                 = "IPV4_ONLY"
}

resource "google_compute_subnetwork" "rmin_peripheral_serverless" {
  description   = "rmin-peripheral-serverless"
  ip_cidr_range = var.rmin_peripheral_serverless_ip_cidr_range

  log_config {
    aggregation_interval = "INTERVAL_5_SEC"
    flow_sampling        = "0.5"
    metadata             = "INCLUDE_ALL_METADATA"
  }

  name                       = var.rmin_peripheral_serverless_vpc_name
  network                    = var.authorized_network
  private_ip_google_access   = "true"
  private_ipv6_google_access = "DISABLE_GOOGLE_ACCESS"
  project                    = var.project_id
  purpose                    = "PRIVATE"
  region                     = "us-central1"
  stack_type                 = "IPV4_ONLY"
}

resource "google_compute_subnetwork" "rmin_e_dataflow_peripheral" {
  name                     = var.rmin_e_dataflow_peripheral_name
  ip_cidr_range            = var.rmin_e_dataflow_peripheral_ip_cidr_range
  region                   = "us-east4"
  private_ip_google_access = true
  network                  = var.rmin_e_dataflow_peripheral_network
  stack_type               = "IPV4_ONLY"
}

resource "google_compute_subnetwork" "rmin_e_dataflow_email" {
  name                     = var.rmin_e_dataflow_email_name
  ip_cidr_range            = var.rmin_e_dataflow_email_ip_cidr_range
  region                   = "us-east4"
  private_ip_google_access = true
  network                  = var.rmin_e_dataflow_email_network
  stack_type               = "IPV4_ONLY"
}

resource "google_compute_subnetwork" "rmin_e_serverless_connector" {

  name                     = var.rmin_e_serverless_connector_name
  ip_cidr_range            = var.rmin_e_serverless_connector_ip_cidr_range
  region                   = "us-east4"
  private_ip_google_access = true
  network                  = var.rmin_e_serverless_connector_network
  stack_type               = "IPV4_ONLY"
}

resource "google_compute_subnetwork" "rmin_e_serverless_email" {

  name                     = var.rmin_e_serverless_email_name
  ip_cidr_range            = var.rmin_e_serverless_email_ip_cidr_range
  region                   = "us-east4"
  private_ip_google_access = true
  network                  = var.rmin_e_serverless_email_network
  stack_type               = "IPV4_ONLY"
}

resource "google_compute_subnetwork" "idc_cloudrun_email_serverless" {

  name                     = var.idc_cloudrun_email_serverless_name
  ip_cidr_range            = var.idc_cloudrun_email_serverless_ip_cidr_range
  region                   = "us-east4"
  private_ip_google_access = true
  network                  = var.idc_cloudrun_email_serverless_network
  stack_type               = "IPV4_ONLY"
}

resource "google_compute_subnetwork" "rmin_subscriber_peripheral" {
  description   = "rmin-subscriber-peripheral"
  ip_cidr_range = var.rmin_subscriber_peripheral_ip_cidr_range
  count         = var.toggle_4583_1111_subscriber_services ? 1 : 0

  log_config {
    aggregation_interval = "INTERVAL_5_SEC"
    flow_sampling        = "0.5"
    metadata             = "INCLUDE_ALL_METADATA"
  }

  name                       = var.rmin_subscriber_peripheral_name
  network                    = var.authorized_network
  private_ip_google_access   = "true"
  private_ipv6_google_access = "DISABLE_GOOGLE_ACCESS"
  project                    = var.project_id
  purpose                    = "PRIVATE"
  region                     = "us-central1"
  stack_type                 = "IPV4_ONLY"
}

resource "google_compute_subnetwork" "rmin_api_serverless" {
  project                    = var.project_id
  name                       = var.rmin_api_serverless_name
  ip_cidr_range              = "10.150.30.0/28"
  region                     = "us-central1"
  private_ip_google_access   = true
  private_ipv6_google_access = "DISABLE_GOOGLE_ACCESS"
  network                    = var.authorized_network
  stack_type                 = "IPV4_ONLY"
}

resource "google_compute_subnetwork" "rmin_proxy" {

  project       = var.project_id
  name          = "rmin-${var.environment}-proxy"
  ip_cidr_range = "10.6.0.0/23"
  region        = "us-central1"
  purpose       = "REGIONAL_MANAGED_PROXY"
  role          = "ACTIVE"
  network       = var.authorized_network
}

# [END google_compute_subnetwork] 
