resource "google_cloud_tasks_queue" "mics_subscriber_extract_queue" {
  name     = var.rmin_mics_extract_queue_id
  location = var.rmin_mics_extract_location_id
  count    = var.toggle_4583_1111_subscriber_services ? 1 : 0
}
