resource "aws_s3_bucket" "djangobucket" {
  bucket = "django-k8"
}



resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.djangobucket.id
  acl    = "public-read-write"
  

}

resource "aws_s3_bucket_policy" "django-k8-policy" {
  bucket = aws_s3_bucket.djangobucket.bucket
  policy     = <<EOF
  {
    "Version": "2012-10-17",
     "Statement": [
         {
             "Sid": "Allow All",
             "Effect": "Allow",
             "Principal": "*",
             "Action": "s3:*",
             "Resource": "arn:aws:s3:::$bucket/*"
         }
     ]
}
EOF
}
