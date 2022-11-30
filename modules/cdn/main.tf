module "cdn" {
  source = "terraform-aws-modules/cloudfront/aws"

  aliases = [var.domain]

  comment             = "Static site CDN example"
  enabled             = true
  is_ipv6_enabled     = true
  price_class         = "PriceClass_All"
  retain_on_delete    = false
  wait_for_deployment = false
  default_root_object = "index.html"

  create_origin_access_identity = true
  origin_access_identities = {
    s3_bucket_one = "CloudFront Authorization"
  }

  logging_config = {
    bucket = module.cdn_logs.s3_bucket_bucket_regional_domain_name
  }


#     + origin {
#         + connection_attempts = 3
#         + connection_timeout  = 10
#         + domain_name         = "cdn-test-suarez-695964370516-prod.s3.amazonaws.com"
#         + origin_id           = "s3_one"
#
#         + s3_origin_config {
#             + origin_access_identity = "origin-access-identity/cloudfront/EJZYR4TJZ4424"
#           }
#       }
#     - origin {
#         - connection_attempts      = 3 -> null
#         - connection_timeout       = 10 -> null
#         - domain_name              = "cdn-test-suarez-695964370516-prod.s3.amazonaws.com" -> null
#         - origin_access_control_id = "E8WTPE7OWBAPP" -> null
#         - origin_id                = "s3_one" -> null
#       }
#


  origin = {

    s3_one = {
      domain_name = var.bucket
      s3_origin_config = {
        origin_access_identity = "s3_bucket_one"
      }
    }
  }

  default_cache_behavior = {
    target_origin_id           = "s3_one"
    viewer_protocol_policy     = "allow-all"

    allowed_methods = ["GET", "HEAD", "OPTIONS"]
    cached_methods  = ["GET", "HEAD"]
    compress        = true
    query_string    = true
  }

  ordered_cache_behavior = [
    {
      path_pattern           = "*"
      target_origin_id       = "s3_one"
      viewer_protocol_policy = "redirect-to-https"

      allowed_methods = ["GET", "HEAD", "OPTIONS"]
      cached_methods  = ["GET", "HEAD"]
      compress        = true
      query_string    = true
    }
  ]

  viewer_certificate = {
    acm_certificate_arn = var.acm_certificate_arn
    ssl_support_method  = "sni-only"
  }
}