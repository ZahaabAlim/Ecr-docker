# Build and Push to ECR

This repository contains GitHub Actions workflows to build and push Docker images to Amazon ECR and deploy infrastructure using Terraform.

## Summary

This project automates the process of building Docker images, pushing them to Amazon ECR, and managing infrastructure using Terraform. It includes two GitHub Actions workflows: one for building and pushing Docker images, and another for deploying infrastructure with Terraform. Additionally, it provides a Python script to calculate the factorial of a number and a Dockerfile to containerize the script.

## Workflows

### Build and Push to ECR

This workflow is triggered on a push to the `main` branch. It builds a Docker image from the source code, tags it, and pushes it to an Amazon ECR repository. Additionally, it sets a lifecycle policy for the ECR repository.

### Deploy Terraform

This workflow is also triggered on a push to the `main` branch. It uses Terraform to manage infrastructure and deploys the Docker image to Amazon ECR.

## Python Script

The `app.py` script calculates the factorial of a given number using a recursive function.

## Dockerfile

The Dockerfile creates a Docker image for the Python script.

## Terraform Configuration

The `main.tf` file sets up the AWS provider, configures the backend, and creates an ECR repository with a lifecycle policy.

## Usage

1. **Clone the repository**:
   ```sh
   git clone https://github.com/your-repo.git
   cd your-repo
