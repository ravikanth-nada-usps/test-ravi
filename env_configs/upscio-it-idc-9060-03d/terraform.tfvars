# [START toggle Variables]
toggle_4583_1111_subscriber_services    = true
toggle_4583_5673_myusps_migration       = true
toggle_4583_5668_price_change           = true
toggle_4583_5681_consumer_portal        = true
toggle_4583_xxxx_mc_reporting           = true
toggle_4583_5666_redesign_phase2        = true
toggle_4583_5690_ptr2                   = true
toggle_4583_5680_frontend               = true
toggle_4583_5708_mdn_to_eng             = true
toggle_4583_5710_apigee_hybrid          = false
toggle_4583_5717_rmin_backup            = true
toggle_4583_xxxx_ext_caches             = true

# [END toggle Variables]

# [START General Variables]
project_id               = "upscio-it-idc-9060-03d"
name_suffix              = "003d"
spring_profile           = "03d"
environment              = "dev"
authorized_network       = "projects/upscio-it-idc-9060-03d/global/networks/rmin-dev-3-e-vpc"
pitr_enablement          = "POINT_IN_TIME_RECOVERY_DISABLED"
id_env_url               = "dev-id.usps.com"
informeddelivery_env_url = "dev-informeddelivery.usps.com"
private_key_filename     = "dev_informeddelivery_usps_com_key.pem"
certificate_filename     = "dev_informeddelivery_usps_com_cert.pem"

# [END General Variables]

# [START cloud_run Variables]

### Versions ###
dashboard_event_version             = "1.1.2"
dashboard_api_version               = "1.1.30"
dashboard_api_internal_version      = "1.1.23"
eagan_proxy_version                 = "1.0.5"
image_api_version                   = "1.0.8"
login_api_version                   = "1.0.4"
mics_subscriber_version             = "1.0.5"
subscriber_api_version              = "1.0.17"
subscriber_event_version            = "1.0.15"
package_notification_update_version = "1.0.3"
package_notification_version        = "1.0.25"
package_event_version               = "1.0.10"
package_api_version                 = "1.0.25"
mc_report_version                   = "1.1.3"
mc_api_version                      = "1.3.0"
qr_code_version                     = "1.0.9"
digest_tracking_version             = "1.0.7"
consumer_portal_version             = "1.0.20"


### Dashboard event processor ####
dashboard_event_image_location                   = "us-docker.pkg.dev/uspscio-it-rminid-4583-00r/rmin-docker-repo/rmin/cloud-run/rmin-cloud-dashboard-event-processor-run"
dashboard_event_service_account                  = "dev-dashboard-event@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
firestore_expiry_days                            = 120
dashboard_event_trace_ratio                      = "0.0"
dashboard_event_trace_sample                     = "false"
dashboard_toggle_parcel_locker                   = "true"
dashboard_event_min_instance_count               = 0
dashboard_event_max_instance_count               = 100
dashboard_event_execution_environment            = "EXECUTION_ENVIRONMENT_GEN2"
dashboard_event_max_instance_request_concurrency = 80
dashboard_event_timeout                          = "300s"
dashboard_event_cpu_value                        = "1"
dashboard_event_memory_value                     = "1Gi"
dashboard_toggle_send_to_locker_and_inbound      = "false"
dashboard_toggle_usps_possession_ind             = "true"

### Dashboard API ####
dashboard_api_image_location                   = "us-docker.pkg.dev/uspscio-it-rminid-4583-00r/rmin-docker-repo/rmin/cloud-run/rmin-cloud-dashboard-api"
dashboard_api_service_account                  = "dev-cloud-dashboard-api@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
dashboard_api_decryptionKey                    = "$${sm://rmin-url-encryption-key}"
dashboard_api_min_instance_count               = 0
dashboard_api_max_instance_count               = 100
dashboard_api_execution_environment            = "EXECUTION_ENVIRONMENT_GEN2"
dashboard_api_max_instance_request_concurrency = 80
dashboard_api_timeout                          = "300s"
dashboard_api_cpu_value                        = "1"
dashboard_api_memory_value                     = "512Mi"
dashboard_api_toggle_mail_tracking_cloud_url   = "false"
dashboard_api_toggle_fraud_logic_external      = "false"
dashboard_api_toggle_parcel_logic_external     = "false"
image_api_external_url                         = "https://api-dev.usps.com/informed-delivery-images/v1"

dashboard_api_internal_min_instance_count               = 0
dashboard_api_internal_max_instance_request_concurrency = 80
dashboard_api_internal_max_instance_count               = 100
dashboard_api_internal_timeout                          = "300s"
dashboard_api_internal_cpu_value                        = "1"
dashboard_api_internal_memory_value                     = "512Mi"
dashboard_api_toggle_fraud_logic_internal               = "true"
dashboard_api_toggle_parcel_logic_internal              = "true"
dashboard_api_toggle_ecrypt_prem_digest_campaign_clicks = "true"

### Eagan Proxy ####
eagan_proxy_image_location                   = "us-docker.pkg.dev/uspscio-it-rminid-4583-00r/rmin-docker-repo/rmin/cloud-run/rmin-cloud-eagan-proxy"
eagan_proxy_service_account                  = "dev-eagan-proxy@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
eagan_proxy_min_instance_count               = 0
eagan_proxy_max_instance_count               = 100
eagan_proxy_execution_environment            = "EXECUTION_ENVIRONMENT_GEN2"
eagan_proxy_max_instance_request_concurrency = 80
eagan_proxy_timeout                          = "300s"
eagan_proxy_cpu_value                        = "1"
eagan_proxy_memory_value                     = "512Mi"

### Image API ####
image_api_image_location                   = "us-docker.pkg.dev/uspscio-it-rminid-4583-00r/rmin-docker-repo/rmin/cloud-run/rmin-cloud-image-api"
image_api_service_account                  = "dev-cloud-image-api@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
image_api_min_instance_count               = 0
image_api_max_instance_count               = 100
image_api_execution_environment            = "EXECUTION_ENVIRONMENT_GEN2"
image_api_max_instance_request_concurrency = 80
image_api_timeout                          = "300s"
image_api_cpu_value                        = "1"
image_api_memory_value                     = "512Mi"

### Login API ####
login_api_image_location                   = "us-docker.pkg.dev/uspscio-it-rminid-4583-00r/rmin-docker-repo/rmin/cloud-run/rmin-cloud-login-api"
login_api_service_account                  = "dev-login-api@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
login_api_min_instance_count               = 0
login_api_max_instance_count               = 100
login_api_execution_environment            = "EXECUTION_ENVIRONMENT_GEN2"
login_api_max_instance_request_concurrency = 80
login_api_timeout                          = "300s"
login_api_cpu_value                        = "1"
login_api_memory_value                     = "512Mi"

### Subscriber API ###
subscriber_api_image_location                   = "us-docker.pkg.dev/uspscio-it-rminid-4583-00r/rmin-docker-repo/rmin/cloud-run/rmin-cloud-subscriber-api"
subscriber_api_service_account                  = "dev-subscriber-api-service@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
subscriber_api_min_instance_count               = 0
subscriber_api_max_instance_count               = 100
subscriber_api_execution_environment            = "EXECUTION_ENVIRONMENT_GEN2"
subscriber_api_max_instance_request_concurrency = 80
subscriber_api_timeout                          = "300s"
subscriber_api_cpu_value                        = "1"
subscriber_api_memory_value                     = "512Mi"

