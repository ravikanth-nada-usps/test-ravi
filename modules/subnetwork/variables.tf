variable "project_id" {
  type = string
}

variable "authorized_network" {
  type = string
}

variable "environment" {
  type = string
}

variable "toggle_4583_1111_subscriber_services" {
  type    = bool
  default = false
}

variable "idc_cloudrun_email_serverless_ip_cidr_range" {
  type = string
}

variable "idc_cloudrun_email_serverless_name" {
  type = string
}

variable "idc_cloudrun_email_serverless_network" {
  type = string
}

variable "rmin_dashboard_serverless_ip_cidr_range" {
  type = string
}

variable "rmin_dashboard_serverless_vpc_name" {
  type = string
}

variable "rmin_e_dataflow_email_ip_cidr_range" {
  type = string
}

variable "rmin_e_dataflow_email_name" {
  type = string
}

variable "rmin_e_dataflow_email_network" {
  type = string
}

variable "rmin_e_dataflow_peripheral_ip_cidr_range" {
  type = string
}

variable "rmin_e_dataflow_peripheral_name" {
  type = string
}

variable "rmin_e_dataflow_peripheral_network" {
  type = string
}

variable "rmin_e_serverless_connector_name" {
  type = string
}

variable "rmin_e_serverless_connector_network" {
  type = string
}

variable "rmin_e_serverless_connector_ip_cidr_range" {
  type = string
}

variable "rmin_e_serverless_email_ip_cidr_range" {
  type = string
}

variable "rmin_e_serverless_email_name" {
  type = string
}

variable "rmin_e_serverless_email_network" {
  type = string
}

variable "rmin_email_serverless_ip_cidr_range" {
  type = string
}

variable "rmin_email_serverless_vpc_name" {
  type = string
}

variable "rmin_subscriber_serverless_vpc_name" {
  type = string
}

variable "rmin_subscriber_serverless_ip_cidr_range" {
  type = string
}

variable "rmin_peripheral_ip_cidr_range" {
  type = string
}

variable "rmin_peripheral_serverless_ip_cidr_range" {
  type = string
}

variable "rmin_peripheral_serverless_vpc_name" {
  type = string
}

variable "rmin_peripheral_vpc_name" {
  type = string
}

variable "rmin_subscriber_peripheral_name" {
  type = string
}

variable "rmin_subscriber_peripheral_ip_cidr_range" {
  type = string
}

variable "rmin_api_serverless_name" {
  type = string
}
