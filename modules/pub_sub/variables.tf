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

variable "toggle_4583_5673_myusps_migration" {
  type    = bool
  default = false
}

variable "toggle_4583_5668_price_change" {
  type    = bool
  default = false
}

variable "toggle_4583_5666_redesign_phase2" {
  type    = bool
  default = false
}

variable "toggle_4583_5681_consumer_portal" {
  type    = bool
  default = false
}

variable "toggle_4583_5690_ptr2" {
  type    = bool
  default = false
}

variable "toggle_4583_5680_frontend" {
  type    = bool
  default = false
}

variable "toggle_4583_5710_apigee_hybrid" {
  type    = bool
  default = false
}

variable "toggle_4583_xxxx_ext_caches" {
  type    = bool
  default = false
}

variable "dashboard_subscription_ack_deadline_seconds" {
  type = string
}

variable "dashboard_subscription_retain_acked_messages" {
  type = string
}

variable "dashboard_subscription_enable_message_ordering" {
  type = string
}

variable "dashboard_subscription_message_retention_duration" {
  type = string
}

variable "dashboard_subscription_ttl" {
  type = string
}

variable "dashboard_subscription_min_backoff" {
  type = string
}

variable "dashboard_subscription_max_backoff" {
  type = string
}

variable "dashboard_event_sub_service_account_email" {
  type = string
}

variable "dashboard_event_sub_push_endpoint" {
  type = string
}

variable "dashboard_api_logs_table_id" {
  type = string
}

variable "email_relay_cutover_url" {
  type = string
}

variable "email_topic_sub_service_account_email" {
  type = string
}

variable "image_api_logs_table_id" {
  type = string
}

variable "mc_report_sub_service_account_email" {
  type = string
}

variable "mc_report_cloud_sub_push_endpoint" {
  type = string
}

variable "account_revision_table_id" {
  type = string
}

variable "physical_address_revision_table_id" {
  type = string
}

variable "subscriber_api_logs_table_id" {
  type = string
}

variable "eagan_proxy_logs_table_id" {
  type = string
}

variable "subscriber_event_service_account_email" {
  type = string
}

variable "subscriber_event_push_endpoint" {
  type = string
}

variable "qr_code_service_sub_service_account_email" {
  type = string
}

variable "qr_code_service_sub_push_endpoint" {
  type = string
}

variable "package_notification_update_push_endpoint" {
  type = string
}

variable "rmin_package_notification_update_sa_email" {
  type = string
}

variable "package_notification_push_endpoint" {
  type = string
}

variable "rmin_package_notification_sa_email" {
  type = string
}

variable "package_event_push_endpoint" {
  type = string
}

variable "rmin_package_event_sa_email" {
  type = string
}

variable "package_notification_logs_table_id" {
  type = string
}

variable "package_api_logs_table_id" {
  type = string
}

variable "digest_click_logs_table_id" {
  type = string
}

variable "digest_tracking_errors_table_id" {
  type = string
}

variable "mc_click_logs_table_id" {
  type = string
}

variable "digest_open_logs_table_id" {
  type = string
}

variable "digest_opt_out_reason_table_id" {
  type = string
}


variable "subscriber_opt_in_settings_dlt_table_id" {
  type = string
}

variable "login_api_logs_table_id" {
  type = string
}

variable "package_sms_notification_push_endpoint" {
  type = string
}

variable "toggle_4583_xxxx_mc_reporting" {
  type    = bool
  default = false
}
