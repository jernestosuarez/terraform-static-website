provider "aws" {
  region = var.region
  assume_role {
    role_arn    = local.assume_role_arn
  }
  default_tags {
    tags = {
      Env = var.environment
    }
  }
}