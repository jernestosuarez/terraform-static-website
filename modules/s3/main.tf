module "web_storage" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = local.bucket_name
  acl    = "log-delivery-write"

  # Allow deletion of non-empty bucket
  force_destroy = var.force_destroy

}

resource "aws_s3_object_copy" "index" {
  bucket = module.web_storage.s3_bucket_id
  key    = "index.html"
  source = "${path.module}/html/index.html"
  etag = filemd5("${path.module}/html/index.html")
}
