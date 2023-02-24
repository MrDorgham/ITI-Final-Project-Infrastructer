This repository contains Terraform code to set up a GCP environment for a Python app. Below are instructions for setting up the environment.

## **Prerequisites**

- GCP account
- Terraform
- Docker

## **Set Up**

1. To initialize the environment, run `terraform init`.
2. To preview the resources to be created, use `terraform plan`.
3. To create the resources, run `terraform apply`.

![Alt text](/Screenshots/1.png "Optional Title")

## **Building and Uploading Docker Image**

1. Autherized docker with `gcloud auth configure-docker`.
2. Build the Docker image for the Python app with `docker build -t gcp-python-app .`. 
3. Tag the Docker image with `docker tag gcp-python gcr.io/careful-trainer-377212/gcp-python-app`.
4. Upload the Docker image to Google Container Registry with `docker push gcr.io/careful-trainer-377212/gcp-python-app`.

![Alt text](/Screenshots/2.png "Optional Title")

## **SSH to the Private VM**

1. Install `kubectl` with the following commands:
    - `sudo apt-get update`.
    - `sudo apt-get install kubectl`.
    - `sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin`.
    
2. Authorize `gcloud` to access the Cloud Platform with your Google user credentials
- `gcloud auth login` and `gcloud auth application-default login`.


3. Set the `gcloud` account 
- `gcloud conf set account [ACCOUNT]`.

![Alt text](/Screenshots/3.png "Optional Title")

## Take a Remote of the Private GKE Cluster

1. connect to GKE with `gcloud container clusters get-credentials private-cluster --region us-east1-b --project careful-trainer-377212`.

2. Copy the `gke_deployment_files` directory to the remote machine with `git clone <HTTP URL>` after installing `git`

## **Deploy to GKE**

1. Apply the Kubernetes deployment and service configurations with `kubectl create -Rf .`.
2. Get the load balancer IP and port with `kubectl get svc`. This will provide you with the external IP address and the port of the service. 

![Alt text](/Screenshots/4.png "Optional Title")

![Alt text](/Screenshots/5.png "Optional Title")


## **Delete Resources Using Terraform When needed**

1. To delete the resources, run `terraform destroy`.

![Alt text](/Screenshots/6.png "Optional Title")



