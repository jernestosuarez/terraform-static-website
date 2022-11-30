variable "account_id" {
    type = string
    description = "Account where this module will be executed"
  
}
variable "environment"{
    description = ""
    type = string
    default = "dev"
}
variable "region" {
    type = string
    description = "region"
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
    description = ""
}

