locals {
    assume_role_arn = "arn:aws:iam::${var.account_id}:role/${var.assume_role}"
    log_bucket_name = "${var.bucket}-${var.environment}-logs"
}