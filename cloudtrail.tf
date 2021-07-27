data "aws_caller_identity" "current" {}

resource "aws_kms_key" "encrypt-decrypt-key" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}


resource "aws_cloudtrail" "CloudTrail" {
  name                          = "cloudtrail"
  s3_bucket_name                = aws_s3_bucket.CloudTrailBucket.id
  s3_key_prefix                 = "prefix"
  include_global_service_events = false
}

resource "aws_s3_bucket" "CloudTrailBucket" {
  bucket        = "account-${data.aws_caller_identity.current.account_id}-terraform-cloudtrail"
  force_destroy = true
    server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.encrypt-decrypt-key.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AWSCloudTrailAclCheck",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:GetBucketAcl",
            "Resource": "arn:aws:s3:::account-${data.aws_caller_identity.current.account_id}-terraform-cloudtrail"
        },
        {
            "Sid": "AWSCloudTrailWrite",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::account-${data.aws_caller_identity.current.account_id}-terraform-cloudtrail/prefix/AWSLogs/${data.aws_caller_identity.current.account_id}/*",
            "Condition": {
                "StringEquals": {
                    "s3:x-amz-acl": "bucket-owner-full-control"
                }
            }
        }
    ]
}
POLICY
}