#!/bin/bash

PROJECTS=(uspscio-it-idc-9060-00d uspscio-idc-9060-01d uspscio-idc-9060-02d upscio-it-idc-9060-03d uspscio-it-idc-9060-00s uspscio-idc-9060-01s uspscio-it-idc-9060-02s uspscio-it-idc-9060-00c uspscio-it-idc-9060-01c uspscio-it-idc-9060-00p) 
for PROJECT in "${PROJECTS[@]}"
    do
		gcloud config set project $PROJECT
        
        PROJECT_ID=$(gcloud config get-value project)
        PROJECT_NUM=$(gcloud projects describe $PROJECT_ID --format="value(projectNumber)")
					
        gcloud projects add-iam-policy-binding $PROJECT_ID  \
        --member="serviceAccount:service-$PROJECT_NUM@gs-project-accounts.iam.gserviceaccount.com" \
        --role='roles/pubsub.publisher' --verbosity="error"

        gcloud projects add-iam-policy-binding $PROJECT_ID  \
        --member="serviceAccount:service-$PROJECT_NUM@gs-project-accounts.iam.gserviceaccount.com" \
        --role='roles/pubsub.subscriber' --verbosity="error"
		        
done
