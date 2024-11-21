output "mdn_db_instance_connection_name" {
  value       = google_sql_database_instance.mdn_db_instance.connection_name
  description = "The connection name of the instance to be used in connection strings."
}


output "rmin_mdn_db_user_secret_id" {
  value       = google_secret_manager_secret.rmin_mdn_db_user_secret.secret_id
  description = "ID for the resource with format projects/{{project}}/secrets/{{secret_id}}"
}

output "rmin_mdn_db_user_secret_latest_name" {
  value       = google_secret_manager_secret_version.rmin_mdn_db_user_secret_latest.name
  description = "The resource name of the SecretVersion. Format: projects/{{project}}/secrets/{{secret_id}}/versions/{{version}}"
}
