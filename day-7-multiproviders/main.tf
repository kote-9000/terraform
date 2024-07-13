resource "aws_s3_bucket" "test" {
    bucket = "ammuabc"
  
}

resource "aws_s3_bucket" "test2" {
    bucket = "nehaabc"
    provider = aws.america
  
}