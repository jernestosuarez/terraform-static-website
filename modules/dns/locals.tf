locals {
    assume_role_arn = "arn:aws:iam::${var.account_id}:role/${var.assume_role}"
    hostname = split(".",var.domain)[0]
}

