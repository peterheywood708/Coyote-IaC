resource "aws_s3_bucket" "coyote_audio_bucket" {
  bucket = local.coyoteAudioBucketName
}
