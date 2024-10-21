# Configure the AWS provider
provider "aws" {
  region = "us-east-1"  
}
# Configure the Terraform backend to store the state in S3 and use DynamoDB for locking
terraform {
  backend "s3" {
    bucket = "tf-backend-st1"
    key    = "terraform.tfstate"
    region = "us-east-1"

  }
}
# Create an ECR repository 
resource "aws_ecr_repository" "my_ecr_repo" {
  name = "my-ecr-repo"
}
# Create an ECR lifecycle policy 
resource "aws_ecr_lifecycle_policy" "my_ecr_policy" {
  repository = aws_ecr_repository.my_ecr_repo.name
 
  policy = jsonencode({
    "rules": [
    {
      "rulePriority": 1,
      "description": "keep last 3 images",
      "selection": {
        "tagStatus": "tagged",
        "tagPatternList": [
          "v0.*"
        ],
        "countType": "imageCountMoreThan",
        "countNumber": 3
      },
      "action": {
        "type": "expire"
      }
    },
    {
      "rulePriority": 2,
      "description": "remove untagged",
      "selection": {
        "tagStatus": "untagged",
        "countType": "sinceImagePushed",
        "countUnit": "days",
        "countNumber": 1
      },
      "action": {
        "type": "expire"
      }
    },
    {
      "rulePriority": 3,
      "description": "remove snapshots",
      "selection": {
        "tagStatus": "tagged",
        "tagPatternList": [
          "snapshot*"
        ],
        "countType": "sinceImagePushed",
        "countUnit": "days",
        "countNumber": 7
      },
      "action": {
        "type": "expire"
      }
    }
  ]
  })
} 
