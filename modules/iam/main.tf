resource "aws_s3_bucket_policy" "s3_cur_output_name_policy" {
  bucket = var.s3_bucket_id
  policy = templatefile("${path.module}/files/policy.json.tpl",{
    bucket_name  = var.s3_bucket_id, 
    distribution_arn = var.distribution_arn,
    identity_arn = var.identity_arn
    })
}
