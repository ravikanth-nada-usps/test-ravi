output "mics_subscriber_extract_queue_id" {
  value       = google_cloud_tasks_queue.mics_subscriber_extract_queue[0].id
  description = "The ID for the Cloud Tasks Queue in the format projects/{{project}}/locations/{{location}}/queues/{{name}}"
}