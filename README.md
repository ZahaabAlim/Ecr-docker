## Automated Docker Image Build and Deployment

This repository contains GitHub Actions workflows to build and push Docker images to Amazon ECR and deploy infrastructure using Terraform.

## Summary

This project automates the process of building Docker images, pushing them to Amazon ECR, and managing infrastructure using Terraform. It includes two GitHub Actions workflows: one for building and pushing Docker images, and another for deploying infrastructure with Terraform. The Terraform configuration sets up the AWS provider, configures the backend for state storage and locking, creates an ECR repository, and sets a lifecycle policy for image retention. Additionally, the project features a Python script to calculate the factorial of a number it serves as a simple example application to demonstrate the process of building, containerizing, and deploying an application and a Dockerfile to containerize the script It specifies the base image, sets the working directory inside the container, copies the Python script into the container, and sets the default command to run the script, demonstrating the complete CI/CD pipeline from code to deployment.

## Workflows
### Build and Push to ECR Workflow (`build.yaml`)

This GitHub Actions workflow is triggered on a push to the `main` branch. It automates the process of building a Docker image from the source code, tagging it, and pushing it to Amazon ECR. Additionally, it sets a lifecycle policy for the ECR repository to manage image retention.

### Deploy Terraform Workflow (`deploy.yaml`)

This GitHub Actions workflow is also triggered on a push to the `main` branch. It uses Terraform to manage AWS infrastructure, including creating an ECR repository and setting a lifecycle policy. It also builds, tags, and pushes the Docker image to Amazon ECR.

### Terraform Configuration (`main.tf`)

Terraform is used to manage the AWS infrastructure. It configures the AWS provider, sets up the backend to store the Terraform state in an S3 bucket and use a DynamoDB table for state locking, creates an ECR repository, and sets a lifecycle policy to manage Docker image retention.

### Python Script (`app.py`)

The Python script calculates the factorial of a given number using a recursive function. It serves as a simple example application to demonstrate the process of building, containerizing, and deploying an application.

### Dockerfile

The Dockerfile defines how to build a Docker image for the Python script. It specifies the base image, sets the working directory inside the container, copies the Python script into the container, and sets the default command to run the script.


## Terraform Configuration

The `main.tf` file sets up the AWS provider, configures the backend, and creates an ECR repository with a lifecycle policy.

## Usage

1. **Clone the repository**:
   ```sh
   git clone https://github.com/your-repo.git
   cd your-repo
