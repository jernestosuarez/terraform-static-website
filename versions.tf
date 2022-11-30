terraform {
  required_version = ">= 1.0.1"

  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = ">= 3.72"
    }
  }

  backend "s3" {
    region         = "eu-west-1"
    bucket         = "cdn-static-example-xsdc-state"
    key            = "LockID" 
    dynamodb_table = "cdn-static-example-xsdc-locks"
    role_arn       = "arn:aws:iam::248128070333:role/AWSControlTowerExecution"
  }
}
