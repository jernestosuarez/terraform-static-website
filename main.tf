 module "storage" {
     source = "./modules/s3"
     
     account_id = local.settings.s3_account_id
     environment = local.settings.environment
     project_name = local.settings.project_name
     force_destroy = local.settings.s3_force_destroy
     region = local.settings.region
     assume_role = local.settings.assume_role
 }
 module "certificate" {
     source = "./modules/acm"
     
     account_id = local.settings.cdn_account_id
     environment = local.settings.environment
     domain  = local.settings.domain
     zone_id = local.settings.zone_id
 }

 module "distribution" {
     source = "./modules/cdn"
 
     account_id = local.settings.cdn_account_id
     environment = local.settings.environment
     domain  = local.settings.domain
     bucket = module.storage.s3_bucket_bucket_domain_name
     acm_certificate_arn = module.certificate.acm_certificate_arn
     assume_role = local.settings.assume_role

 #    depends_on = [module.storage,module.certificate]
 }
 

# 
 module "dns" {
     source = "./modules/dns"
 
     account_id = local.settings.cdn_account_id
     environment = local.settings.environment
     zone_id = local.settings.zone_id
     cdn_endpoint = module.distribution.cdn_endpoint
     region = local.settings.region
     domain = local.settings.domain
     assume_role = local.settings.assume_role
   # depends_on = [module.distribution]
 }
# 
 module "policy" {
     source = "./modules/iam"
     
     account_id = local.settings.s3_account_id
     environment = local.settings.environment
     s3_bucket_id = module.storage.s3_bucket_id
     distribution_arn = module.distribution.distribution_arn
     identity_arn = module.distribution.cloudfront_origin_access_identity_iam_arns[0]
     region = local.settings.region
     assume_role = local.settings.assume_role
    # depends_on = [module.distribution]
 }