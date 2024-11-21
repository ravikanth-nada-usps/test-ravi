variable "mc_db_instance_allocated_ip_range" {
  type = string
}

variable "mc_db_instance_availability_type" {
  type = string
}

variable "mc_db_instance_disk_autoresize" {
  type    = string
  default = "true"
}

variable "mc_db_instance_disk_autoresize_limit" {
  type = number
}

variable "mc_db_instance_disk_size_gb" {
  type = number
}

variable "mc_db_instance_log_rentention_days" {
  type = number
}

variable "mc_db_instance_private_network" {
  type = string
}

variable "mc_db_instance_query_insights_enabled" {
  type = string
}

variable "mc_db_instance_query_string_length" {
  type = number
}

variable "mc_db_instance_record_application_tags" {
  type = string
}

variable "mc_db_instance_record_client_address" {
  type = string
}

variable "mc_db_instance_retained_backups_count" {
  type = number
}

variable "mc_db_instance_tier" {
  type = string
}


variable "environment" {
  type = string
}

variable "project_id" {
  type = string
}

variable "rmin_mc_db_user_name" {
  type = string
}

variable "mc_db_instance_maint_update_track" {
  type = string
}