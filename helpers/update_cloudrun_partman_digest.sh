#!/usr/bin/env bash


check_cloud_run() {
  gcloud run services list --platform managed --region "$1" --project "$2" --filter "metadata.name=$3" --format "value(metadata.name)" || true
}

check_cloud_sql() {
  gcloud sql instances list --project "$1" --filter "connectionName:$2" --format "value(connectionName)" || true
}

check_cloud_sql_added() {
  gcloud run services describe "$1" --platform managed --region "$2" --project "$3" --format "value(metadata.annotations['run.googleapis.com/cloudsql-instances'])" | grep -w "$4" || true
}

update_cloud_run() {
  gcloud run services update "$1" --platform managed --region "$2" --add-cloudsql-instances "$3" --project "$4"
}    

PROJECT_ID=$(gcloud config get-value project)
REGION="us-central1"
SERVICE_NAME="rmin-cloudsql-runpartman-digest"

if [[ "$PROJECT_ID" == "uspscio-it-idc-9060-00d" ]]; then
  CLOUDSQL_CONNECTION_NAME="${PROJECT_ID}:${REGION}:idc-dev-rmin-digest"

elif [[ "$PROJECT_ID" == "uspscio-idc-9060-01d" ]]; then
  CLOUDSQL_CONNECTION_NAME="${PROJECT_ID}:${REGION}:idc-dev-rmin-digest"

elif [[ "$PROJECT_ID" == "uspscio-idc-9060-02d" ]]; then
  CLOUDSQL_CONNECTION_NAME="${PROJECT_ID}:${REGION}:idc-dev-rmin-digest"
  
elif [[ "$PROJECT_ID" == "upscio-it-idc-9060-03d" ]]; then
  CLOUDSQL_CONNECTION_NAME="${PROJECT_ID}:${REGION}:idc-dev-rmin-digest"
  
elif [[ "$PROJECT_ID" == "uspscio-it-idc-9060-00s" ]]; then
  CLOUDSQL_CONNECTION_NAME="${PROJECT_ID}:${REGION}:idc-sit-rmin-digest"
  
elif [[ "$PROJECT_ID" == "uspscio-idc-9060-01s" ]]; then
  CLOUDSQL_CONNECTION_NAME="${PROJECT_ID}:${REGION}:idc-sit-rmin-digest"
  
elif [[ "$PROJECT_ID" == "uspscio-it-idc-9060-02s" ]]; then
  CLOUDSQL_CONNECTION_NAME="${PROJECT_ID}:${REGION}:idc-sit-rmin-digest"
  
elif [[ "$PROJECT_ID" == "uspscio-it-idc-9060-00c" ]]; then
  CLOUDSQL_CONNECTION_NAME="${PROJECT_ID}:${REGION}:idc-cat-rmin-digest"
  
elif [[ "$PROJECT_ID" == "uspscio-it-idc-9060-01c" ]]; then
  CLOUDSQL_CONNECTION_NAME="${PROJECT_ID}:${REGION}:idc-cat-rmin-digest"
  
elif [[ "$PROJECT_ID" == "uspscio-it-idc-9060-00p" ]]; then
  CLOUDSQL_CONNECTION_NAME="${PROJECT_ID}:${REGION}:idc-prod-rmin-digest"
  
else
  CLOUDSQL_CONNECTION_NAME=""

fi

gcloud config set project $PROJECT_ID

SERVICE_EXISTS=$(check_cloud_run "$REGION" "$PROJECT_ID" "$SERVICE_NAME")
if [[ -z "$SERVICE_EXISTS" ]]; then
  echo "Cloud Run service not found."
  exit 0
fi

CLOUDSQL_EXISTS=$(check_cloud_sql "$PROJECT_ID" "$CLOUDSQL_CONNECTION_NAME")
if [[ -z "$CLOUDSQL_EXISTS" ]]; then
  echo "Cloud SQL instance not found."
  exit 0
fi

ALREADY_ADDED=$(check_cloud_sql_added "$SERVICE_NAME" "$REGION" "$PROJECT_ID" "$CLOUDSQL_CONNECTION_NAME")
if [[ -n "$ALREADY_ADDED" ]]; then
  echo "Cloud SQL instance already added to the Cloud Run service."
  exit 0
fi

update_cloud_run "$SERVICE_NAME" "$REGION" "$CLOUDSQL_CONNECTION_NAME" "$PROJECT_ID"

