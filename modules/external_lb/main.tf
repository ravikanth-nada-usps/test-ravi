# [START google_compute_region_network_endpoint_group] 

resource "google_compute_region_network_endpoint_group" "rmin_ext_lb_cp_neg_c" {
  project               = var.project_id
  name                  = "rmin-ext-lb-cp-neg-c"
  network_endpoint_type = "SERVERLESS"
  region                = "us-central1"
  cloud_run {
    service = "rmin-cloud-consumer-portal-frontend"
  }
  lifecycle {
    create_before_destroy = false
  }
}

resource "google_compute_region_network_endpoint_group" "rmin_ext_lb_mdn_track_neg_c" {
  project               = var.project_id
  name                  = "rmin-ext-lb-mdn-track-neg-c"
  network_endpoint_type = "SERVERLESS"
  region                = "us-central1"
  cloud_run {
    service = "rmin-cloud-mdn-click-track"
  }
  lifecycle {
    create_before_destroy = false
  }
}

resource "google_compute_region_network_endpoint_group" "rmin_ext_lb_digest_track_neg_c" {
  project               = var.project_id
  name                  = "rmin-ext-lb-digest-track-neg-c"
  network_endpoint_type = "SERVERLESS"
  region                = "us-central1"
  cloud_run {
    service = "rmin-cloud-digest-tracking"
  }
  lifecycle {
    create_before_destroy = false
  }
}

# [END google_compute_region_network_endpoint_group] 

# [START google_compute_region_backend_service] 

resource "google_compute_region_backend_service" "rmin_ext_lb_mdn_track_be_c" {
  provider                        = google-beta
  name                            = "rmin-ext-lb-mdn-track-be-c"
  project                         = var.project_id
  protocol                        = "HTTPS"
  load_balancing_scheme           = "EXTERNAL_MANAGED"
  region                          = "us-central1"
  security_policy                 = google_compute_region_security_policy.rmin_ext_lb_mdn_track_sec_pol_c.self_link
  connection_draining_timeout_sec = 0

  log_config {
    enable      = "true"
    sample_rate = "1.0"
  }

  backend {
    group           = google_compute_region_network_endpoint_group.rmin_ext_lb_mdn_track_neg_c.self_link
    balancing_mode  = "UTILIZATION"
    capacity_scaler = "1.0"
  }
  lifecycle {
    replace_triggered_by = [
      google_compute_region_network_endpoint_group.rmin_ext_lb_mdn_track_neg_c
    ]
  }
}

resource "google_compute_region_backend_service" "rmin_ext_lb_digest_track_be_c" {
  provider                        = google-beta
  name                            = "rmin-ext-lb-digest-track-be-c"
  project                         = var.project_id
  protocol                        = "HTTPS"
  load_balancing_scheme           = "EXTERNAL_MANAGED"
  region                          = "us-central1"
  security_policy                 = google_compute_region_security_policy.rmin_ext_lb_digest_track_sec_pol_c.self_link
  connection_draining_timeout_sec = 0

  log_config {
    enable      = "true"
    sample_rate = "1.0"
  }

  backend {
    group           = google_compute_region_network_endpoint_group.rmin_ext_lb_digest_track_neg_c.self_link
    balancing_mode  = "UTILIZATION"
    capacity_scaler = "1.0"
  }
  lifecycle {
    replace_triggered_by = [
      google_compute_region_network_endpoint_group.rmin_ext_lb_digest_track_neg_c
    ]
  }
}

resource "google_compute_region_backend_service" "rmin_ext_lb_cp_be_c" {
  provider                        = google-beta
  name                            = "rmin-ext-lb-cp-be-c"
  project                         = var.project_id
  protocol                        = "HTTPS"
  load_balancing_scheme           = "EXTERNAL_MANAGED"
  region                          = "us-central1"
  connection_draining_timeout_sec = 0

  log_config {
    enable      = "true"
    sample_rate = "1.0"
  }

  backend {
    group           = google_compute_region_network_endpoint_group.rmin_ext_lb_cp_neg_c.self_link
    balancing_mode  = "UTILIZATION"
    capacity_scaler = "1.0"
  }
  lifecycle {
    replace_triggered_by = [
      google_compute_region_network_endpoint_group.rmin_ext_lb_cp_neg_c
    ]
  }
}

# [END google_compute_region_backend_service] 

