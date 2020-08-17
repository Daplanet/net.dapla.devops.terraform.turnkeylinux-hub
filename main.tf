// Should create new assume role for turnkey linux hub
resource "aws_iam_policy" "turnkeyhub_policy" {
  name        = "turnkeyhub-policy"
  path        = "/"
  description = "Turnkey hub IAM policy"
  policy      = data.aws_iam_policy_document.turnkeyhub_grants.json
}

resource "aws_iam_role" "turnkeyhub_role" {
  name = "turnkeyhub"

  assume_role_policy = data.aws_iam_policy_document.turnkeyhub_assume_role.json

  tags = {
    owner = "denzuko"
  }
}
