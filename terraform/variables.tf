locals {
  sqsPolicyName         = "Cognito-SQS-Policy"
  secretsPolicyName     = "secretsreadlist"
  s3PolicyName          = "S3-ListReadWrite"
  sqsName               = "transcriptionJobs"
  sqsName1              = "labelJobs"
  speechSecretName      = "prod/coyote/speech"
  sqsSecretName         = "prod/coyote/sqs"
  s3SecretName          = "prod/coyote/s3"
  dbSecretName          = "prod/coyote/db"
  coyoteAudioBucketName = "coyote-audio-s3"
}