# [START google_compute_region_url_map] 


resource "google_compute_region_url_map" "rmin_external_lb_http_c" {
  region      = "us-central1"
  project     = var.project_id
  name        = "rmin-external-lb-http-c"
  description = "Regional External Application Load Balancer"

  default_url_redirect {
    https_redirect         = true
    redirect_response_code = "MOVED_PERMANENTLY_DEFAULT"
    strip_query            = false
  }

}

resource "google_compute_region_url_map" "rmin_external_lb_c" {
  region      = "us-central1"
  project     = var.project_id
  name        = "rmin-external-lb-c"
  description = "Regional External Application Load Balancer"

  default_service = google_compute_region_backend_service.rmin_ext_lb_cp_be_c.id

  host_rule {
    hosts        = ["${var.id_env_url}"]
    path_matcher = "rmin-id-path-c"
  }

  host_rule {
    hosts        = ["${var.informeddelivery_env_url}"]
    path_matcher = "rmin-inform-deliv-path-c"
  }

  path_matcher {
    name            = "rmin-inform-deliv-path-c"
    default_service = google_compute_region_backend_service.rmin_ext_lb_cp_be_c.id

    path_rule {
      paths   = ["/portal/*"]
      service = google_compute_region_backend_service.rmin_ext_lb_cp_be_c.id
    }

    path_rule {
      paths   = ["/trackingV2/digest/*"]
      service = google_compute_region_backend_service.rmin_ext_lb_digest_track_be_c.id
    }

    path_rule {
      paths   = ["/trackingV2/mdn/*"]
      service = google_compute_region_backend_service.rmin_ext_lb_mdn_track_be_c.id
    }
  }

  path_matcher {
    name            = "rmin-id-path-c"
    default_service = google_compute_region_backend_service.rmin_ext_lb_cp_be_c.id

    path_rule {
      paths   = ["/portal/*"]
      service = google_compute_region_backend_service.rmin_ext_lb_cp_be_c.id
    }

    path_rule {
      paths   = ["/trackingV2/digest/*"]
      service = google_compute_region_backend_service.rmin_ext_lb_digest_track_be_c.id
    }

    path_rule {
      paths   = ["/trackingV2/mdn/*"]
      service = google_compute_region_backend_service.rmin_ext_lb_mdn_track_be_c.id
    }
  }
  lifecycle {
    replace_triggered_by = [
      google_compute_region_backend_service.rmin_ext_lb_mdn_track_be_c.id,
      google_compute_region_backend_service.rmin_ext_lb_digest_track_be_c.id,
      google_compute_region_backend_service.rmin_ext_lb_cp_be_c.id
    ]
  }
}

# [END google_compute_region_url_map] 


# [START google_compute_region_security_policy] 

resource "google_compute_region_security_policy" "rmin_ext_lb_digest_track_sec_pol_c" {
  provider    = google-beta
  name        = "rmin-ext-lb-digest-track-sec-pol-c"
  description = "Regional Security Policy for Digest Clicks"
  type        = "CLOUD_ARMOR"
  region      = "us-central1"
  project     = var.project_id
}


resource "google_compute_region_security_policy" "rmin_ext_lb_mdn_track_sec_pol_c" {
  provider    = google-beta
  name        = "rmin-ext-lb-mdn-track-sec-pol-c"
  description = "Regional Security Policy for MDN Clicks"
  type        = "CLOUD_ARMOR"
  region      = "us-central1"
  project     = var.project_id
}

# [END google_compute_region_security_policy] 

# [START google_compute_region_security_policy_rule] 

resource "google_compute_region_security_policy_rule" "rmin_ext_lb_digest_track_sec_pol_rule_c" {
  provider        = google-beta
  project         = var.project_id
  region          = "us-central1"
  security_policy = google_compute_region_security_policy.rmin_ext_lb_digest_track_sec_pol_c.name
  priority        = 2147483646
  action          = "throttle"
  preview         = false
  match {
    versioned_expr = "SRC_IPS_V1"
    config {
      src_ip_ranges = ["*"]
    }
  }

  rate_limit_options {
    conform_action = "allow"
    exceed_action  = "deny(403)"
    enforce_on_key = "IP"
    rate_limit_threshold {
      count        = 500
      interval_sec = 60
    }
  }
}