### Subscriber Event ###
subscriber_event_image_location                   = "us-docker.pkg.dev/uspscio-it-rminid-4583-00r/rmin-docker-repo/rmin/cloud-run/rmin-cloud-subscriber-service"
subscriber_event_service_account                  = "dev-subscriber-service@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
subscriber_event_min_instance_count               = 0
subscriber_event_max_instance_count               = 100
subscriber_event_execution_environment            = "EXECUTION_ENVIRONMENT_GEN2"
subscriber_event_max_instance_request_concurrency = 80
subscriber_event_timeout                          = "300s"
subscriber_event_cpu_value                        = "1"
subscriber_event_memory_value                     = "512Mi"
firestore_subscriber_expiry_days                  = 30

### Mics Subscriber ###
mics_subscriber_image_location                   = "us-docker.pkg.dev/uspscio-it-rminid-4583-00r/rmin-docker-repo/rmin/cloud-run/rmin-cloud-mics-subscriber-extract"
mics_subscriber_service_account                  = "dev-mics-subscriber-extract@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
mics_subscriber_min_instance_count               = 0
mics_subscriber_max_instance_count               = 100
mics_subscriber_execution_environment            = "EXECUTION_ENVIRONMENT_GEN2"
mics_subscriber_max_instance_request_concurrency = 80
mics_subscriber_timeout                          = "300s"
mics_subscriber_cpu_value                        = "1"
mics_subscriber_memory_value                     = "1Gi"

### Package Event ###
package_event_image_location                   = "us-docker.pkg.dev/uspscio-it-rminid-4583-00r/rmin-docker-repo/rmin/cloud-run/rmin-cloud-package-event-processor"
package_event_service_account                  = "dev-pkg-event-processor@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
package_event_min_instance_count               = 0
package_event_max_instance_count               = 100
package_event_execution_environment            = "EXECUTION_ENVIRONMENT_GEN2"
package_event_max_instance_request_concurrency = 80
package_event_timeout                          = "300s"
package_event_cpu_value                        = "1"
package_event_memory_value                     = "512Mi"

### Package Notification Processor ###
package_notification_image_location                   = "us-docker.pkg.dev/uspscio-it-rminid-4583-00r/rmin-docker-repo/rmin/cloud-run/rmin-cloud-package-notification-proc-run"
package_notification_service_account                  = "dev-pkg-notif-processor@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
package_notification_min_instance_count               = 0
package_notification_max_instance_count               = 100
package_notification_execution_environment            = "EXECUTION_ENVIRONMENT_GEN2"
package_notification_max_instance_request_concurrency = 80
package_notification_timeout                          = "300s"
package_notification_cpu_value                        = "1"
package_notification_memory_value                     = "512Mi"

package_notification_sms_min_instance_count               = 0
package_notification_sms_max_instance_count               = 100
package_notification_sms_execution_environment            = "EXECUTION_ENVIRONMENT_GEN2"
package_notification_sms_max_instance_request_concurrency = 80
package_notification_sms_timeout                          = "300s"
package_notification_sms_cpu_value                        = "1"
package_notification_sms_memory_value                     = "512Mi"

### Package API ###
package_api_image_location                   = "us-docker.pkg.dev/uspscio-it-rminid-4583-00r/rmin-docker-repo/rmin/cloud-run/rmin-cloud-package-api"
package_api_service_account                  = "dev-cloud-package-api@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
package_api_min_instance_count               = 0
package_api_max_instance_count               = 100
package_api_execution_environment            = "EXECUTION_ENVIRONMENT_GEN2"
package_api_max_instance_request_concurrency = 80
package_api_timeout                          = "300s"
package_api_cpu_value                        = "1"
package_api_memory_value                     = "512Mi"
package_api_usps_base_url                    = "https://api-dev.usps.com"

### Package Notification Update Processor ###
package_notification_update_image_location                   = "us-docker.pkg.dev/uspscio-it-rminid-4583-00r/rmin-docker-repo/rmin/cloud-run/rmin-cloud-package-notification-update-processor"
package_notification_update_service_account                  = "dev-pkg-notif-update@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
package_notification_update_min_instance_count               = 0
package_notification_update_max_instance_count               = 100
package_notification_update_execution_environment            = "EXECUTION_ENVIRONMENT_GEN2"
package_notification_update_max_instance_request_concurrency = 80
package_notification_update_timeout                          = "300s"
package_notification_update_cpu_value                        = "1"
package_notification_update_memory_value                     = "512Mi"

### Mc Report Service ####
mc_report_image_location                   = "us-docker.pkg.dev/uspscio-it-rminid-4583-00r/rmin-docker-repo/rmin/cloud-run/rmin-cloud-mc-report-service"
mc_report_service_account                  = "dev-mc-report-service@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
mc_report_min_instance_count               = 0
mc_report_max_instance_count               = 100
mc_report_execution_environment            = "EXECUTION_ENVIRONMENT_GEN2"
mc_report_max_instance_request_concurrency = 80
mc_report_timeout                          = "300s"
mc_report_cpu_value                        = "1"
mc_report_memory_value                     = "1Gi"

### MC API ####
mc_api_image_location                   = "us-docker.pkg.dev/uspscio-it-rminid-4583-00r/rmin-docker-repo/rmin/cloud-run/rmin-cloud-mc-api"
mc_api_service_account                  = "dev-mc-report-service@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
mc_api_min_instance_count               = 0
mc_api_max_instance_count               = 100
mc_api_execution_environment            = "EXECUTION_ENVIRONMENT_GEN2"
mc_api_max_instance_request_concurrency = 80
mc_api_timeout                          = "300s"
mc_api_cpu_value                        = "1"
mc_api_memory_value                     = "512Mi"
mc_api_toggle_summary_by_detail         = true

### QR Code Service ####
qr_code_image_location                   = "us-docker.pkg.dev/uspscio-it-rminid-4583-00r/rmin-docker-repo/rmin/cloud-run/rmin-cloud-qr-code-service"
qr_code_service_account                  = "dev-qr-code-service@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
qr_code_min_instance_count               = 0
qr_code_max_instance_count               = 100
qr_code_execution_environment            = "EXECUTION_ENVIRONMENT_GEN2"
qr_code_max_instance_request_concurrency = 80
qr_code_timeout                          = "300s"
qr_code_cpu_value                        = "1"
qr_code_memory_value                     = "1Gi"
qr_code_rest_endpoint                    = "https://qrcms-qrcode-retriever-kc7kk5zvya-uc.a.run.app"
qr_code_toggle_retry                     = "true"
qr_code_toggle_usps_possession_ind       = "true"

### Digest Tracking ####
digest_tracking_image_location                   = "us-docker.pkg.dev/uspscio-it-rminid-4583-00r/rmin-docker-repo/rmin/cloud-run/rmin-cloud-digest-tracking"
digest_tracking_service_account                  = "dev-digest-tracking@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
digest_tracking_min_instance_count               = 0
digest_tracking_max_instance_count               = 100
digest_tracking_execution_environment            = "EXECUTION_ENVIRONMENT_GEN2"
digest_tracking_max_instance_request_concurrency = 80
digest_tracking_timeout                          = "300s"
digest_tracking_cpu_value                        = "1"
digest_tracking_memory_value                     = "1Gi"
digest_tracking_redirect_https_env_url           = "https://dev-informeddelivery.usps.com"
digest_tracking_cloud_url_encrypted_toggle       = "true"
digest_tracking_base_url_ridealong_click         = "https://dev-informeddelivery.usps.com/tracking/RidealongClick?"
digest_tracking_base_url_click_track             = "https://dev-informeddelivery.usps.com/tracking/ClickTrack?"

