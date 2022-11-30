locals {
    assume_role_arn = "arn:aws:iam::${var.account_id}:role/${var.assume_role}"
    bucket_name = "${var.project_name}-${var.account_id}-${var.environment}"
}

