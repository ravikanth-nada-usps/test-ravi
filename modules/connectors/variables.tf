variable "project_id" {
  type = string
}

variable "toggle_4583_1111_subscriber_services" {
  type    = bool
  default = false
}

variable "toggle_4583_5673_myusps_migration" {
  type    = bool
  default = false
}

variable "environment" {
  type = string
}

variable "spring_profile" {
  type = string
}

variable "dashboard_serverless_authorized_subnetwork" {
  type = string
}

variable "dashboard_serverless_connector_machine_type" {
  type = string
}

variable "dashboard_serverless_connector_min_instances" {
  type = number
}

variable "dashboard_serverless_connector_max_instances" {
  type = number
}

variable "dashboard_serverless_conn_name" {
  type = string
}

variable "peripheral_serverless_authorized_subnetwork" {
  type = string
}

variable "peripheral_serverless_connector_machine_type" {
  type = string
}

variable "peripheral_serverless_connector_min_instances" {
  type = number
}

variable "peripheral_serverless_connector_max_instances" {
  type = number
}

variable "peripheral_serverless_conn_name" {
  type = string
}

variable "email_serverless_authorized_subnetwork" {
  type = string
}

variable "email_serverless_connector_machine_type" {
  type = string
}

variable "email_serverless_connector_min_instances" {
  type = number
}

variable "email_serverless_connector_max_instances" {
  type = number
}

variable "package_serverless_conn_name" {
  type = string
}

variable "package_serverless_connector_machine_type" {
  type = string
}

variable "package_serverless_connector_min_instances" {
  type = string
}

variable "package_serverless_connector_max_instances" {
  type = string
}

variable "subscriber_serverless_authorized_subnetwork" {
  type = string
}

variable "subscriber_serverless_connector_machine_type" {
  type = string
}

variable "subscriber_serverless_connector_min_instances" {
  type = number
}

variable "subscriber_serverless_connector_max_instances" {
  type = number
}

variable "email_serverless_conn_name" {
  type = string
}

variable "subscriber_serverless_conn_name" {
  type = string
}

variable "rmin_serverless_conn_name" {
  type = string
}

variable "rmin_serverless_conn_subnet_name" {
  type = string
}

variable "idc_email_serverless_name" {
  type = string
}

variable "idc_email_serverless_subnet_name" {
  type = string
}

variable "rmin_e_servless_email_name" {
  type = string
}

variable "rmin_e_servless_email_subnet_name" {
  type = string
}

variable "rmin_api_conn_name" {
  type = string
}

variable "rmin_api_conn_subnet_name" {
  type = string
}