### Consumer Portal ###
consumer_portal_image_location                   = "us-docker.pkg.dev/uspscio-it-rminid-4583-00r/rmin-docker-repo/rmin/cloud-run/rmin-cloud-consumer-portal-frontend"
consumer_portal_service_account                  = "dev-consumer-portal@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
consumer_portal_min_instance_count               = 0
consumer_portal_max_instance_count               = 100
consumer_portal_execution_environment            = "EXECUTION_ENVIRONMENT_GEN2"
consumer_portal_max_instance_request_concurrency = 80
consumer_portal_timeout                          = "300s"
consumer_portal_cpu_value                        = "1"
consumer_portal_memory_value                     = "512Mi"

dashboard_event_cpu_idle        = "true"
subscriber_api_cpu_idle         = "true"
subscriber_event_cpu_idle       = "true"
dashboard_api_cpu_idle          = "true"
dashboard_api_internal_cpu_idle = "true"
eagan_proxy_cpu_idle            = "true"
image_api_cpu_idle              = "true"
login_api_cpu_idle              = "true"
mics_subscriber_cpu_idle        = "true"
package_api_cpu_idle            = "true"
package_event_cpu_idle          = "true"
package_notification_cpu_idle   = "true"
mc_report_cpu_idle              = "true"
mc_api_cpu_idle                 = "true"
qr_code_cpu_idle                = "true"
digest_tracking_cpu_idle        = "true"
consumer_portal_cpu_idle        = "true"

# [END cloud_run Variables]

# [START pub_sub Variables]
dashboard_subscription_ack_deadline_seconds       = "120"
dashboard_subscription_retain_acked_messages      = "false"
dashboard_subscription_enable_message_ordering    = "false"
dashboard_subscription_message_retention_duration = "604800s"
dashboard_subscription_ttl                        = ""
dashboard_subscription_min_backoff                = "0s"
dashboard_subscription_max_backoff                = "5s"
dashboard_event_sub_service_account_email         = "dev-dashboard-event@upscio-it-idc-9060-03d.iam.gserviceaccount.com"

subscriber_topic2_name = "rmin-subscriber-topic-2-e-003d"

campaign_subscription_name                       = "rmin-campaign-subscription-c-003d"
campaign_topic_name                              = "rmin-campaign-topic-e-003d"
campaign_subscription_ack_deadline_seconds       = "10"
campaign_subscription_retain_acked_messages      = "false"
campaign_subscription_enable_message_ordering    = "false"
campaign_subscription_message_retention_duration = "604800s"
email_relay_cutover_url                          = "https://rmin-cloud-email-relay-ujzb7klvvq-uc.a.run.app"
email_topic_sub_push_endpoint                    = "https://rmin-cloud-email-relay-run-ujzb7klvvq-uk.a.run.app"
email_topic_sub_service_account_email            = "dev-email-relay@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
mc_report_cloud_sub_push_endpoint                = "https://rmin-cloud-mc-report-service-ujzb7klvvq-uc.a.run.app/reportService/"
mc_report_sub_service_account_email              = "dev-mc-report-service@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
subscriber_event_service_account_email           = "dev-subscriber-service@upscio-it-idc-9060-03d.iam.gserviceaccount.com"

qr_code_service_sub_push_endpoint         = "https://rmin-cloud-qr-code-service-ujzb7klvvq-uc.a.run.app/processQrCode"
qr_code_service_sub_service_account_email = "dev-qr-code-service@upscio-it-idc-9060-03d.iam.gserviceaccount.com"


# [END pub_sub Variables]

# [START big_query Variables]
partition_expiration_ms = 63113852000
# [END big_query Variables]

