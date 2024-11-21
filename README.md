# rmin-cloud-terraform-scripts
Repository that hold the terraform scripts for our cloud resources

https://cloud.google.com/docs/terraform/best-practices-for-terraform

## Release Notes

**1.** Deploy rmin-cloud-dashboard-api to GCR
  - Note the SHA Hash Value for the GCR image, this will be used later in the deployment <br>

      Command to get SHA value<br>
      PROJECT_ID=$(gcloud config get-value project)
      gcloud container images describe gcr.io/$PROJECT_ID/cloud-run/{application}:{version} --format="value(image_summary.fully_qualified_digest)"

      e.x. 
      PROJECT_ID=$(gcloud config get-value project)
      gcloud container images describe gcr.io/$PROJECT_ID/cloud-run/rmin-cloud-dashboard-api:1.0.9 --format="value(image_summary.fully_qualified_digest)"

**2.** Deploy rmin-cloud-image-api to GCR
  - Note the SHA Hash Value for the GCR image, this will be used later in the deployment

**3.** Go to GCR - gcr.io/{env}/cloud-run/rmin-cloud-dashboard-event-processor-run (If you don't see this then deploy rmin-cloud-dashboard-event-processor-run to GCR)
  - Note the SHA Hash Value for the GCR image, this will be used later in the deployment

**4.** Create GCS bucket to store terraform state (DO this step only when the bucket and state file doesn't exist)
  - PROJECT_ID=$(gcloud config get-value project)
  - gsutil mb gs://${PROJECT_ID}-tfstate
  - gsutil versioning set on gs://${PROJECT_ID}-tfstate

**5.** Create secret key if not exists
  - Secret key name = "rmin-clouddashboard-api-secret"
  - Value = Go to https://randomkeygen.com/ and pick up any value from "CodeIgniter Encryption Keys" section
  - Location = "us-central1"
  
**6.** Enable eventarc api
  - Enable eventarc api through admin console and search APIs and Services, search for eventarc and click on enable
  - (Or) enable using gcloud command - "gcloud services enable eventarc.googleapis.com"

**7.** Check out / download cloud image dimensions api repo into your Cloud Shell Editor
   - Download Zip from Github (https://github.usps.gov/appdev/rmin-cloud-image-dimension-func)
   - Upload zipped repo to the bucket rmin-template-bucket-e-{PROJECT_NUMBER}/templates/functions
   
**8.** Check out / download repo into your Cloud Shell Editor
   - Download Zip from Github (https://github.usps.gov/appdev/rmin-cloud-terraform-scripts)
   - PROJECT_ID=$(gcloud config get-value project)
   - gsutil mb gs://${PROJECT_ID}-tf-scripts (create the bucket only if it doesn't exist)
   - Upload Unzipped Repo to this bucket (overwrite contents if the file already exists)
   - gsutil cp -r gs://${PROJECT_ID}-tf-scripts/rmin-cloud-terraform-scripts-main .

**9.** cd into the correct environment
 - cd rmin-cloud-terraform-scripts-main/environments/{env}

**10.** Run terraform init to create the state file in the bucket created in step 3.

**11.** Run terraform plan to generate the diff for the deployment
  - When asked, enter the SHA hash values from step 1, 2, 3 in the respective prompts

**12.** Run terraform apply to deploy the changes
  - When asked, enter the SHA hash value from step 1, 2, 3 in the respective prompts
