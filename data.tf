// Policies for Turnkey Linux hub
data "aws_iam_policy_document" "turnkeyhub_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "turnkeyhub_grants" {
  statement {
    sid = "1"
    actions = [
        "ec2:*",
        "route53:*",
        "route53domains:*",
        "cloudwatch:*"
     ]
      
    resources = ["*"]
  }
  
  statement {
    sid = "2"
    actions = [
      "s3:ListAllMyBuckets",
    ]
    resources= [
      "arn:aws:s3:::*"
    ]
  }
  
  statement {
    sid = "3"
    actions = [
      "s3:*",
    ]
    resources = [
      "arn:aws:s3:::tklbam-*"
    ]
  }
  
  statement {
    sid = "4"
    actions = [
      "sts:DecodeAuthorizationMessage",
    ]
    resources = ["*"]
  }
}