# [START cloud_function Variables]
image_dimension_service_account                             = "dev-image-dimensions@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
image_dimension_function_name                               = "rmin-cloud-image-dimension-func-c-003d"
image_dimension_zip_file_name                               = "templates/functions/rmin-cloud-image-dimension-func-main.zip"
image_dimension_min_instance                                = 2
image_dimension_max_instance                                = 1000
image_dimension_memory                                      = "2Gi"
image_dimension_timeout                                     = 180
image_dimension_max_concurrency                             = 150
image_dimension_cpu                                         = 1
redischeck_service_account                                  = "upscio-it-idc-9060-03d@appspot.gserviceaccount.com"
redischeck_source_bucket                                    = "rmin-template-bucket-e-003d"
redischeck_zip_file_name                                    = "templates/functions/rmin-cloud-redis-func-001.zip"
redischeck_subscriber_cache_c_function_name                 = "rmin-redischeck-subscriber-cache-c-003d"
redischeck_subscriber_cache_c_topic                         = "projects/upscio-it-idc-9060-03d/topics/rmin-redischeck-subscriber-2-e-003d"
redischeck_subscriber_cache_c_min_instance                  = 0
redischeck_subscriber_cache_c_max_instance                  = 10
redischeck_subscriber_cache_c_memory                        = "256M"
redischeck_subscriber_cache_c_timeout                       = 60
redischeck_subscriber_cache_c_max_concurrency               = 10
redischeck_subscriber_cache_c_cpu                           = 1
redischeck_mail_campaign_function_name                      = "rmin-redischeck-mail-campaign-cache-c-003d"
redischeck_mail_campaign_min_instance                       = 0
redischeck_mail_campaign_max_instance                       = 10
redischeck_mail_campaign_memory                             = "256M"
redischeck_mail_campaign_timeout                            = 60
redischeck_mail_campaign_max_concurrency                    = 10
redischeck_mail_campaign_cpu                                = 1
redischeck_package_campaign_function_name                   = "rmin-redischeck-package-campaign-cache-c-003d"
redischeck_package_campaign_min_instance                    = 0
redischeck_package_campaign_max_instance                    = 10
redischeck_package_campaign_memory                          = "256M"
redischeck_package_campaign_timeout                         = 60
redischeck_package_campaign_max_concurrency                 = 10
redischeck_package_campaign_cpu                             = 1
redischeck_mics_locks_c_function_name                       = "rmin-redischeck-mics-locks-cache-c-003d"
redischeck_mics_locks_c_topic                               = "projects/upscio-it-idc-9060-03d/topics/rmin-redischeck-locks-cache-e-2-003d"
redischeck_mics_locks_c_min_instance                        = 0
redischeck_mics_locks_c_max_instance                        = 10
redischeck_mics_locks_c_memory                              = "256M"
redischeck_mics_locks_c_timeout                             = 60
redischeck_mics_locks_c_max_concurrency                     = 10
redischeck_mics_locks_c_cpu                                 = 1
rmin_alerts_e_avail_mem_mb                                  = 256
rmin_alerts_e_domain_name                                   = "dev.informeddelivery.usps.com"
rmin_alerts_e_from_email                                    = "USPSInformeddelivery@dev.informeddelivery.usps.com"
rmin_alerts_e_max_instances                                 = 3000
rmin_alerts_e_sa_email                                      = "dev-email-notification@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
rmin_alerts_e_timeout                                       = 60
rmin_alerts_e_to_email                                      = "WBInformedDelivery-Developers@usps.gov"
rmin_alerts_e_vpc_connector                                 = "projects/upscio-it-idc-9060-03d/locations/us-east4/connectors/rmin-dev-serverless-conn"
rmin_alerts_e_secret                                        = "idc-dev-mailgun-key"
rmin_alerts_e_secret_version                                = "1"
rmin_cloud_zip5_timezone_func_c_bigquery_table              = "upscio-it-idc-9060-03d.rmin_operationaldata_bigquery_e_003d.ZIP5_TIMEZONE"
rmin_cloud_zip5_timezone_func_c_available_cpu               = 0.1666
rmin_cloud_zip5_timezone_func_c_max_concurrency             = 1
rmin_cloud_zip5_timezone_func_c_max_instance                = 50
rmin_cloud_zip5_timezone_func_c_memory                      = "256M"
rmin_cloud_zip5_timezone_func_c_min_instance                = 0
rmin_cloud_zip5_timezone_func_c_sa_email                    = "dev-zip5-tz-func@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
rmin_cloud_zip5_timezone_func_c_timeout                     = 540
rmin_cloud_zip5_timezone_func_c_vpc_connector               = "projects/upscio-it-idc-9060-03d/locations/us-central1/connectors/rmin-dev-peripheral-conn"
rmin_cloud_zip5_timezone_func_bigquery_table                = "upscio-it-idc-9060-03d.rmin_operationaldata_bigquery_e_003d.ZIP5_TIMEZONE"
rmin_cloud_zip5_timezone_func_available_cpu                 = 0.1666
rmin_cloud_zip5_timezone_func_max_concurrency               = 1
rmin_cloud_zip5_timezone_func_max_instance                  = 50
rmin_cloud_zip5_timezone_func_memory                        = "256M"
rmin_cloud_zip5_timezone_func_min_instance                  = 0
rmin_cloud_zip5_timezone_func_sa_email                      = "dev-zip5-tz-func@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
rmin_cloud_zip5_timezone_func_timeout                       = 540
rmin_cloud_zip5_timezone_func_vpc_connector                 = "projects/upscio-it-idc-9060-03d/locations/us-east4/connectors/rmin-dev-serverless-conn"
rmin_cloudsql_runpartman_c_db_host                          = "/cloudsql/upscio-it-idc-9060-03d:us-central1:idc-dev-rmin-mail-delivery-notification-c"
rmin_cloudsql_runpartman_c_db_name                          = "rmin_mail_delivery_notification_db"
rmin_cloudsql_runpartman_c_db_port                          = "5432"
rmin_cloudsql_runpartman_c_db_user                          = "drmin"
rmin_cloudsql_runpartman_c_available_cpu                    = 0.1666
rmin_cloudsql_runpartman_c_max_concurrency                  = 1
rmin_cloudsql_runpartman_c_max_instance                     = 100
rmin_cloudsql_runpartman_c_memory                           = "256M"
rmin_cloudsql_runpartman_c_min_instance                     = 0
rmin_cloudsql_runpartman_c_mount_path                       = "/etc/secrets/cloudsql"
rmin_cloudsql_runpartman_c_sa_email                         = "dev-cloud-sql-partman@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
rmin_cloudsql_runpartman_c_secret                           = "rmin-mail-delivery-notification-drmin-key-c"
rmin_cloudsql_runpartman_c_timeout                          = 60
rmin_cloudsql_runpartman_c_vpc_connector                    = "projects/upscio-it-idc-9060-03d/locations/us-central1/connectors/rmin-dev-peripheral-conn"
rmin_cloudsql_runpartman_db_host                            = "/cloudsql/upscio-it-idc-9060-03d:us-central1:idc-dev-rmin-mail-delivery-notification"
rmin_cloudsql_runpartman_db_name                            = "rmin_mail_delivery_notification_db"
rmin_cloudsql_runpartman_db_port                            = "5432"
rmin_cloudsql_runpartman_db_user                            = "drmin"
rmin_cloudsql_runpartman_available_cpu                      = 0.1666
rmin_cloudsql_runpartman_max_concurrency                    = 1
rmin_cloudsql_runpartman_max_instance                       = 100
rmin_cloudsql_runpartman_memory                             = "256M"
rmin_cloudsql_runpartman_min_instance                       = 0
rmin_cloudsql_runpartman_mount_path                         = "/etc/secrets/cloudsql"
rmin_cloudsql_runpartman_sa_email                           = "dev-cloud-sql-partman@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
rmin_cloudsql_runpartman_secret                             = "rmin-mail-delivery-notification-drmin-key"
rmin_cloudsql_runpartman_timeout                            = 60
rmin_cloudsql_runpartman_vpc_connector                      = "projects/upscio-it-idc-9060-03d/locations/us-east4/connectors/rmin-dev-serverless-conn"
rmin_cloudsql_runpartman_digest_db_host                     = "/cloudsql/upscio-it-idc-9060-03d:us-central1:idc-dev-rmin-digest"
rmin_cloudsql_runpartman_digest_db_name                     = "rmin_digest_db"
rmin_cloudsql_runpartman_digest_db_port                     = "5432"
rmin_cloudsql_runpartman_digest_db_user                     = "drmin"
rmin_cloudsql_runpartman_digest_available_cpu               = 0.1666
rmin_cloudsql_runpartman_digest_max_concurrency             = 1
rmin_cloudsql_runpartman_digest_max_instance                = 100
rmin_cloudsql_runpartman_digest_memory                      = "256M"
rmin_cloudsql_runpartman_digest_min_instance                = 0
rmin_cloudsql_runpartman_digest_mount_path                  = "/etc/secrets/cloudsql"
rmin_cloudsql_runpartman_digest_sa_email                    = "dev-cloud-sql-partman@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
rmin_cloudsql_runpartman_digest_secret                      = "rmin-digest-drmin-key"
rmin_cloudsql_runpartman_digest_timeout                     = 60
rmin_cloudsql_runpartman_digest_vpc_connector               = "projects/upscio-it-idc-9060-03d/locations/us-central1/connectors/rmin-dev-dashboard-conn"
rmin_redischeck_campaign_e_avail_mem_mb                     = 256
rmin_redischeck_campaign_e_max_instances                    = 3000
rmin_redischeck_campaign_e_sa_email                         = "upscio-it-idc-9060-03d@appspot.gserviceaccount.com"
rmin_redischeck_campaign_e_timeout                          = 60
rmin_redischeck_campaign_e_vpc_connector                    = "projects/upscio-it-idc-9060-03d/locations/us-east4/connectors/rmin-dev-serverless-conn"
rmin_redischeck_flats_cache_e_avail_mem_mb                  = 256
rmin_redischeck_flats_cache_e_max_instances                 = 3000
rmin_redischeck_flats_cache_e_sa_email                      = "upscio-it-idc-9060-03d@appspot.gserviceaccount.com"
rmin_redischeck_flats_cache_e_timeout                       = 60
rmin_redischeck_flats_cache_e_vpc_connector                 = "projects/upscio-it-idc-9060-03d/locations/us-east4/connectors/rmin-dev-serverless-conn"
rmin_redischeck_flats_cache_c_avail_mem_mb                  = 256
rmin_redischeck_flats_cache_c_max_instances                 = 3000
rmin_redischeck_flats_cache_c_sa_email                      = "upscio-it-idc-9060-03d@appspot.gserviceaccount.com"
rmin_redischeck_flats_cache_c_timeout                       = 60
rmin_redischeck_flats_cache_c_vpc_connector                 = "projects/upscio-it-idc-9060-03d/locations/us-central1/connectors/rmin-dev-email-conn"
rmin_redischeck_relay_cache_c_avail_mem_mb                  = 256
rmin_redischeck_relay_cache_c_max_instances                 = 3000
rmin_redischeck_relay_cache_c_sa_email                      = "upscio-it-idc-9060-03d@appspot.gserviceaccount.com"
rmin_redischeck_relay_cache_c_timeout                       = 60
rmin_redischeck_relay_cache_c_vpc_connector                 = "projects/upscio-it-idc-9060-03d/locations/us-central1/connectors/rmin-dev-email-conn"
rmin_redischeck_locks_cache_e_avail_mem_mb                  = 256
rmin_redischeck_locks_cache_e_max_instances                 = 3000
rmin_redischeck_locks_cache_e_sa_email                      = "upscio-it-idc-9060-03d@appspot.gserviceaccount.com"
rmin_redischeck_locks_cache_e_timeout                       = 60
rmin_redischeck_locks_cache_e_vpc_connector                 = "projects/upscio-it-idc-9060-03d/locations/us-east4/connectors/rmin-dev-serverless-conn"
rmin_redischeck_mdnzip11s_cache_c_avail_mem_mb              = 256
rmin_redischeck_mdnzip11s_cache_c_max_instances             = 3000
rmin_redischeck_mdnzip11s_cache_c_sa_email                  = "upscio-it-idc-9060-03d@appspot.gserviceaccount.com"
rmin_redischeck_mdnzip11s_cache_c_timeout                   = 60
rmin_redischeck_mdnzip11s_cache_c_vpc_connector             = "projects/upscio-it-idc-9060-03d/locations/us-central1/connectors/rmin-dev-peripheral-conn"
rmin_redischeck_mdnzip11s_cache_e_avail_mem_mb              = 256
rmin_redischeck_mdnzip11s_cache_e_max_instances             = 3000
rmin_redischeck_mdnzip11s_cache_e_sa_email                  = "upscio-it-idc-9060-03d@appspot.gserviceaccount.com"
rmin_redischeck_mdnzip11s_cache_e_timeout                   = 60
rmin_redischeck_mdnzip11s_cache_e_vpc_connector             = "projects/upscio-it-idc-9060-03d/locations/us-east4/connectors/rmin-dev-serverless-conn"
rmin_redischeck_saturation_data_cache_e_avail_mem_mb        = 256
rmin_redischeck_saturation_data_cache_e_max_instances       = 3000
rmin_redischeck_saturation_data_cache_e_sa_email            = "upscio-it-idc-9060-03d@appspot.gserviceaccount.com"
rmin_redischeck_saturation_data_cache_e_timeout             = 60
rmin_redischeck_saturation_data_cache_e_vpc_connector       = "projects/upscio-it-idc-9060-03d/locations/us-east4/connectors/rmin-dev-serverless-conn"
rmin_redischeck_subscriber_2_e_avail_mem_mb                 = 256
rmin_redischeck_subscriber_2_e_max_instances                = 3000
rmin_redischeck_subscriber_2_e_sa_email                     = "upscio-it-idc-9060-03d@appspot.gserviceaccount.com"
rmin_redischeck_subscriber_2_e_timeout                      = 60
rmin_redischeck_subscriber_2_e_vpc_connector                = "projects/upscio-it-idc-9060-03d/locations/us-east4/connectors/rmin-dev-serverless-conn"
rmin_redischeck_subscriber_email_cache_c_avail_mem_mb       = 256
rmin_redischeck_subscriber_email_cache_c_max_instances      = 3000
rmin_redischeck_subscriber_email_cache_c_sa_email           = "upscio-it-idc-9060-03d@appspot.gserviceaccount.com"
rmin_redischeck_subscriber_email_cache_c_timeout            = 60
rmin_redischeck_subscriber_email_cache_c_vpc_connector      = "projects/upscio-it-idc-9060-03d/locations/us-central1/connectors/rmin-dev-dashboard-conn"
rmin_redischeck_fs_subscriber_cache_memory                  = 256
rmin_redischeck_fs_subscriber_email_cache_memory            = 256
subscriber_update_function_cpu                              = 1
subscriber_update_function_max_concurrency                  = 80
subscriber_update_function_max_instance                     = 100
subscriber_update_function_memory                           = "256M"
subscriber_update_function_min_instance                     = 0
subscriber_update_function_name                             = "rmin-cloud-subscriber-update-function-003d"
subscriber_update_function_service_account                  = "dev-subscriber-update@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
subscriber_update_function_timeout                          = 300
subscriber_update_function_zip_file_name                    = "templates/functions/rmin-cloud-subscriber-update-func-main.zip"
rmin_mics_extract_sa_email                                  = "dev-mics-subscriber-extract@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
rmin_mics_extract_avail_mem_mb                              = "300M"
rmin_mics_extract_max_instances                             = 10
rmin_mics_extract_timeout                                   = 540
rmin_mics_extract_cpu                                       = 1
rmin_mics_extract_max_concurrency                           = 80
rmin_mics_extract_max_retry                                 = 5
rmin_mics_extract_queue_id                                  = "dev-mics-subscriber-extract-queue"
rmin_mics_extract_location_id                               = "us-central1"
package_notification_trigger_function_cpu                   = 1
package_notification_trigger_function_max_concurrency       = 80
package_notification_trigger_function_max_instance          = 100
package_notification_trigger_function_memory                = "256M"
package_notification_trigger_function_min_instance          = 0
package_notification_trigger_function_name                  = "rmin-cloud-package-notification-trigger-003d"
package_notification_trigger_function_service_account       = "dev-pkg-notif-trigger@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
package_notification_trigger_function_timeout               = 300
package_notification_trigger_function_zip_file_name         = "templates/functions/rmin-cloud-package-notification-trigger-main.zip"
package_notification_trigger_mp_toggle                      = false
rmin_cloud_zip5_initiatives_sync_function_c_available_cpu   = 0.1666
rmin_cloud_zip5_initiatives_sync_function_c_max_concurrency = 1
rmin_cloud_zip5_initiatives_sync_function_c_max_instance    = 50
rmin_cloud_zip5_initiatives_sync_function_c_memory          = "256M"
rmin_cloud_zip5_initiatives_sync_function_c_min_instance    = 0
rmin_cloud_zip5_initiatives_sync_function_c_sa_email        = "dev-dnzip5-function@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
rmin_cloud_zip5_initiatives_sync_function_c_timeout         = 540
inbound_package_sync_trigger_function_cpu                   = 1
inbound_package_sync_trigger_function_max_concurrency       = 80
inbound_package_sync_trigger_function_max_instance          = 100
inbound_package_sync_trigger_function_memory                = "1Gi"
inbound_package_sync_trigger_function_min_instance          = 0
inbound_package_sync_trigger_function_name                  = "rmin-cloud-inbound-package-sync-trigger-003d"
inbound_package_sync_trigger_function_service_account       = "dev-pkg-notif-trigger@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
inbound_package_sync_trigger_function_timeout               = 300
inbound_package_sync_trigger_function_zip_file_name         = "templates/functions/rmin-cloud-inbound-package-sync-trigger-main.zip"
inbound_package_sync_trigger_function_partitions            = 2
process_failed_package_notif_function_c_available_cpu       = 0.1666
process_failed_package_notif_function_c_max_concurrency     = 1
process_failed_package_notif_function_c_max_instance        = 50
process_failed_package_notif_function_c_memory              = "256M"
process_failed_package_notif_function_c_min_instance        = 0
process_failed_package_notif_function_c_sa_email            = "dev-pkg-notif-processor@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
process_failed_package_notif_function_c_timeout             = 300
mdn_eng_feed_function_cpu                                   = 0.167
mdn_eng_feed_function_max_concurrency                       = 1
mdn_eng_feed_function_max_instance                          = 100
mdn_eng_feed_function_memory                                = "512M"
mdn_eng_feed_function_min_instance                          = 0
mdn_eng_feed_function_name                                  = "templates/functions/rmin-cloud-mdn-eng-feed.zip"
mdn_eng_feed_function_timeout                               = 300
mdn_eng_feed_function_service_account                       = "dev-mdn-eng-func@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
mdn_eng_feed_function_connector                             = "projects/upscio-it-idc-9060-03d/locations/us-central1/connectors/rmin-dev-peripheral-conn"
mdn_eng_feed_function_eng_toggle                            = "false"
mdn_eng_feed_function_azure_acct                            = "ldeingestukgyquef5fxhu"
mdn_eng_feed_function_azure_cntr                            = "mdnsubscriberstest"
mdn_eng_feed_function_azure_file                            = "list.csv"
mdn_eng_feed_function_mount_path                            = "/eng/azure/key"
mdn_eng_feed_function_secret                                = "Eng-azure-sas-token"

