# [START google_project_service] 

resource "google_project_service" "project" {
  project = var.project_id
  service = "eventarc.googleapis.com"

  timeouts {
    create = "30m"
    update = "40m"
  }

}

resource "google_project_service" "cloud_tasks_api" {
  project = var.project_id
  service = "cloudtasks.googleapis.com"

  timeouts {
    create = "30m"
    update = "40m"
  }

}

# [END google_project_service] 