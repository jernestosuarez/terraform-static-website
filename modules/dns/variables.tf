variable "account_id" {
    type = string
    description = "Account where this module will be executed"
  
}
variable "environment"{
    description = "Environment for this deployment, the bucket and some random tags and strings will have it attached"
    type = string
    default = "dev"
}
variable "region" {
    type = string
    description = "Region for the S3 related stuff. The CDN will be deployed on North Virginia"
}
variable "zone_id" {
    type = string
    description = "(optional) describe your variable"
}

variable "cdn_endpoint" {
  type = string
  description = "CDN endpoint FQDN"
}

variable "domain" {
    type = string
    description = "The domain record needs to be published"
  
}



variable "assume_role" {
    type = string
    description = "The name of the role used in your multi-account governance policy. By default AWSControlTowerExecution compatible with AWS Control Tower environments with or without AFT"
}