# [END cloud_function Variables]

# [START memstore Variables]
#------PLEASE READ BELOW-------#
#If replica_enabled=true then cache_memory_size_gb must be >=5 and replica_count must be >1
#If replica_enabled=false then replica_count must be 1
#Read Replicas cannot be disabled once it's been created in the environment

rmin_flats_lock_cache_e_memory_size_gb         = 1
rmin_flats_lock_cache_e_replica_count          = 1
rmin_flats_lock_cache_e_replica_enabled        = "false"
rmin_flats_lock_cache_c_memory_size_gb         = 1
rmin_flats_lock_cache_c_replica_count          = 1
rmin_flats_lock_cache_c_replica_enabled        = "false"
rmin_locks_cache_e_memory_size_gb              = 1
rmin_locks_cache_e_replica_count               = 1
rmin_locks_cache_e_replica_enabled             = "false"
rmin_mdn_zip11s_cache_e_memory_size_gb         = 1
rmin_mdn_zip11s_cache_e_replica_count          = 1
rmin_mdn_zip11s_cache_e_replica_enabled        = "false"
rmin_relay_locks_cache_c_memory_size_gb        = 1
rmin_relay_locks_cache_c_replica_count         = 0
rmin_relay_locks_cache_c_replica_enabled       = "false"
rmin_saturation_data_cache_e_memory_size_gb    = 1
rmin_saturation_data_cache_e_replica_count     = 1
rmin_saturation_data_cache_e_replica_enabled   = "false"
rmin_mail_campaign_cache_c_memory_size_gb      = 1
rmin_mail_campaign_cache_c_replica_count       = 1
rmin_mail_campaign_cache_c_replica_enabled     = "false"
rmin_mail_campaign_cache_ext_c_memory_size_gb  = 1
rmin_mail_campaign_cache_ext_c_replica_count   = 1
rmin_mail_campaign_cache_ext_c_replica_enabled = "false"
rmin_mdn_zip11s_cache_c_memory_size_gb         = 1
rmin_mdn_zip11s_cache_c_replica_count          = 1
rmin_mdn_zip11s_cache_c_replica_enabled        = "false"
rmin_mics_locks_cache_c_memory_size_gb         = 1
rmin_mics_locks_cache_c_replica_count          = 1
rmin_mics_locks_cache_c_replica_enabled        = "false"
rmin_package_campaign_cache_c_memory_size_gb   = 1
rmin_package_campaign_cache_c_replica_count    = 1
rmin_package_campaign_cache_c_replica_enabled  = "false"
rmin_package_campaign_cache_ext_c_memory_size_gb   = 1
rmin_package_campaign_cache_ext_c_replica_count    = 1
rmin_package_campaign_cache_ext_c_replica_enabled  = "false"
rmin_subscriber_cache_c_memory_size_gb         = 1
rmin_subscriber_cache_c_replica_count          = 1
rmin_subscriber_cache_c_replica_enabled        = "false"
rmin_subscriber_email_cache_c_memory_size_gb   = 1
rmin_subscriber_email_cache_c_replica_count    = 1
rmin_subscriber_email_cache_c_replica_enabled  = "false"
rmin_fs_subscriber_cache_memory_size_gb        = 1
rmin_fs_subscriber_cache_replica_count         = 1
rmin_fs_subscriber_cache_replica_enabled       = "false"
rmin_fs_subscriber_email_cache_memory_size_gb  = 1
rmin_fs_subscriber_email_cache_replica_count   = 1
rmin_fs_subscriber_email_cache_replica_enabled = "false"
rmin_zip5_initiatives_cache_c_memory_size_gb   = 1
rmin_zip5_initiatives_cache_c_replica_count    = 1
rmin_zip5_initiatives_cache_c_replica_enabled  = "false"

