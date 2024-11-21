Steps to get started with terraform:

- Create new bucket to store state:
   - PROJECT_ID=$(gcloud config get-value project)
   - gsutil mb gs://${PROJECT_ID}-tfstate
   - gsutil versioning set on gs://${PROJECT_ID}-tfstate

- Check out / download repo into cloud shell editor
   - cd rmin-cloud-terraform-scripts
   - cd environments
   - cd <env>

Initialize terraform
 - terraform init

- If there are any existing resources run these commands:
  - For the database:
    - terraform import module.dashboard_firestore.google_firestore_database.{RESOURCE_NAME} projects/$PROJECT_ID/databases/{DATABASE_NAME}

  - For fields:
    - terraform import module.dashboard_firestore.google_firestore_field.{RESOURCE_NAME} projects/$PROJECT_ID/databases/{DATABASE_NAME}/collectionGroups/{COLLECTION_ID}/fields/{FIELD_ID}

   For Dashboard Firestore Specifically:
    - terraform import module.dashboard_firestore.google_firestore_database.database projects/$PROJECT_ID/databases/dashboard

    - terraform import module.dashboard_firestore.google_firestore_field.inbound_package_expire_at projects/$PROJECT_ID/databases/dashboard/collectionGroups/inboundPackages/fields/expireAt
    - terraform import module.dashboard_firestore.google_firestore_field.inbound_package_event_timestamp projects/$PROJECT_ID/databases/dashboard/collectionGroups/inboundPackages/fields/eventTimeStamp

    - terraform import module.dashboard_firestore.google_firestore_field.outbound_package_expire_at projects/$PROJECT_ID/databases/dashboard/collectionGroups/outboundPackages/fields/expireAt
    - terraform import module.dashboard_firestore.google_firestore_field.outbound_package_event_timestamp projects/$PROJECT_ID/databases/dashboard/collectionGroups/outboundPackages/fields/eventTimeStamp

    - terraform import module.dashboard_firestore.google_firestore_field.iv_flats_expire_at projects/$PROJECT_ID/databases/dashboard/collectionGroups/ivFlats/fields/expireAt
    - terraform import module.dashboard_firestore.google_firestore_field.iv_flats_scan_date_time projects/$PROJECT_ID/databases/dashboard/collectionGroups/ivFlats/fields/scanDateTime

    - terraform import module.dashboard_firestore.google_firestore_field.mailpieces_expire_at projects/$PROJECT_ID/databases/dashboard/collectionGroups/mailpieces/fields/expireAt
    - terraform import module.dashboard_firestore.google_firestore_field.saturation_expire_at projects/$PROJECT_ID/databases/dashboard/collectionGroups/saturation/fields/expireAt

  Once everything is imported and the backend created run the following command:
  
  terraform init
  
  This will compare the terraform script with what is being tracked by the state. If there are any changes they will be shown in the output. If everything looks correct
  run the following command to apply the changes (if prompted just enter 'yes'):
  
  terraform apply
