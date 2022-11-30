variable "force_destroy" {
    description = ""
    type = bool
    default = false
}

variable "environment"{
    description = ""
    type = string
    default = "dev"
}

variable "region" {
    type = string
    description = "(optional) describe your variable"
}

variable "account_id" {
    type = string
    description = "Account where this module will be executed"
  
}
variable "project_name" {
    type = string
    description = "Project name to form the bucket name withing other vars"
}

variable "assume_role" {
    type = string
    description = ""
}