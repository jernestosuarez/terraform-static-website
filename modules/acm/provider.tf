provider "aws" {
  region = "us-east-1"
  assume_role {
    role_arn    = local.assume_role_arn
  }
  default_tags {
    tags = {
      environment = var.environment
    }
  }
}