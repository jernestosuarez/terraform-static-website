# CloudFront with separate S3 and DNS

This an example how to deploy a static site with CloudFront.

Assuming governance with Control Tower, allow custom AssumeRoles.

![Solution Schema](./doc/schema.png)

# Use

```
terraform init && terraform plan && terraform apply
```

# DRY Statement

Using high quality OSS modules provide tested solutions among other multiple benefits.