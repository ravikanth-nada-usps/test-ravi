output "rmin_id_cert_c_id" {
  value       = google_compute_region_ssl_certificate.rmin_id_cert_c.id
  description = "an identifier for the resource with format projects/{{project}}/regions/{{region}}/sslCertificates/{{name}}"
}