# [START google_bigquery_dataset]
resource "google_bigquery_dataset" "rmin_operationaldata_bigquery_e" {

  dataset_id                      = "rmin_operationaldata_bigquery_e_${var.name_suffix}"
  default_partition_expiration_ms = "0"
  delete_contents_on_destroy      = "false"

  location = "US"
  project  = var.project_id

}

# [END google_bigquery_dataset]

# [START google_bigquery_table]

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_99M_Barcode_Submission_Processor_Logs" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/99M_Barcode_Submission_Processor_Logs.json")
  table_id            = "99M_Barcode_Submission_Processor_Logs"
}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_Account_Revision" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/Account_Revision.json")
  table_id            = "Account_Revision"

  time_partitioning {
    type          = "DAY"
    field         = "TIME_STAMP"
    expiration_ms = var.partition_expiration_ms
  }

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0

}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_Campaign_Cache_Sync_Logs" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/Campaign_Cache_Sync_Logs.json")
  table_id            = "Campaign_Cache_Sync_Logs"
}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_Campaign_Cache_Sync_Ext_Logs" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/Campaign_Cache_Sync_Ext_Logs.json")
  table_id            = "Campaign_Cache_Sync_Ext_Logs"

  count = var.toggle_4583_xxxx_ext_caches ? 1 : 0
}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_Campaign_Processing_Logs" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/Campaign_Processing_Logs.json")
  table_id            = "Campaign_Processing_Logs"
}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_Cloud_Mail_Campaign_Reporting_Job_Logs" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/Cloud_Mail_Campaign_Reporting_Job_Logs.json")
  table_id            = "Cloud_Mail_Campaign_Reporting_Job_Logs"

}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_Cloud_Mail_Click_Track_Logs" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/Cloud_Mail_Click_Track_Logs.json")
  table_id            = "Cloud_Mail_Click_Track_Logs"

}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_Cloud_Piece_Reporting_Job_Logs" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/Cloud_Piece_Reporting_Job_Logs.json")
  table_id            = "Cloud_Piece_Reporting_Job_Logs"

}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_Container_Scan_Processor_Logs" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/Container_Scan_Processor_Logs.json")
  table_id            = "Container_Scan_Processor_Logs"

}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_Dashboard_API_Logs" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/Dashboard_API_Logs.json")
  table_id            = "Dashboard_API_Logs"

}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_Dashboard_Errors" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/Dashboard_Errors.json")
  table_id            = "Dashboard_Errors"


  time_partitioning {
    expiration_ms = "0"
    field         = "TIME_STAMP"
    type          = "DAY"
  }
}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_Dashboard_IV_Flat" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/Dashboard_IV_Flat.json")
  table_id            = "Dashboard_IV_Flat"

  time_partitioning {
    expiration_ms = "0"
    field         = "DELIVERY_DATE"
    type          = "DAY"
  }

}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_Dashboard_Mailpiece" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true

  project  = var.project_id
  schema   = file("${path.module}/table_schemas/Dashboard_Mailpiece.json")
  table_id = "Dashboard_Mailpiece"

  time_partitioning {
    expiration_ms = "0"
    field         = "DELIVERY_DATE"
    type          = "DAY"
  }
}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_Dashboard_Package" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/Dashboard_Package.json")
  table_id            = "Dashboard_Package"

  time_partitioning {
    expiration_ms = "0"
    field         = "DELIVERY_DATE"
    type          = "DAY"
  }

}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_Data_Aggregation_Flats_Logs" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/Data_Aggregation_Flats_Logs.json")
  table_id            = "Data_Aggregation_Flats_Logs"

}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_Data_Aggregation_Packages_Logs" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/Data_Aggregation_Packages_Logs.json")
  table_id            = "Data_Aggregation_Packages_Logs"

}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_Digest_Event_Processor_Logs" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/Digest_Event_Processor_Logs.json")
  table_id            = "Digest_Event_Processor_Logs"

}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_Digest_Open_Logs" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/Digest_Open_Logs.json")
  table_id            = "Digest_Open_Logs"

  time_partitioning {
    type          = "DAY"
    field         = "delivery_date"
    expiration_ms = var.partition_expiration_ms
  }

  count = var.toggle_4583_xxxx_mc_reporting ? 1 : 0

}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_Digest_Opt_Out_Reason" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/Digest_Opt_Out_Reason.json")
  table_id            = "Digest_Opt_Out_Reason"

  time_partitioning {
    type          = "DAY"
    field         = "optOutTime"
    expiration_ms = var.partition_expiration_ms
  }

  count = var.toggle_4583_5681_consumer_portal ? 1 : 0

}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_Subscriber_Opt_In_Settings_Dlt" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/Subscriber_Opt_In_Settings_Dlt.json")
  table_id            = "Subscriber_Opt_In_Settings_Dlt"

  time_partitioning {
    type          = "DAY"
    field         = "time_stamp"
    expiration_ms = var.partition_expiration_ms
  }

  count = var.toggle_4583_5680_frontend ? 1 : 0

}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_EmailStatistics" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/EmailStatistics.json")
  table_id            = "EmailStatistics"

}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_Email_Message_Statistics" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/Email_Message_Statistics.json")
  table_id            = "Email_Message_Statistics"

  time_partitioning {
    expiration_ms = "0"
    field         = "Delivery_Date"
    type          = "DAY"
  }

}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_Email_Send" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = false
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/Email_Send.json")
  table_id            = "Email_Send"

}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_Execute_Notifications_Logs" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/Execute_Notifications_Logs.json")
  table_id            = "Execute_Notifications_Logs"

}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_File_Processing_Logs" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/File_Processing_Logs.json")
  table_id            = "File_Processing_Logs"

}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_Image_API_Logs" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/Image_API_Logs.json")
  table_id            = "Image_API_Logs"

}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_Locale_Key_Submission_Processor" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/Locale_Key_Submission_Processor.json")
  table_id            = "Locale_Key_Submission_Processor"

}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_Login_API_Logs" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/Login_API_Logs.json")
  table_id            = "Login_API_Logs"

  time_partitioning {
    type          = "DAY"
    field         = "time_stamp"
    expiration_ms = var.partition_expiration_ms
  }

  count = var.toggle_4583_5681_consumer_portal ? 1 : 0

}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_MICS" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/MICS.json")
  table_id            = "MICS"

}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_Mics_Extract_Logs" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/Mics_Extract_Logs.json")
  table_id            = "Mics_Extract_Logs"

  time_partitioning {
    type          = "DAY"
    field         = "Delivery_Date"
    expiration_ms = var.partition_expiration_ms
  }

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0

}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_MICS_ZIP" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/MICS_ZIP.json")
  table_id            = "MICS_ZIP"

}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_Package_API_Logs" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/Package_API_Logs.json")
  table_id            = "Package_API_Logs"

  time_partitioning {
    type          = "DAY"
    field         = "timestamp"
    expiration_ms = var.partition_expiration_ms
  }

  count = var.toggle_4583_5673_myusps_migration ? 1 : 0

}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_Package_Notification_Logs" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/Package_Notification_Logs.json")
  table_id            = "Package_Notification_Logs"

  time_partitioning {
    type          = "DAY"
    field         = "TIME_STAMP"
    expiration_ms = var.partition_expiration_ms
  }

  count = var.toggle_4583_5673_myusps_migration ? 1 : 0

}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_PSG_Order_Processing_Logs" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/PSG_Order_Processing_Logs.json")
  table_id            = "PSG_Order_Processing_Logs"

}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_Physical_Address_Revision" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/Physical_Address_Revision.json")
  table_id            = "Physical_Address_Revision"

  time_partitioning {
    type          = "DAY"
    field         = "TIME_STAMP"
    expiration_ms = var.partition_expiration_ms
  }

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0

}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_Reportingsync_Dlt_Logs" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/Reportingsync_Dlt_Logs.json")
  table_id            = "Reportingsync_Dlt_Logs"

}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_Subscriber_API_Logs" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/Subscriber_API_Logs.json")
  table_id            = "Subscriber_API_Logs"

  time_partitioning {
    type          = "DAY"
    field         = "timestamp"
    expiration_ms = var.partition_expiration_ms
  }

  count = var.toggle_4583_1111_subscriber_services ? 1 : 0

}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_Eagan_Proxy_Logs" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/Eagan_Proxy_Logs.json")
  table_id            = "Eagan_Proxy_Logs"

  time_partitioning {
    type          = "DAY"
    field         = "timestamp"
    expiration_ms = var.partition_expiration_ms
  }

  count = var.toggle_4583_5680_frontend ? 1 : 0

}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_Subscriber_Processing_Logs" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/Subscriber_Processing_Logs.json")
  table_id            = "Subscriber_Processing_Logs"

}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_Sunday_Digest_Logs" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/Sunday_Digest_Logs.json")
  table_id            = "Sunday_Digest_Logs"

}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_ZIP5_TIMEZONE" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = false

  project = var.project_id

  table_id = "ZIP5_TIMEZONE"

  external_data_configuration {
    schema                = file("${path.module}/table_schemas/ZIP5_TIMEZONE.json")
    autodetect            = true
    source_format         = "CSV"
    ignore_unknown_values = false
    max_bad_records       = 0
    csv_options {
      quote             = ""
      skip_leading_rows = 1
    }

    source_uris = [
      "gs://${var.zip5_timezone_bucket}/${google_storage_bucket_object.zip5_timezone_data.name}"
    ]
  }

  depends_on = [google_storage_bucket_object.zip5_timezone_data]

}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_Zip5_Done" {

  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id

  schema   = file("${path.module}/table_schemas/Zip5_Done.json")
  table_id = "Zip5_Done"

  time_partitioning {
    expiration_ms = "0"
    field         = "DELIVERY_DATE"
    type          = "DAY"
  }

}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_DN_ZIP5_CLOUD" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = false
  project             = var.project_id
  table_id            = "DN_ZIP5_CLOUD"
  external_data_configuration {
    schema                = file("${path.module}/table_schemas/DN_ZIP5_CLOUD.json")
    autodetect            = true
    source_format         = "CSV"
    ignore_unknown_values = false
    max_bad_records       = 0
    csv_options {
      quote             = ""
      skip_leading_rows = 1
    }

    source_uris = [
      "gs://${var.zip5_timezone_bucket}/${google_storage_bucket_object.dn_pilot_zip5_data[0].name}"
    ]
  }

  count = var.toggle_4583_5681_consumer_portal ? 1 : 0

  lifecycle {
    replace_triggered_by = [
      google_storage_bucket_object.dn_pilot_zip5_data
    ]
  }

}


resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_QR_Code_Service_Logs" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/QR_Code_Service_Logs.json")
  table_id            = "QR_Code_Service_Logs"

}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_Subscriber_Sync_Email_Processing_Logs" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/Subscriber_Sync_Email_Processing_Logs.json")
  table_id            = "Subscriber_Sync_Email_Processing_Logs"

}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_MC_Detail_Report_Api_Logs" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/MC_Detail_Report_API_Logs.json")
  table_id            = "MC_Detail_Report_API_Logs"

  time_partitioning {
    type          = "DAY"
    field         = "TIME_STAMP"
    expiration_ms = var.partition_expiration_ms
  }

  count = var.toggle_4583_xxxx_mc_reporting ? 1 : 0

}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_MC_Summary_Report_Api_Logs" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/MC_Summary_Report_API_Logs.json")
  table_id            = "MC_Summary_Report_API_Logs"

  time_partitioning {
    type          = "DAY"
    field         = "TIME_STAMP"
    expiration_ms = var.partition_expiration_ms
  }

  count = var.toggle_4583_xxxx_mc_reporting ? 1 : 0

}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_Digest_Click_Logs" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/Digest_Click_Logs.json")
  table_id            = "Digest_Click_Logs"

  time_partitioning {
    expiration_ms = var.partition_expiration_ms
    field         = "delivery_date"
    type          = "DAY"
  }

  count = var.toggle_4583_5666_redesign_phase2 ? 1 : 0

}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_Digest_Tracking_Errors" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/Digest_Tracking_Errors.json")
  table_id            = "Digest_Tracking_Errors"

  time_partitioning {
    expiration_ms = var.partition_expiration_ms
    field         = "delivery_date"
    type          = "DAY"
  }

  count = var.toggle_4583_5666_redesign_phase2 ? 1 : 0

}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_e_MC_Click_Logs" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/MC_Click_Logs.json")
  table_id            = "MC_Click_Logs"

  time_partitioning {
    type          = "DAY"
    field         = "delivery_date"
    expiration_ms = var.partition_expiration_ms
  }

  count = var.toggle_4583_5666_redesign_phase2 ? 1 : 0

}

