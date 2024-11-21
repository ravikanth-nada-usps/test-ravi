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

variable "toggle_4583_5681_consumer_portal" {
  type    = bool
  default = false
}

variable "toggle_4583_5680_frontend" {
  type    = bool
  default = false
}

variable "name_suffix" {
  type = string
}

variable "partition_expiration_ms" {
  type = string
}

variable "zip5_timezone_bucket" {
  type = string
}

variable "toggle_4583_xxxx_mc_reporting" {
  type    = bool
  default = false
}

variable "toggle_4583_5666_redesign_phase2" {
  type    = bool
  default = false
}

variable "toggle_4583_5708_mdn_to_eng" {
  type    = bool
  default = false
}

variable "toggle_4583_xxxx_ext_caches" {
  type    = bool
  default = false
}