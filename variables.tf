variable "region"{
    description = ""
    type = string
    default = "eu-west-1"
}
variable "project_name"{
    description = ""
    type = string
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
variable "assume_role"{
    description = ""
    type = string
    default ="AWSControlTowerExecution"
}
variable "dns_account_id"{
    description = ""
    type = string
}
variable "cdn_account_id"{
    description = ""
    type = string
}
variable "s3_account_id"{
    description = ""
    type = string
}