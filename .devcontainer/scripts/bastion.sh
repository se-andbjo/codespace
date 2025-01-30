#!/bin/bash

# Check if a parameter is provided
if [ -z "$1" ]; then
  echo "Usage: bastion dev | test"
  exit 1
fi

# Use a switch-case to handle the parameter
case "$1" in
  dev)
    gcloud config set project roxtec-dev-web-90f5
    ;;
  test)
    gcloud config set project roxtec-test-web-1580
    ;;
  *)
    echo "Unknown option: $1"
    echo "Valid options are: dev, test"
    exit 1
    ;;
esac

# Authenticate with IAM
if ! gcloud auth print-access-token &> /dev/null; then
    echo "Login session is invalid or expired."
    gcloud auth login
fi

# Sets the region
gcloud config set run/region europe-west1

# Runs the proxy
gcloud run services proxy web-bastion --port=9000