# [END memstore Variables]

# [START subnetwork Variables]
rmin_api_serverless_name                    = "rmin-dev-api-serverless"
rmin_dashboard_serverless_vpc_name          = "rmin-dev-dashboard-serverless"
rmin_peripheral_vpc_name                    = "rmin-dev-peripheral"
rmin_email_serverless_vpc_name              = "rmin-dev-email-serverless"
rmin_peripheral_serverless_vpc_name         = "rmin-dev-peripheral-serverless"
rmin_dashboard_serverless_ip_cidr_range     = "10.2.0.0/28"
rmin_peripheral_ip_cidr_range               = "10.3.0.0/20"
rmin_email_serverless_ip_cidr_range         = "10.150.7.0/28"
rmin_peripheral_serverless_ip_cidr_range    = "10.150.20.0/28"
idc_cloudrun_email_serverless_ip_cidr_range = "10.150.4.0/28"
idc_cloudrun_email_serverless_name          = "idc-dev-cloudrun-email-serverless"
idc_cloudrun_email_serverless_network       = "projects/upscio-it-idc-9060-03d/global/networks/rmin-dev-3-e-vpc"
rmin_e_dataflow_email_ip_cidr_range         = "10.1.0.0/26"
rmin_e_dataflow_email_name                  = "rmin-dev-e-dataflow-email"
rmin_e_dataflow_email_network               = "projects/upscio-it-idc-9060-03d/global/networks/rmin-dev-3-e-vpc"
rmin_e_dataflow_peripheral_ip_cidr_range    = "10.0.0.0/24"
rmin_e_dataflow_peripheral_name             = "rmin-dev-e-dataflow-peripheral"
rmin_e_dataflow_peripheral_network          = "projects/upscio-it-idc-9060-03d/global/networks/rmin-dev-3-e-vpc"
rmin_e_serverless_connector_ip_cidr_range   = "10.100.0.0/28"
rmin_e_serverless_connector_name            = "rmin-dev-e-serverless-connector"
rmin_e_serverless_connector_network         = "projects/upscio-it-idc-9060-03d/global/networks/rmin-dev-3-e-vpc"
rmin_e_serverless_email_ip_cidr_range       = "10.200.0.0/28"
rmin_e_serverless_email_name                = "rmin-dev-e-serverless-email"
rmin_e_serverless_email_network             = "projects/upscio-it-idc-9060-03d/global/networks/rmin-dev-3-e-vpc"
rmin_subscriber_serverless_vpc_name         = "rmin-dev-subscriber-serverless"
rmin_subscriber_serverless_ip_cidr_range    = "10.4.0.0/28"
rmin_subscriber_peripheral_name             = "rmin-dev-subscriber-peripheral"
rmin_subscriber_peripheral_ip_cidr_range    = "10.5.0.0/20"

