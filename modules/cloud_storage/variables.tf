variable "project_id" {
  type = string
}

variable "name_suffix" {
  type = string
}

variable "toggle_4583_1111_subscriber_services" {
  type    = bool
  default = false
}

variable "toggle_4583_5681_consumer_portal" {
  type    = bool
  default = false
}

variable "toggle_4583_xxxx_ext_caches" {
  type    = bool
  default = false
}

variable "mics_extract_file_upload_topic_name" {
  type = string
}

variable "toggle_4583_5708_mdn_to_eng" {
  type    = bool
  default = false
}

variable "toggle_4583_5717_rmin_backup_invar" {
  type    = bool
  default = false
}

variable "rmin_redis_export_backup_bucket_e_location_invar" {
  type = string
}                       

variable "rmin_redis_export_backup_bucket_e_storage_class_invar" {
  type = string
}                  

variable "rmin_redis_export_backup_bucket_e_lifecycle_rule_condition_age_invar" {
  type = string
}
   
variable "rmin_bigquery_export_backup_bucket_e_location_invar" {
  type = string
}
                    
variable "rmin_bigquery_export_backup_bucket_e_storage_class_invar" {
  type = string
}               

variable "rmin_bigquery_export_backup_bucket_e_lifecycle_rule_condition_age_invar" {
  type = string
}
