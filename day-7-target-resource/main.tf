resource "aws_instance" "target" {
    ami = "ami-0ec0e125bb6c6e8ec"
    instance_type = "t2.micro"
    key_name = "ks"
  
}

resource "aws_s3_bucket" "target" {
    bucket = "ammuxyz"
  
}

#terraform apply -target = aws_s3_bucket.target

#terraform destroy -target =aws_s3_bucket.target
  
  
