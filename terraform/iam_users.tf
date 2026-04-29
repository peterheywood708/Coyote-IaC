resource "aws_iam_user" "coyote_secret_user" {
  name = local.iamSecretsUserName
}

resource "aws_iam_user_policy_attachment" "secrets_policy_attachment" {
  user       = aws_iam_user.coyote_secret_user.name
  policy_arn = aws_iam_policy.secrets_policy.arn
}

resource "aws_iam_user" "coyote_s3_user" {
  name = local.iamS3UserName
}

resource "aws_iam_user_policy_attachment" "s3_policy_attachment" {
  user       = aws_iam_user.coyote_s3_user.name
  policy_arn = aws_iam_policy.s3_policy.arn
}

resource "aws_iam_user" "coyote_sqs_user" {
  name = local.iamSQSUserName
}

resource "aws_iam_user_policy_attachment" "sqs_policy_attachment" {
  user       = aws_iam_user.coyote_sqs_user.name
  policy_arn = aws_iam_policy.sqs_policy.arn
}

resource "aws_iam_user_policy_attachment" "AWSCompromisedKeyQuarantineV3" {
  user       = aws_iam_user.coyote_sqs_user.name
  policy_arn = "arn:aws:iam::aws:policy/AWSCompromisedKeyQuarantineV3"
}
