variable "force_destroy" {
    description = ""
    type = bool
    default = false
}

variable "s3_bucket_id"{
    description = ""
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
    description = "(optional) describe your variable"
}

variable "account_id" {
    type = string
    description = "Account where this module will be executed"
  
}

variable "assume_role" {
    type = string
    description = ""
}

variable "environment" {
    type = string
    description = ""
  
}