resource "aws_iam_policy" "sqs_policy" {
  name = local.sqsPolicyName
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "VisualEditor0",
        "Effect" : "Allow",
        "Action" : [
          "sqs:DeleteMessage",
          "sqs:ReceiveMessage",
          "sqs:SendMessage"
        ],
        "Resource" : aws_sqs_queue.sqs_transcription_queue.arn
      },
      {
        "Sid" : "VisualEditor1",
        "Effect" : "Allow",
        "Action" : "sqs:ListQueues",
        "Resource" : "*"
      },
      {
        "Sid" : "VisualEditor2",
        "Effect" : "Allow",
        "Action" : [
          "sqs:DeleteMessage",
          "sqs:ReceiveMessage",
          "sqs:SendMessage"
        ],
        "Resource" : aws_sqs_queue.sqs_label_queue.arn
      }
    ]
  })
}

resource "aws_iam_policy" "secrets_policy" {
  name = local.secretsPolicyName
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "secretsmanager:GetSecretValue",
          "secretsmanager:DescribeSecret",
          "secretsmanager:ListSecrets"
        ],
        "Resource" : [
          aws_secretsmanager_secret.speech_secret.arn,
          aws_secretsmanager_secret.sqs_secret.arn,
          aws_secretsmanager_secret.s3_secret.arn,
          aws_secretsmanager_secret.db_secret.arn
        ]
      }
    ]
  })
}

resource "aws_iam_policy" "s3_policy" {
  name = local.s3PolicyName
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "ListObjectsInBucket",
        "Effect" : "Allow",
        "Action" : [
          "s3:ListBucket"
        ],
        "Resource" : [
          aws_s3_bucket.coyote_audio_bucket.arn
        ]
      },
      {
        "Sid" : "AllObjectActions",
        "Effect" : "Allow",
        "Action" : [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject"
        ],
        "Resource" : [
          "${aws_s3_bucket.coyote_audio_bucket.arn}/*"
        ]
      }
    ]
  })
}
