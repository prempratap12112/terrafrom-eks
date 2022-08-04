resource "aws_s3_bucket" "djangobucket" {
  bucket = "django-k8"
}



resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.djangobucket.id
  acl    = "public-read-write"
}
