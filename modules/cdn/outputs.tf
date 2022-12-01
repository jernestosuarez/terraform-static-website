output "cdn_endpoint" {
    value = module.cdn.cloudfront_distribution_domain_name
}

output "distribution_arn" {
    value = module.cdn.cloudfront_distribution_arn
}

output "cloudfront_origin_access_identity_iam_arns"{
    description = "The IAM arns of the origin access identities created"
    value = module.cdn.cloudfront_origin_access_identity_iam_arns
}
output "cloudfront_origin_access_identity_ids"{
    description = "The IDS of the origin access identities created"
    value = module.cdn.cloudfront_origin_access_identity_ids
}