resource "google_bigquery_table" "rmin_operationaldata_bigquery_c_MDN_To_Eng_Processing_Logs" {
  dataset_id          = google_bigquery_dataset.rmin_operationaldata_bigquery_e.dataset_id
  expiration_time     = "0"
  deletion_protection = true
  project             = var.project_id
  schema              = file("${path.module}/table_schemas/MDN_To_Eng_Processing_Logs.json")
  table_id            = "MDN_To_Eng_Processing_Logs"

  time_partitioning {
    type          = "DAY"
    field         = "transaction_date"
    expiration_ms = var.partition_expiration_ms
  }

  count = var.toggle_4583_5708_mdn_to_eng ? 1 : 0

}

# [END google_bigquery_table]

# [START google_storage_bucket_object]

# Used to upload the ZIP5 Timezone csv data file to gcs bucket
resource "google_storage_bucket_object" "zip5_timezone_data" {
  name         = "templates/bigquery-dataload/zip5_timezone_dataload.csv"
  content_type = "csv"
  source       = "${path.module}/zip5_timezone_data/zip5_timezone_dataload.csv"
  bucket       = var.zip5_timezone_bucket
}

resource "google_storage_bucket_object" "dn_pilot_zip5_data" {
  name         = "templates/bigquery-dataload/dn_pilot_zip5_data.csv"
  content_type = "csv"
  source       = "${path.module}/dn_pilot_zip5_data/dn_pilot_zip5_data.csv"
  bucket       = var.zip5_timezone_bucket

  count = var.toggle_4583_5681_consumer_portal ? 1 : 0
}

# [END google_storage_bucket_object]