# [END subnetwork Variables]

# [START connectors Variables]
### dashboard_serverless ###
dashboard_serverless_connector_machine_type  = "e2-standard-4"
dashboard_serverless_connector_min_instances = 2
dashboard_serverless_connector_max_instances = 10
dashboard_serverless_conn_name               = "rmin-dev-dashboard-conn"
### peripheral_serverless ###
peripheral_serverless_connector_machine_type  = "e2-standard-4"
peripheral_serverless_connector_min_instances = 2
peripheral_serverless_connector_max_instances = 10
peripheral_serverless_conn_name               = "rmin-dev-peripheral-conn"
### email_serverless ###
email_serverless_connector_machine_type  = "e2-standard-4"
email_serverless_connector_min_instances = 2
email_serverless_connector_max_instances = 10
email_serverless_conn_name               = "rmin-dev-email-conn"
### subscriber_serverless ###
subscriber_serverless_connector_machine_type  = "e2-micro"
subscriber_serverless_connector_min_instances = 2
subscriber_serverless_connector_max_instances = 10
subscriber_serverless_conn_name               = "rmin-dev-subscriber-conn"
### package_serverless ###
package_serverless_connector_machine_type  = "e2-micro"
package_serverless_connector_min_instances = 2
package_serverless_connector_max_instances = 10
package_serverless_conn_name               = "rmin-dev-package-conn"

rmin_serverless_conn_name  = "rmin-dev-serverless-conn"
idc_email_serverless_name  = "idc-dev-email-serverless"
rmin_e_servless_email_name = "rmin-dev-e-servless-email"
rmin_api_conn_name         = "rmin-dev-api-conn"

# [END connectors Variables]

# [START cloud_scheduler Variables]
mdn_eng_feed_version                                  = "1.0.9"
mdn_eng_feed_sa_email                                 = "idc-dataflow@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
mdn_eng_feed_schedule                                 = "0 23 * * *"
mdn_eng_feed_workers                                  = 4
mdn_eng_feed_subnetwork                               = "regions/us-central1/subnetworks/rmin-dev-peripheral"
mdn_eng_feed_num_shard                                = 1
rmin_gcr_pruner_attempt_deadline                      = "180s"
rmin_gcr_pruner_cloud_run_url                         = "https://gcr-pruner-ujzb7klvvq-uk.a.run.app/"
rmin_gcr_pruner_paused                                = "true"
rmin_gcr_pruner_sa_email                              = "upscio-it-idc-9060-03d@appspot.gserviceaccount.com"
rmin_gcr_pruner_schedule                              = "0 3 * * 1"
rmin_report_email_completion_tz_cloud_run_url         = "https://rmin-report-email-completion-tz-ujzb7klvvq-uk.a.run.app"
rmin_report_email_completion_tz_sa_email              = "dev-bq-email@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
rmin_report_email_completion_tz_schedule              = "0 7-17 * * *"
rmin_report_email_sla_timezone_sunday_cloud_run_url   = "https://rmin-report-email-sla-timezone-sunday-ujzb7klvvq-uk.a.run.app"
rmin_report_email_sla_timezone_sunday_sa_email        = "dev-bq-email@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
rmin_report_email_sla_timezone_sunday_schedule        = "0 7-17 * * 0"
rmin_report_file_and_email_sla_timezone_cloud_run_url = "https://rmin-report-file-and-email-sla-timezone-ujzb7klvvq-uk.a.run.app"
rmin_report_file_and_email_sla_timezone_sa_email      = "dev-bq-email@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
rmin_report_file_and_email_sla_timezone_schedule      = "0 7-17 * * 1-6"
rmin_report_missing_emails_cloud_run_url              = "https://rmin-report-missing-emails-ujzb7klvvq-uk.a.run.app"
rmin_report_missing_emails_sa_email                   = "dev-bq-email@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
rmin_report_missing_emails_schedule                   = "0 7-17 * * *"
rmin_report_processing_volumes_cloud_run_url          = "https://rmin-report-processing-volumes-ujzb7klvvq-uk.a.run.app"
rmin_report_processing_volumes_sa_email               = "dev-bq-email@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
rmin_report_processing_volumes_schedule               = "0 7-17 * * *"
rmin_report_zip5_email_processing_time_cloud_run_url  = "https://rmin-report-zip5-email-processing-time-ujzb7klvvq-uk.a.run.app"
rmin_report_zip5_email_processing_time_sa_email       = "dev-bq-email@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
rmin_report_zip5_email_processing_time_schedule       = "0 7-17 * * *"
run_partman_c_attempt_deadline                        = "180s"
run_partman_c_func_url                                = "https://us-central1-upscio-it-idc-9060-03d.cloudfunctions.net/rmin-cloudsql-runpartman-c"
run_partman_c_sa_email                                = "dev-cloud-sql-partman@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
run_partman_c_schedule                                = "0 3 * * 1-5"
run_partman_digest_attempt_deadline                   = "180s"
run_partman_digest_func_url                           = "https://us-central1-upscio-it-idc-9060-03d.cloudfunctions.net/rmin-cloudsql-runpartman-digest"
run_partman_digest_sa_email                           = "dev-zip5-tz-func@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
run_partman_digest_schedule                           = "0 3 * * 1-5"
run_zip5_timezone_c_attempt_deadline                  = "180s"
run_zip5_timezone_c_func_url                          = "https://us-central1-upscio-it-idc-9060-03d.cloudfunctions.net/rmin-cloud-zip5-timezone-func-c"
run_zip5_timezone_c_sa_email                          = "dev-zip5-tz-func@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
run_zip5_timezone_c_schedule                          = "0 23 * * *"
sunday_digest_cloud_run_version_central               = "1.0.17"
sunday_digest_error_topic                             = "rmin-errors-e-003d"
sunday_digest_max_workers                             = 4
sunday_digest_redis_max_conn                          = "150"
sunday_digest_redis_max_idle                          = "10"
sunday_digest_redis_min_idle                          = "5"
sunday_digest_database                                = "rmin_operationaldata_bigquery_e_003d"
sunday_digest_sa_email                                = "idc-dataflow@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
sunday_digest_logging_table                           = "rmin_operationaldata_bigquery_e_003d.Sunday_Digest_Logs"
sunday_digest_schedule                                = "0 7 * * 0"
sunday_digest_sdk_log_level                           = "WARN"
sunday_digest_sub_drop_bucket                         = "rmin-subscriberdropbox-bucket-e-003d"
sunday_digest_subnetwork                              = "regions/us-east4/subnetworks/rmin-dev-e-dataflow-email"
sunday_digest_toggle_dedupe_sunday_email              = "true"
sunday_digest_toggle_email_cache_lookup               = "true"
sunday_digest_topic_name                              = "rmin-zip5subscribers-topic-e-003d"
rmin_mics_extract_trigger_schedule                    = "0 14 * * *"
cache_refresh_redis_max_conn                          = 150
cache_refresh_redis_max_idle                          = 10
cache_refresh_redis_min_idle                          = 5
cache_refresh_redis_max_wait_millis                   = 60000
cache_refresh_redis_timeout_millis                    = 45000
cache_refresh_max_workers                             = 4
cache_refresh_sa_email                                = "idc-dataflow@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
cache_refresh_schedule                                = "0 0 29 2 1"
cache_refresh_version                                 = "1.0.6"
cache_refresh_subnetwork                              = "regions/us-central1/subnetworks/rmin-dev-subscriber-peripheral"
cache_refresh_partition_count                         = "10"
dashboard_api_internal_pre_warm_schedule              = "0 7 * * 1-6"
dashboard_api_internal_pre_warm_min_instances         = 4
dashboard_api_internal_post_warm_schedule             = "45 8 * * 1-6"
cloud_run_warming_sa                                  = "dev-cloud-run-api-admin@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
rmin_zip5_initiatives_sync_sa_email                   = "dev-dnzip5-function@upscio-it-idc-9060-03d.iam.gserviceaccount.com"
frontend_apis_pre_warm_schedule                       = "30 6 * * *"
frontend_apis_post_warm_schedule                      = "0 11 * * *"
dashboard_api_pre_warm_min_instances                  = 4
image_api_pre_warm_min_instances                      = 4
login_api_pre_warm_min_instances                      = 4
subscriber_api_pre_warm_min_instances                 = 4
package_api_pre_warm_min_instances                    = 4
eagan_proxy_pre_warm_min_instances                    = 4
consumer_portal_pre_warm_min_instances                = 4

