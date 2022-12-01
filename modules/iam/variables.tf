variable "force_destroy" {
    description = "Destroy protection for the s3 bucket. Put it to true in case you want to destroy the content of the bucket when this resource is deleted"
    type = bool
    default = false
}

variable "s3_bucket_id"{
    description = "S3 Bucket ID"
    type = string
}

variable "distribution_arn" {
    type = string
    description = "Distribution to grant bucket permissions"
}
variable "identity_arn" {
    type = string 
    description = "CloudFront Identity created for add it into the S3 policy"
  
}
variable "region" {
    type = string
    description = "Region for the S3 related stuff. The CDN will be deployed on North Virginia"
}

variable "account_id" {
    type = string
    description = "Account where this module will be executed"
  
}

variable "assume_role" {
    type = string
    description = "The name of the role used in your multi-account governance policy. By default AWSControlTowerExecution compatible with AWS Control Tower environments with or without AFT"
}

variable "environment" {
    type = string
    description = "Environment for this deployment, the bucket and some random tags and strings will have it attached"
  
}