locals {
  # IAM Policies
  sqsPolicyName     = "Cognito-SQS-Policy"
  secretsPolicyName = "secretsreadlist"
  s3PolicyName      = "S3-ListReadWrite"

  # IAM Users
  iamSecretsUserName = "cognito-secrets"
  iamS3UserName      = "coyote-app-s3"
  iamSQSUserName     = "coyote-sqs-api"

  # SQS Queues
  sqsName  = "transcriptionJobs"
  sqsName1 = "labelJobs"

  # Secrets Manager
  speechSecretName = "prod/coyote/speech"
  sqsSecretName    = "prod/coyote/sqs"
  s3SecretName     = "prod/coyote/s3"
  dbSecretName     = "prod/coyote/db"

  # S3 Bucket
  coyoteAudioBucketName = "coyote-audio-s3"

  # Cognito
  cognitoUserPoolName = "User pool - 5gxr5"
}
