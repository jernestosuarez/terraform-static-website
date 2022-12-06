# CloudFront with separate S3 and DNS

This an example how to deploy a static site with CloudFront.

Assuming you have some kind of governance implemented withing your organization, with the default values you can use it safely if you have implemented Control Tower with the default roles and also allow custom AssumeRoles.

The solution needs to be executed from your governance AWS Account where you are allowed to assume the control for the following accounts / resources
 - CDN account: Access to CloudFront, ACM and Route53
 - S3 account: Access to S3 and IAM

The solution develops resources with the folowing schema 

![Solution Schema](./doc/schema.png)

Here we can appreciate how one main account is used to deploy the CloudFront, the ACM and Route53 records. A secondary accoutn is used to create the bucket.

The solution is deployed automatically in five stages:

1. Storage: New S3 bucket is deployed to ensure the right permissions and a name corresponding with the environment of this deplpoyment (dev,stage,prod..)
2. Certificate: New ACM certificate is requested and the validation records are created in the same account's Route53
3. Distribution: The CloudFront is deployed using the outputs of the bucket and the certificate created previously
4. DNS: New DNS entry is created to point the distribution created in the previous step
5. Policy: A Policy dociment is attached to the bucket created in the step 1 to ensure access to the cloudfront's identity created in the step 3 

# Use

1. Configure your settings.yaml
   1. This file have all the settings needed for setup this solution. Please refer the section [Inputs](#inputs) for knowing the function of each parameter.
2. Configure your backend.conf where to store the state of this deployment.
   1. This settings reffer to the configuration used for the remote state and the Role used to create the resources.
      1. region: Region where the remote state config items can be found
      2. bucket: Name of the bucket to store the Terraform state
      3. key: Name of the DynamoDb key to persist the locks, usually "LockID"
      4. dynamodb_table: Name of the DynamoDb database
      5. role_arn: Role ARN to assume for executing in the remote account. Usually in environments managed by AWS control Tower the AWSControlTowerExecution role is available in all the child accounts and can be used for this purpose. If not provide a Rol thaat can be assumed from your SRE Governance acccount. 
   2. If you want to avoid this step and create initial state's config items (s3+dynamodb) automatically you can do it using Terragrunt. The terragrunt implementation is out of the scope of this test
3. Ensure you have an index.html in your bucket. You can use the sample files in modules/s3/html

# Execute the solution

Run the following command.

```
terraform init -backend-config=backend.conf && terraform plan && terraform apply
```

# Inputs 
Set this inputs in the ./settings.yaml file.

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
|cdn\_account\_id  | AccountID where the CDN must be created | String | None | true |
|s3\_account\_id | AccountID where the S3 bucket must be created  | String | None | true |
|project\_name | Name of the project to generate some random strings related to it  | String | None | true |
|region | Region for the S3 related stuff. The CDN will be deployed on North Virginia  | String | eu-west-1 | true |
|environment | Environment for this deployment, the bucket and some random tags and strings will have it attached  | String | dev | true |
|domain | FQDN for deploying this site  | String | None | true |
|zone\_id | Zone ID for the ROUTE53 hosting the domain zone. This route 53 lives in the same account than the ACM and the CDN  | Boolean | None | true |
|s3\_force\_destroy | Destroy protection for the s3 bucket. Put it to true in case you want to destroy the content of the bucket when this resource is deleted  | String | None | true |
|assume\_role | The name of the role used in your multi-account governance policy. By default AWSControlTowerExecution compatible with AWS Control Tower environments with or without AFT  | String | AWSControlTowerExecution | true |

## Outputs

| Name | Description |
|------|-------------|
|cdn\_account\_id |  AccountID where the CDN must be created |
|s3\_account\_id |  AccountID where the S3 bucket must be created |
|project\_name |  Name of the project to generate some random strings related to it |
|region |  Region for the S3 related stuff. The CDN will be deployed on North Virginia |
|environment |  Environment for this deployment, the bucket and some random tags and strings will have it attached |
|domain |  FQDN for deploying this site |
|zone\_id |  Zone ID for the ROUTE53 hosting the domain zone. This route 53 lives in the same account than the ACM and the CDN |
|s3\_force\_destroy |  Destroy protection for the s3 bucket. Put it to true in case you want to destroy the content of the bucket when this resource is deleted |
|assume\_role |  The name of the role used in your multi-account governance policy. By default AWSControlTowerExecution compatible with AWS Control Tower environments with or without AFT |
|cloudfront\_origin\_access\_identity\_iam\_arns |  The IAM arns of the origin access identities created |
|cloudfront\_origin\_access\_identity\_ids |  The IDS of the origin access identities created |
|cdn\_endpoint |  Endpoint generated by the CDN |
|s3\_bucket\_bucket\_domain\_name |  DNS for generated S3 Bucket |
|acm\_certificate\_arn |  ACM certificate ARN for this domain |
|s3\_bucket\_id |  ID for generated S3 Bucket |
# DRY Statement

Using high quality OSS modules provide tested solutions among other multiple benefits.