# [START google_vpc_access_connector] 

resource "google_vpc_access_connector" "rmin_dashboard_conn" {
  project = var.project_id
  name    = var.dashboard_serverless_conn_name
  subnet {
    name       = var.dashboard_serverless_authorized_subnetwork
    project_id = var.project_id
  }
  machine_type  = var.dashboard_serverless_connector_machine_type
  region        = "us-central1"
  min_instances = var.dashboard_serverless_connector_min_instances
  max_instances = var.dashboard_serverless_connector_max_instances
  lifecycle {
    ignore_changes = [max_throughput]
  }
}

resource "google_vpc_access_connector" "rmin_subscriber_conn" {
  project = var.project_id
  name    = var.subscriber_serverless_conn_name
  subnet {
    name       = var.subscriber_serverless_authorized_subnetwork
    project_id = var.project_id
  }
  machine_type  = var.subscriber_serverless_connector_machine_type
  region        = "us-central1"
  min_instances = var.subscriber_serverless_connector_min_instances
  max_instances = var.subscriber_serverless_connector_max_instances
  lifecycle {
    ignore_changes = [max_throughput]
  }

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0
}

resource "google_vpc_access_connector" "rmin_package_conn" {
  project = var.project_id
  name    = var.package_serverless_conn_name
  subnet {
    name       = var.spring_profile == "02d" ? format("id-%s-serverless-connector-central1-%s", var.environment, var.spring_profile) : format("id-serverless-central1-%s", var.spring_profile)
    project_id = "usps-admin"
  }
  machine_type  = var.package_serverless_connector_machine_type
  region        = "us-central1"
  min_instances = var.package_serverless_connector_min_instances
  max_instances = var.package_serverless_connector_max_instances
  lifecycle {
    ignore_changes = [max_throughput]
  }

  count = var.toggle_4583_5673_myusps_migration ? 1 : 0
}

resource "google_vpc_access_connector" "rmin_peripheral_conn" {
  project = var.project_id
  name    = var.peripheral_serverless_conn_name
  subnet {
    name       = var.peripheral_serverless_authorized_subnetwork
    project_id = var.project_id
  }
  machine_type  = var.peripheral_serverless_connector_machine_type
  region        = "us-central1"
  min_instances = var.peripheral_serverless_connector_min_instances
  max_instances = var.peripheral_serverless_connector_max_instances
  lifecycle {
    ignore_changes = [max_throughput]
  }
}

resource "google_vpc_access_connector" "rmin_email_conn" {
  project = var.project_id
  name    = var.email_serverless_conn_name
  subnet {
    name       = var.email_serverless_authorized_subnetwork
    project_id = var.project_id
  }
  machine_type  = var.email_serverless_connector_machine_type
  region        = "us-central1"
  min_instances = var.email_serverless_connector_min_instances
  max_instances = var.email_serverless_connector_max_instances
  lifecycle {
    ignore_changes = [max_throughput]
  }
}

resource "google_vpc_access_connector" "rmin_serverless_conn" {
  name    = var.rmin_serverless_conn_name
  project = var.project_id
  subnet {
    name       = var.rmin_serverless_conn_subnet_name
    project_id = var.project_id
  }
  machine_type  = "e2-standard-4"
  region        = "us-east4"
  min_instances = 2
  max_instances = 10
  lifecycle {
    ignore_changes = [max_throughput]
  }
}

resource "google_vpc_access_connector" "idc_email_serverless" {
  name    = var.idc_email_serverless_name
  project = var.project_id
  subnet {
    name       = var.idc_email_serverless_subnet_name
    project_id = var.project_id
  }
  machine_type  = "e2-micro"
  region        = "us-east4"
  min_instances = 2
  max_instances = 10
  lifecycle {
    ignore_changes = [max_throughput]
  }
}

resource "google_vpc_access_connector" "rmin_e_servless_email" {
  name    = var.rmin_e_servless_email_name
  project = var.project_id
  subnet {
    name       = var.rmin_e_servless_email_subnet_name
    project_id = var.project_id
  }
  machine_type  = "e2-standard-4"
  region        = "us-east4"
  min_instances = 2
  max_instances = 10
  lifecycle {
    ignore_changes = [max_throughput]
  }
}

resource "google_vpc_access_connector" "rmin_api_conn" {
  project = var.project_id
  name    = var.rmin_api_conn_name
  subnet {
    name       = var.rmin_api_conn_subnet_name
    project_id = var.project_id
  }
  machine_type  = "e2-standard-4"
  region        = "us-central1"
  min_instances = 2
  max_instances = 10
  lifecycle {
    ignore_changes = [max_throughput]
  }
}

# [END google_vpc_access_connector] 

