variable "project_id" {
  type = string
}

variable "toggle_4583_5673_myusps_migration" {
  type    = bool
  default = false
}

variable "toggle_4583_5681_consumer_portal" {
  type    = bool
  default = false
}

variable "pitr_enablement" {
  type = string
}

variable "dashboard_firestore_backup_retention" {
  type = string
}

