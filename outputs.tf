output "cdn_account_id" {
    value = local.settings.cdn_account_id
    description = "Setting value"
}
output "s3_account_id" {
    value = local.settings.s3_account_id
    description = "Setting value"
}
output "project_name" {
    value = local.settings.project_name
    description = "Setting value"
}
output "region" {
    value = local.settings.region
    description = "Setting value"
}
output "environment" {
    value = local.settings.environment
    description = "Setting value"
}
output "domain" {
    value = local.settings.domain
    description = "Setting value"
}
output "zone_id" {
    value = local.settings.zone_id
    description = "Setting value"
}
output "s3_force_destroy" {
    value = local.settings.s3_force_destroy
    description = "Setting value"
}
output "assume_role" {
    value = local.settings.assume_role
    description = "Setting value"
}
output "cloudfront_origin_access_identity_iam_arns"{
    description = "	The IAM arns of the origin access identities created"
    value = module.distribution.cloudfront_origin_access_identity_iam_arns
}
output "cloudfront_origin_access_identity_ids"{
    description = "The IDS of the origin access identities created"
    value = module.distribution.cloudfront_origin_access_identity_ids
}
output "cdn_endpoint" {
    description = ""
    value = module.distribution.cdn_endpoint
}
output "s3_bucket_bucket_domain_name" {
    description = ""
    value = module.storage.s3_bucket_bucket_domain_name
}
output "acm_certificate_arn" {
    description = ""
    value = module.certificate.acm_certificate_arn
}
output "s3_bucket_id" {
    description = ""
    value = module.storage.s3_bucket_id
}