rmin_redis_export_backup_scheduler_region             = "us-east1"
rmin_redis_export_backup_scheduler_schedule           = "0 3 * * *"
rmin_redis_export_backup_scheduler_timezone           = "America/New_York"
rmin_redis_export_backup_service_account              = "dev-redis-cache-bk-export"

rmin_bigquery_export_backup_scheduler_region          = "us-east1"
rmin_bigquery_export_backup_scheduler_schedule        = "0 3 * * *"
rmin_bigquery_export_backup_scheduler_timezone        = "America/New_York"
rmin_bigquery_export_backup_service_account           = "dev-bigquery-bk-export"

# [END cloud_scheduler Variables]

# [START vpc Variables]
rmin_e_pvt_svc_connection_name = "rmin-dev-3-e-pvt-svc-connection"
rmin_e_vpc_name                = "rmin-dev-3-e-vpc"

# [END vpc Variables]

# [START cloud_nat Variables]
cloud_nat_name       = "idc-dev-3-nat"
external_nat_ip_name = "idc-dev-3-external-nat"
router_name          = "idc-dev-3-router"

# [END cloud_nat Variables]

# [START cloudsql_digest Variables]
digest_db_instance_maint_update_track      = "canary"
digest_db_instance_allocated_ip_range      = "rmin-psc-ip-cloud-sql-central"
digest_db_instance_availability_type       = "REGIONAL"
digest_db_instance_disk_autoresize         = "false"
digest_db_instance_disk_autoresize_limit   = 0
digest_db_instance_disk_size_gb            = 10
digest_db_instance_query_insights_enabled  = "false"
digest_db_instance_query_string_length     = "1024"
digest_db_instance_record_application_tags = "false"
digest_db_instance_record_client_address   = "false"
digest_db_instance_retained_backups_count  = 3
digest_db_instance_log_rentention_days     = 3
rmin_digest_db_user_name                   = "drmin"

digest_db_instance_tier = "db-g1-small"

# [END cloudsql_digest Variables]

# [START cloudsql_mdn Variables]
mdn_db_instance_maint_update_track      = "canary"
mdn_db_instance_allocated_ip_range      = "rmin-psc-ip-cloud-sql-central"
mdn_db_instance_availability_type       = "REGIONAL"
mdn_db_instance_disk_autoresize         = "false"
mdn_db_instance_disk_autoresize_limit   = 0
mdn_db_instance_disk_size_gb            = 10
mdn_db_instance_query_insights_enabled  = "false"
mdn_db_instance_query_string_length     = "1024"
mdn_db_instance_record_application_tags = "false"
mdn_db_instance_record_client_address   = "false"
mdn_db_instance_retained_backups_count  = 3
mdn_db_instance_log_rentention_days     = 3
rmin_mdn_db_user_name                   = "drmin"

mdn_db_instance_tier = "db-g1-small"

# [END cloudsql_mdn Variables]

# [START cloudsql_mc Variables]
mc_db_instance_maint_update_track      = "canary"
mc_db_instance_allocated_ip_range      = "rmin-psc-ip-cloud-sql"
mc_db_instance_availability_type       = "REGIONAL"
mc_db_instance_disk_autoresize         = "false"
mc_db_instance_disk_autoresize_limit   = 0
mc_db_instance_disk_size_gb            = 10
mc_db_instance_query_insights_enabled  = "false"
mc_db_instance_query_string_length     = "1024"
mc_db_instance_record_application_tags = "false"
mc_db_instance_record_client_address   = "false"
mc_db_instance_retained_backups_count  = 3
mc_db_instance_log_rentention_days     = 3
rmin_mc_db_user_name                   = "drmin"

mc_db_instance_tier = "db-g1-small"

# [END cloudsql_mc Variables]

# [START dashboard_firestore Variables]

dashboard_firestore_backup_retention = "259200s"

# [END dashboard_firestore Variables]

# [START mail_campaign_firestore Variables]

mail_campaign_firestore_backup_retention = "259200s"

# [END mail_campaign_firestore Variables]

# [START subscriber_firestore Variables]

subscribers_firestore_backup_retention = "259200s"

# [END subscriber_firestore Variables]

# [START internal_lb Variables]

int_lb_subnetwork        = "id-internal-lb-central1-03d"
rmin_lb_ip_int_c_address = "172.28.56.2"

# [END internal_lb Variables]

# [START external_lb Variables]

rmin_lb_ip_ext_c_address = "34.133.146.153"

# [END external_lb Variables]

# [ START cloud_storage variables ]

rmin_redis_export_backup_bucket_e_location = "us-east1"
rmin_redis_export_backup_bucket_e_storage_class = "STANDARD"
rmin_redis_export_backup_bucket_e_lifecycle_rule_condition_age = 3

rmin_bigquery_export_backup_bucket_e_location = "us-east1"
rmin_bigquery_export_backup_bucket_e_storage_class = "STANDARD"
rmin_bigquery_export_backup_bucket_e_lifecycle_rule_condition_age = 3

# [ END cloud_storage variables ]
