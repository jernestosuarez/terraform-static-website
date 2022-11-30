module "web_storage" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = local.bucket_name
  acl    = "log-delivery-write"

  # Allow deletion of non-empty bucket
  force_destroy = var.force_destroy

}