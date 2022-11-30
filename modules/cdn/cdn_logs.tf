module "cdn_logs" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = local.log_bucket_name
  acl    = "log-delivery-write"

  # Allow deletion of non-empty bucket
  force_destroy = true

}