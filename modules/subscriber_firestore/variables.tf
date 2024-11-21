variable "project_id" {
  type = string
}

variable "toggle_4583_1111_subscriber_services" {
  type    = bool
  default = false
}

variable "toggle_4583_5680_frontend" {
  type    = bool
  default = false
}

variable "toggle_4583_5708_mdn_to_eng" {
  type    = bool
  default = false
}

variable "pitr_enablement" {
  type = string
}

variable "subscribers_firestore_backup_retention" {
  type = string
}