// Policies for Turnkey Linux hub
data "aws_iam_policy_document" "turnkeyhub_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    /*
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
*/

    principals {
      type = "AWS"
      identifiers = [
        var.account_id
      ]
    }

    condition {
      test     = "ForAnyValue:StringEquals"
      variable = "sts:ExternalId"

      values = [var.external_id, ]
    }
  }
}

data "aws_iam_policy_document" "turnkeyhub_grants" {
  statement {
    actions = [
      "ec2:*",
      "route53:*",
      "route53domains:*",
      "cloudwatch:*"
    ]

    resources = ["*"]
  }

  statement {
    actions = [
      "s3:ListAllMyBuckets",
    ]
    resources = [
      "arn:aws:s3:::*"
    ]
  }

  statement {
    actions = [
      "s3:*",
    ]
    resources = [
      "arn:aws:s3:::tklbam-*"
    ]
  }

  statement {
    actions = [
      "sts:DecodeAuthorizationMessage",
    ]
    resources = ["*"]
  }
}