resource "google_compute_region_security_policy_rule" "rmin_ext_lb_mdn_track_sec_pol_rule_c" {
  provider        = google-beta
  project         = var.project_id
  region          = "us-central1"
  security_policy = google_compute_region_security_policy.rmin_ext_lb_mdn_track_sec_pol_c.name
  priority        = 2147483646
  action          = "throttle"
  preview         = false
  match {
    versioned_expr = "SRC_IPS_V1"
    config {
      src_ip_ranges = ["*"]
    }
  }

  rate_limit_options {
    conform_action = "allow"
    exceed_action  = "deny(403)"
    enforce_on_key = "IP"
    rate_limit_threshold {
      count        = 500
      interval_sec = 60
    }
  }
}

# [END google_compute_region_security_policy_rule] 


# [START google_compute_region_target_https_proxy] 

resource "google_compute_region_target_https_proxy" "rmin_ext_lb_https_proxy_c" {
  project          = var.project_id
  region           = "us-central1"
  name             = "rmin-ext-lb-https-proxy-c"
  url_map          = google_compute_region_url_map.rmin_external_lb_c.id
  ssl_certificates = [var.rmin_id_cert_c_id]
  # ssl_certificates = ["projects/${var.project_id}/regions/us-central1/sslCertificates/rmin-id-${var.environment}-cert-c"]
  lifecycle {
    replace_triggered_by = [
      google_compute_region_url_map.rmin_external_lb_c
    ]
  }
}

# [END google_compute_region_target_https_proxy] 

# [START google_compute_region_target_http_proxy] 

resource "google_compute_region_target_http_proxy" "rmin_ext_lb_http_proxy_c" {
  project = var.project_id
  region  = "us-central1"
  name    = "rmin-ext-lb-http-proxy-c"
  url_map = google_compute_region_url_map.rmin_external_lb_http_c.id
  lifecycle {
    replace_triggered_by = [
      google_compute_region_url_map.rmin_external_lb_http_c
    ]
  }
}

# [END google_compute_region_target_http_proxy] 

# [START google_compute_forwarding_rule] 

resource "google_compute_forwarding_rule" "rmin_ext_lb_https_fe_c" {
  project               = var.project_id
  name                  = "rmin-ext-lb-https-fe-c"
  region                = "us-central1"
  ip_protocol           = "TCP"
  ip_address            = "projects/${var.project_id}/regions/us-central1/addresses/rmin-lb-ip-ext-c"
  load_balancing_scheme = "EXTERNAL_MANAGED"
  port_range            = "443"
  target                = google_compute_region_target_https_proxy.rmin_ext_lb_https_proxy_c.id
  network               = var.rmin_ext_lb_fe_c_network
  network_tier          = "PREMIUM"

  depends_on = [google_compute_address.rmin_lb_ip_ext_c]
  lifecycle {
    replace_triggered_by = [
      google_compute_region_target_https_proxy.rmin_ext_lb_https_proxy_c,
      google_compute_address.rmin_lb_ip_ext_c
    ]
  }
}

resource "google_compute_forwarding_rule" "rmin_ext_lb_http_fe_c" {
  project               = var.project_id
  name                  = "rmin-ext-lb-http-fe-c"
  region                = "us-central1"
  ip_protocol           = "TCP"
  ip_address            = "projects/${var.project_id}/regions/us-central1/addresses/rmin-lb-ip-ext-c"
  load_balancing_scheme = "EXTERNAL_MANAGED"
  port_range            = "8080"
  target                = google_compute_region_target_http_proxy.rmin_ext_lb_http_proxy_c.id
  network               = var.rmin_ext_lb_fe_c_network
  network_tier          = "PREMIUM"

  depends_on = [google_compute_address.rmin_lb_ip_ext_c]
  lifecycle {
    replace_triggered_by = [
      google_compute_address.rmin_lb_ip_ext_c,
      google_compute_region_target_http_proxy.rmin_ext_lb_http_proxy_c
    ]
  }
}

# [END google_compute_forwarding_rule] 

# [START google_compute_address] 

resource "google_compute_address" "rmin_lb_ip_ext_c" {
  name         = "rmin-lb-ip-ext-c"
  address_type = "EXTERNAL"
  address      = var.rmin_lb_ip_ext_c_address
  region       = "us-central1"
  ip_version   = "IPV4"
  project      = var.project_id
}

# [END google_compute_address] 
