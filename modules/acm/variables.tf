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

variable "zone_id"{
    description = ""
    type = string
}