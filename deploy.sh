#!/bin/bash

# Set your Google Cloud project ID
PROJECT_ID="novaeo-ims"

# Check if Docker is installed
if ! command -v docker &> /dev/null
then
    echo "Docker is not installed. Please install Docker Desktop for Mac and try again."
    exit 1
fi

# Check if gcloud is installed
if ! command -v gcloud &> /dev/null
then
    echo "gcloud is not installed. Please install the Google Cloud SDK and try again."
    exit 1
fi

# Authenticate with Google Cloud
gcloud auth login
gcloud config set project $PROJECT_ID

# Enable required APIs (you only need to do this once)
gcloud services enable run.googleapis.com containerregistry.googleapis.com cloudbuild.googleapis.com

# Configure Docker to use gcloud as a credential helper only for gcr.io
gcloud auth configure-docker gcr.io

# Build and push the backend image
cd backend
echo "Building backend image..."
docker buildx create --use
docker buildx build --platform linux/amd64 -t gcr.io/$PROJECT_ID/backend:latest --push .

# Deploy the backend to Cloud Run
echo "Deploying backend to Cloud Run..."
gcloud run deploy backend \
  --image gcr.io/$PROJECT_ID/backend:latest \
  --platform managed \
  --region us-central1 \
  --allow-unauthenticated \
  --set-env-vars="PORT=8080,DB_USER=${DB_USER},DB_PASSWORD=${DB_PASSWORD},DB_NAME=${DB_NAME},DB_HOST=${DB_HOST},DB_PORT=${DB_PORT}"

# Build and push the frontend image
cd ../frontend
echo "Building frontend image..."
docker buildx build --platform linux/amd64 -t gcr.io/$PROJECT_ID/frontend:latest --push .

# Deploy the frontend to Cloud Run
echo "Deploying frontend to Cloud Run..."
gcloud run deploy frontend \
  --image gcr.io/$PROJECT_ID/frontend:latest \
  --platform managed \
  --region us-central1 \
  --allow-unauthenticated

echo "Deployment complete!"
