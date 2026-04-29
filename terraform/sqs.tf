resource "aws_sqs_queue" "sqs_transcription_queue" {
  name             = local.sqsName
  max_message_size = 262144
}

resource "aws_sqs_queue" "sqs_label_queue" {
  name             = local.sqsName1
  max_message_size = 262144
}
