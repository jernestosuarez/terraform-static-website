variable "account_id" {
    type = string
    description = "Account where this module will be executed"
  
}
variable "assume_role"{
    description = ""
    type = string
    default ="AWSControlTowerExecution"
}
variable "environment"{
    description = ""
    type = string
    default = "dev"
}
variable "domain"{
    description = ""
    type = string
}

variable "bucket"{
    description = ""
    type = string
}

variable "acm_certificate_arn" {
    description = ""
    type = string
  
}