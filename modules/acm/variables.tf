variable "account_id" {
    type = string
    description = "Account where this module will be executed"
  
}
variable "assume_role"{
    description = "The name of the role used in your multi-account governance policy. By default AWSControlTowerExecution compatible with AWS Control Tower environments with or without AFT"
    type = string
    default ="AWSControlTowerExecution"
}
variable "environment"{
    description = "Environment for this deployment, the bucket and some random tags and strings will have it attached"
    type = string
    default = "dev"
}
variable "domain"{
    description = "FQDN for deploying this site"
    type = string
}

variable "zone_id"{
    description = "Zone ID for the ROUTE53 hosting the domain zone. This route 53 lives in the same account than the ACM and the CDN"
    type = string
}