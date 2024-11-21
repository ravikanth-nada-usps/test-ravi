# [END google_compute_region_ssl_certificate] 

resource "google_compute_region_ssl_certificate" "rmin_id_cert_c" {
  project     = var.project_id
  region      = "us-central1"
  name        = "rmin-id-${var.environment}-cert-c"
  private_key = data.google_storage_bucket_object_content.private_key.content
  certificate = data.google_storage_bucket_object_content.certificate.content

  lifecycle {
    create_before_destroy = false
  }
}

data "google_storage_bucket_object_content" "private_key" {
  name   = "certificates/${var.private_key_filename}"
  bucket = "rmin-template-bucket-e-000r"
}

data "google_storage_bucket_object_content" "certificate" {
  name   = "certificates/${var.certificate_filename}"
  bucket = "rmin-template-bucket-e-000r"
}

# [END google_compute_region_ssl_certificate] 
