# [START locals]

locals {
  # Local variable to be used with Sunday Digest Scheduler 
  timezone_list = {
    puerto-rico : { msg_body_job_zone_name = "puerto-rico", scheduler_name_suffix = "Puerto_Rico", gcloud_tz = "America/Puerto_Rico", zip5_tz = "America/Puerto_Rico" },
    eastern : { msg_body_job_zone_name = "eastern", scheduler_name_suffix = "Eastern", gcloud_tz = "America/New_York", zip5_tz = "US/Eastern" },
    central : { msg_body_job_zone_name = "central", scheduler_name_suffix = "Central", gcloud_tz = "America/Chicago", zip5_tz = "US/Central" },
    arizona : { msg_body_job_zone_name = "arizona", scheduler_name_suffix = "Arizona", gcloud_tz = "America/Phoenix", zip5_tz = "US/Arizona" },
    mountain : { msg_body_job_zone_name = "mountain", scheduler_name_suffix = "Mountain", gcloud_tz = "America/Denver", zip5_tz = "US/Mountain" },
    pacific : { msg_body_job_zone_name = "pacific", scheduler_name_suffix = "Pacific", gcloud_tz = "America/Los_Angeles", zip5_tz = "US/Pacific" },
    alaska : { msg_body_job_zone_name = "alaska", scheduler_name_suffix = "Alaska", gcloud_tz = "America/Juneau", zip5_tz = "US/Alaska" },
    hawaii : { msg_body_job_zone_name = "hawaii", scheduler_name_suffix = "Hawaii", gcloud_tz = "Pacific/Honolulu", zip5_tz = "US/Hawaii" },
  }
}

# [END locals]