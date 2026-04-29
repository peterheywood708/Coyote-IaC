resource "aws_secretsmanager_secret" "speech_secret" {
  name                           = local.speechSecretName
  force_overwrite_replica_secret = false
  recovery_window_in_days        = 30
}

resource "aws_secretsmanager_secret" "sqs_secret" {
  name                           = local.sqsSecretName
  force_overwrite_replica_secret = false
  recovery_window_in_days        = 30
}

resource "aws_secretsmanager_secret" "s3_secret" {
  name                           = local.s3SecretName
  force_overwrite_replica_secret = false
  recovery_window_in_days        = 30
}

resource "aws_secretsmanager_secret" "db_secret" {
  name                           = local.dbSecretName
  force_overwrite_replica_secret = false
  recovery_window_in_days        = 30
}
