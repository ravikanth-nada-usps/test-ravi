# [START module locals]

locals {

  # list for redis caches (without the environment specific name_suffix)
  redis_caches_map = {
   "rmin-fs-subscriber-cache-c" : {"region" = "us-central1"}, 
   "rmin-fs-subscriber-email-cache-c" : {"region" = "us-central1"},
   "rmin-mail-campaign-cache-c" : {"region" = "us-central1"},
   "rmin-package-campaign-cache-c" : {"region" = "us-central1"},
   "rmin-saturation-data-cache-e" : {"region" = "us-east4"},
   "rmin-subscriber-cache-c" : {"region" = "us-central1"},
   "rmin-subscriber-email-cache-c" : {"region" = "us-central1"},
   "rmin-zip5-initiatives-cache-c" : {"region" = "us-central1"},
  // add new redis cache to list here just as in previous line
  }
  
  # list for bigquery tables 
  bigquery_tables_list = [
    "MICS"
  , "MICS_ZIP"
  , "ZIP5_TIMEZONE"
  , "DN_PILOT_ZIP5"
  // add new bigquery table to list here just as in previous line
  ]
}
# [END module locals]
