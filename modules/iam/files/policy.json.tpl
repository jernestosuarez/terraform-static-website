{
    "Version": "2008-10-17",
    "Id": "PolicyForCloudFrontPrivateContent",
    "Statement": [
        {
            "Sid": "AllowCloudFrontServicePrincipal",
            "Effect": "Allow",
            "Principal": {
                "Service": "cloudfront.amazonaws.com"
            },
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::${bucket_name}/*",
            "Condition": {
                "StringEquals": {
                    "AWS:SourceArn": "${distribution_arn}"
                }
            }
        },
        {
        "Sid": "AllowCloudFrontServiceIdentity",
        "Effect": "Allow",
        "Principal": {
        "AWS": "${identity_arn}"
            },
        "Action": "s3:GetObject",
        "Resource": "arn:aws:s3:::${bucket_name}/*"
        }
    ]
}