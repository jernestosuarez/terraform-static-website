module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 2.0"
  
  zone_id = var.zone_id
  
  records = [
  {
      name           = local.hostname
      type           = "CNAME"
      ttl            = 5
      records        = [var.cdn_endpoint]
   }]

}
